@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State counter: number = 0
  @State avatarUrl: string = "https://avatars.githubusercontent.com/u/472311?v=4"
  @State nickname: string = "phodal"
  @State lastMessage: string = "hello,world"

  build() {
    // 生成一个经典的前端 counter
    // Column({}) {
    //   Text('Blog Title').fontSize(24).fontWeight(FontWeight.Bold)
    //   Text('Author: John Doe').fontSize(18).fontColor(Color.Blue)
    //   Text('Published Date: July 1, 2022').fontSize(18).fontColor(Color.Blue)
    //   Image('blog_image.jpg').width('100%').height(300)
    //   Text('Blog Content goes here...').fontSize(18)
    //   Button('Like', { type: ButtonType.Normal, stateEffect: true })
    //     .borderRadius(8)
    //     .backgroundColor(0xFF0000)
    //     .width(100)
    //     .height(40)
    // }.width('100%').margin(20).padding({ left: 20, right: 20 })

    // 生成一个聊天列表页，item 需要包含头像、昵称、最后一条聊天记录，尽可能让页面美观
    // Row() {
    //   List({ space: 10 }) {
    //     ListItem() {
    //       Row({ space: 20 }) {
    //         Image(this.avatarUrl)
    //           .width(40)
    //           .height(40)
    //         Column() {
    //           Text(this.nickname)
    //             .fontSize(16)
    //             .fontWeight('bold')
    //           Text(this.lastMessage)
    //             .fontSize(12)
    //             .fontColor('#666666')
    //         }
    //       }
    //     }
    //   }
    //   .width('100%')
    //   .height(200)
    //   .padding(10)
    //   .backgroundColor(Color.Pink)
    // }

    // 生成 Search 组件，可以设置placeholder文本样式和颜色、搜索框内文本样式，以及submit和onChange等方法触发时的操作。
    Column() {
      TextInput()
        // .placeholder('请输入搜索内容')
        .placeholderFont({ size: 16, weight: 400 })
        .placeholderColor(Color.Grey)
        .fontColor(Color.Black)
        .fontSize(18)
        .width('100%')
        .height(40)
        .margin(10)
        .onChange((value: string) => {
          console.log(value);
          // Perform onChange action
        });
      Button('搜索', { type: ButtonType.Normal })
        .width(80)
        .height(36)
        .onClick(() => {
          // Perform submit action
        })
        .margin(10);
    }

    // 音乐专辑主页
    // 头部返回栏: 因元素单一、位置固定在顶部，因此适合采用自适应拉伸，充分利用顶部区域。
    // 专辑封面: 使用栅格组件控制占比，在小尺寸屏幕下封面图与歌单描述在同一行。
    // 歌曲列表: 使用栅格组件控制宽度，在小尺寸屏幕下宽度为屏幕的100%，中尺寸屏幕下宽度为屏幕的50%，大尺寸屏幕下宽度为屏幕的75%。
    // 播放器: 采用自适应拉伸，充分使用底部区域。
  }
}