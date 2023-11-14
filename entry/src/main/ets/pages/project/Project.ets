
import CommonConstants from '../../common/constant/CommonConstants'
import TabBar from './TabBar'
@Component
export default struct Project {

  build() {
    Column() {
      TabBar()
    }
    .width(CommonConstants.FULL_PARENT)
    .backgroundColor($r("app.color.page_background"))
    .justifyContent(FlexAlign.Center)
  }
}