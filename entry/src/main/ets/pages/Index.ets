@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State counter: number = 0
  @State avatarUrl: string = "https://avatars.githubusercontent.com/u/472311?v=4"
  @State nickname: string = "phodal"
  @State lastMessage: string = "hello,world"

  build() {
    // case 1: 生成一个经典的前端 counter

    // case 2: 生成一个聊天列表页，item 需要包含头像、昵称、最后一条聊天记录，尽可能让页面美观

    // case 3: 音乐专辑主页
    // 头部返回栏: 因元素单一、位置固定在顶部，因此适合采用自适应拉伸，充分利用顶部区域。
    // 专辑封面: 使用栅格组件控制占比，在小尺寸屏幕下封面图与歌单描述在同一行。
    // 歌曲列表: 使用栅格组件控制宽度，在小尺寸屏幕下宽度为屏幕的100%，中尺寸屏幕下宽度为屏幕的50%，大尺寸屏幕下宽度为屏幕的75%。
    // 播放器: 采用自适应拉伸，充分使用底部区域。
  }
}