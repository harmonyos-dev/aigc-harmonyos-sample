# 理解 HarmonyOS 应用与 AIGC 能力 

## 理解 HarmonyOS 应用

### Ability 代码示例

```ArkTS
import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy() {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground() {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
```

### HarmonyOS 布局示例

```ArkTS
@Entry
@Component
struct Index {
  @State counter: number = 0

  build() {
    // 生成一个经典的前端 counter
    Column({}) {
      Text('Blog Title').fontSize(24).fontWeight(FontWeight.Bold)
      Text('Author: John Doe').fontSize(18).fontColor(Color.Blue)
      Text('Published Date: July 1, 2022').fontSize(18).fontColor(Color.Blue)
      Image('blog_image.jpg').width('100%').height(300)
      Text('Blog Content goes here...').fontSize(18)
      Button('Like', { type: ButtonType.Normal, stateEffect: true })
        .borderRadius(8)
        .backgroundColor(0xFF0000)
        .width(100)
        .height(40)
    }.width('100%').margin(20).padding({ left: 20, right: 20 })
  }
}
```


