# 理解 HarmonyOS 应用与生成式 AI 能力

## 理解 HarmonyOS 应用

HarmonyOS 应用的组成：

- 语言。ArkTS 是鸿蒙生态中基于 TypeScript 扩展的应用开发语言。
- UI 框架。ArkUI 是一套构建分布式应用界面的声明式 UI 开发框架。它与我们先前引入的 AutoPage 并没有太多的区别，可以结合思维链进行代码和
  UI 生成。

对应的支撑工具包含：

- IDE。DevEco Studio 是 HarmonyOS 应用开发的集成开发环境，提供了代码编辑、编译构建、调试、模拟器等一系列开发工具。
- 构建工具。DevEco Hvigor 是使用 TypeScript 语言开发的全新轻量化的任务调度工具，针对 HarmonyOS 应用提供了一系列编译构建任务，支持将
  HarmonyOS 应用编译构建出对应的产物包。
- 模拟器。使用远程模拟器支持JS、ArkTS单语言调试和JS+Java跨语言调试能力；使用本地模拟器支持JS和C++的调试；同时还支持分布式应用/服务的跨设备调试，帮助开发者更方便、高效的调试应用/服务。
- OHPM 包管理器。OHPM CLI（OpenHarmony Package Manager Command-line Interface） 作为鸿蒙生态三方库的包管理工具，支持共享包的发布、安装和依赖管理。

### 应用组件入口：UIAbility

> UIAbility 组件是一种包含 UI 界面的应用组件，主要用于和用户交互。UIAbility 组件是系统调度的基本单元，为应用提供绘制界面的窗口；
> 一个 UIAbility 组件中可以通过多个页面来实现一个功能模块。每一个 UIAbility 组件实例， 都对应于一个最近任务列表中的任务。

文档：[UIAbility 组件](https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V2/uiability-overview-0000001477980929-V2)

每个 UIAbility 类实例都会与一个 WindowStage 类实例绑定，该类起到了应用进程内窗口管理器的作用。它包含一个主窗口。
也就是说 UIAbility 通过 WindowStage 持有了一个窗口，该窗口为 ArkUI 提供了绘制区域。

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

    // 设置 UI 界面加载
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

### HarmonyOS 布局：ArkUI

> 方舟开发框架（简称 ArkUI）为 HarmonyOS 应用的 UI 开发提供了完整的基础设施，包括简洁的UI语法、丰富的 UI 功能（组件、布局、动画以及交互事件），
> 以及实时界面预览工具等，可以支持开发者进行可视化界面开发。

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


