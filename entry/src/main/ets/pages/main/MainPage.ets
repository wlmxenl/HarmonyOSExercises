import CommonConstant from '../../common/constant/CommonConstant'
import Home from '../home/Home'
import Mine from '../mine/Mine'

@Entry
@Component
struct MainPage {
  @State currentIndex: number = 0

  @Builder TabItem(name: string, index: number, selectedImage: Resource, normalImage: Resource) {
    Column() {
      Image(this.currentIndex == index ? selectedImage : normalImage)
        .width($r("app.float.mainPage_tabWidth"))
        .height($r("app.float.mainPage_tabWidth"))

      Text(name)
        .margin({ top: 1 })
        .fontColor(this.currentIndex == index ? "#3997ff" : "#999999")
    }
    .height($r("app.float.mainPage_barHeight"))
    .padding({ left: 10, right: 10 })
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        Home()
      }
      .tabBar(this.TabItem("首页", 0, $r("app.media.home_selected"), $r("app.media.home_normal")))


      TabContent() {
        Mine()
      }
      .tabBar(this.TabItem("我的", 1, $r("app.media.mine_selected"), $r("app.media.mine_normal")))
    }
    .vertical(false)
    .backgroundColor(Color.White)
    .barHeight($r("app.float.mainPage_barHeight"))
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }
}