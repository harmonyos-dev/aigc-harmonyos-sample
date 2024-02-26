@Entry
@Component
struct Index {
  @State message: string = 'Hello World'
  @State count: number = 0
  @State avatarUrl: string = "https://avatars.githubusercontent.com/u/472311?v=4"
  @State nickname: string = "phodal"
  @State lastMessage: string = "hello,world"
  @State albumCoverUrl: string = "https://avatars.githubusercontent.com/u/472311?v=4"
  @State albumTitle: string = 'Music Album'
  @State albumDescription: string = 'This is a collection of great songs'
  @State songs: any[] = [
    { id: 1, title: 'Song 1', artist: 'Artist 1' },
    { id: 2, title: 'Song 2', artist: 'Artist 2' },
    { id: 3, title: 'Song 3', artist: 'Artist 3' },
    { id: 4, title: 'Song 4', artist: 'Artist 4' },
    { id: 5, title: 'Song 5', artist: 'Artist 5' },
  ]
  @State chatList: any[] = [
    {
      avatar: "https://avatars.githubusercontent.com/u/472311?v=4",
      nickname: "phodal",
      lastMessage: "Hello, world"
    }
  ]

  build() {
    // case 1: 生成一个经典的前端 counter
    Column({ space: 12 }) {
      Text(this.count.toString())
        .fontSize(20)
        .textAlign(TextAlign.Center)
        .width('100%')

      Row({ space: 12 }) {
        Button('-', { type: ButtonType.Normal, stateEffect: true })
          .onClick(() => {
            this.count -= 1;
          }).width(50).height(30)

        Button('+', { type: ButtonType.Normal, stateEffect: true })
          .onClick(() => {
            this.count += 1;
          }).width(50).height(30)
      }
    }
    .width("100%")
    .height(250)
    .backgroundColor(0xFFFFFF)
    .padding({ left: 10, top: 10, right: 10, bottom: 10 })

    // case 2: 生成一个聊天列表页，item 需要包含头像、昵称、最后一条聊天记录，尽可能让页面美观
    // List({ space: 20, initialIndex: 0 }) {
    //   ForEach(this.chatList, (item) => {
    //     ListItem() {
    //       Row() {
    //         Image(item.avatar)
    //           .width(50)
    //           .height(50)
    //         Column() {
    //           Text(item.nickname)
    //             .padding({ left: 4 })
    //             .fontSize(20)
    //             .alignSelf(ItemAlign.Start)
    //             .fontWeight(FontWeight.Bold)
    //           Text(item.lastMessage)
    //             .padding({ left: 4 })
    //             .alignSelf(ItemAlign.Start)
    //             .fontSize(16)
    //         }
    //         .width('80%')
    //       }
    //       .padding(10)
    //       .backgroundColor('white')
    //     }
    //     .backgroundColor('gray')
    //   }, (item) => item.id)
    // }
    // .listDirection(Axis.Vertical)
    // .divider({ strokeWidth: 2, color: 0xFFFFFF, startMargin: 20, endMargin: 20 })
    // .edgeEffect(EdgeEffect.Spring)
    // .onScrollIndex((firstIndex: number, lastIndex: number) => {
    //   console.info('first' + firstIndex)
    //   console.info('last' + lastIndex)
    // })
    // .width('100%')
    // .height('100%')

    // case 3: 音乐专辑主页
    // 头部返回栏: 因元素单一、位置固定在顶部，因此适合采用自适应拉伸，充分利用顶部区域。
    // 专辑封面: 使用栅格组件控制占比，在小尺寸屏幕下封面图与歌单描述在同一行。
    // 歌曲列表: 使用栅格组件控制宽度，在小尺寸屏幕下宽度为屏幕的100%，中尺寸屏幕下宽度为屏幕的50%，大尺寸屏幕下宽度为屏幕的75%。
    // 播放器: 采用自适应拉伸，充分使用底部区域。
    // 头部返回栏
    // Column({ space: 20 }) {
    //   Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
    //     Text('back')
    //       .onClick(() => {
    //         // goBack();
    //       })
    //       .margin({ left: 10 });
    //     Text('音乐专辑主页')
    //       .fontSize(20)
    //       .fontWeight(FontWeight.Bold);
    //     Text('menu')
    //       .onClick(() => {
    //         // showMenu();
    //       })
    //       .margin({ right: 10 });
    //   }.width('100%')
    //   .padding({ top: 10, bottom: 10 })
    //   .backgroundColor(0xFFFFFF);
    //
    //   // 专辑封面
    //   GridRow() {
    //     GridCol() {
    //       Image(this.albumCoverUrl)
    //         .width('100%')
    //         .height('100%');
    //     }.width('100%')
    //     .height(200);
    //
    //     GridCol() {
    //       Column() {
    //         Text(this.albumTitle)
    //           .fontSize(20)
    //           .fontWeight(FontWeight.Bold);
    //         Text(this.albumDescription)
    //           .fontSize(14);
    //       }.width('70%')
    //       .height(200)
    //       .padding({ left: 10, top: 10, right: 10, bottom: 10 })
    //       .backgroundColor('#F5F5F5');
    //     }.width('70%')
    //     .height(200);
    //   }.width('90%')
    //   .margin(10);
    //
    //   // 歌曲列表
    //   GridRow() {
    //     ForEach(this.songs, (song) => {
    //       GridCol() {
    //         Row() {
    //           Text(song.title)
    //             .fontSize(16);
    //           Text(song.artist)
    //             .fontSize(14)
    //             .fontColor('#888888')
    //             .margin({ left: 5 });
    //         }.width('100%')
    //         .height(50)
    //         .padding({ left: 10 });
    //       }.backgroundColor('#F5F5F5');
    //     });
    //   }.width('100%')
    //   .padding({ top: 10, bottom: 10 })
    //   .backgroundColor('#F5F5F5');
    //
    //   // 播放器
    //   Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center }) {
    //     Text('previous')
    //       .onClick(() => {
    //         // playPreviousSong();
    //       });
    //     Text('play')
    //       .onClick(() => {
    //         // playPause();
    //       })
    //       .margin({ left: 10, right: 10 });
    //     Text('next')
    //       .onClick(() => {
    //         // playNextSong();
    //       });
    //   }.width('100%')
    //   .padding({ top: 10, bottom: 10 })
    //   .backgroundColor(0xFFFFFF);
    // }.width('100%').height('100%')
  }
}