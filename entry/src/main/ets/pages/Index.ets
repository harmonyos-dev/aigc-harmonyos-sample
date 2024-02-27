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