import CommonConstants from '../../common/constant/CommonConstants'
import homeViewModel from './HomeViewModel'
import ItemData from './ItemData'


@Component
export default struct Home {
  private swiperController: SwiperController = new SwiperController()

  build() {
    Scroll() {
      Column({ space: CommonConstants.COLUMN_SPACE }) {
        Text("首页")
          .padding({ left: "16vp" })
          .fontColor("#333333")
          .fontWeight(FontWeight.Medium)
          .fontSize("18fp")
          .width(CommonConstants.FULL_PARENT)
          .textAlign(TextAlign.Start)

        Swiper(this.swiperController) {
          ForEach(homeViewModel.getSwiperImages(), (img: Resource) => {
            Image(img)
              .objectFit(ImageFit.Auto)
              .borderRadius("16vp")
          }, (img: Resource) => JSON.stringify(img.id))
        }
        .height("260vp")
        .margin({ top: "16vp", left: "16vp", right: "16vp" })
        .interval(5000)
        .autoPlay(true)

        Grid() {
          ForEach(homeViewModel.getFirstGridData(), (item: ItemData) => {
            GridItem() {
              Column() {
                Image(item.img)
                  .width("24vp")
                  .height("24vp")
                Text(item.title)
                  .fontSize("12vp")
                  .margin({ top: "4vp" })
              }
            }
          }, (item: ItemData) => JSON.stringify(item))
        }
        .columnsGap("8vp")
        .rowsGap("12vp")
        .columnsTemplate("1fr 1fr 1fr 1fr")
        .padding({ top: "12vp", bottom: "12vp" })
        .height("124vp")
        .backgroundColor(Color.White)
        .margin({ left: "16vp", right: "16vp" })
        .borderRadius("24vp")

        Text("List")
          .fontSize("14fp")
          .fontWeight(FontWeight.Medium)
          .width(CommonConstants.FULL_PARENT)
          .padding({ left: "16vp", right: "16vp" })

        Stack() {
          Grid() {
            ForEach(homeViewModel.getSecondGridData(), (secondItem: ItemData) => {
              GridItem() {
                Column() {
                  Text(secondItem.title)
                    .fontSize("14fp")
                    .fontWeight(FontWeight.Medium)
                  Text(secondItem.others)
                    .margin({ top: "4vp" })
                    .fontSize( "12fp")
                    .fontColor("#99182431")
                }
                .alignItems(HorizontalAlign.Start)
              }
              .padding({ top: "8vp", left: "8vp" })
              .borderRadius("12vp")
              .align(Alignment.TopStart)
              .backgroundImage(secondItem.img)
              .backgroundImageSize(ImageSize.Cover)
              .width(CommonConstants.FULL_PARENT)
              .height(CommonConstants.FULL_PARENT)
            }, (secondItem: ItemData) => JSON.stringify(secondItem))
          }
          .width(CommonConstants.FULL_PARENT)
          .height("260vp")
          .columnsTemplate('1fr 1fr')
          .rowsTemplate('1fr 1fr')
          .columnsGap("8vp")
          .rowsGap("12vp")
          .margin({ bottom: "55vp" })
        }
        .margin({ left: "16vp", right: "16vp" })
      }
    }
    .backgroundColor($r("app.color.page_background"))
    .height(CommonConstants.FULL_PARENT)
  }
}