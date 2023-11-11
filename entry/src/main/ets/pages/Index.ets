import CommonConstant from '../common/constant/CommonConstant'
import router from '@ohos.router'
import hilog from '@ohos.hilog'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  onPageShow() {
    // 接收页面返回传递参数
    let resultParam = router.getParams()?.['src']
    if (resultParam) {
      hilog.info(0, "index", resultParam)
    }
  }

  build() {
    Row() {
      Column({ space: CommonConstant.COLUMN_SPACE }) {
        Button("Login")
          .fontSize(18)
          .onClick(() => {
            router.pushUrl({ url: "pages/login/LoginPage" })
          })

        Button("ToDoPage")
          .fontSize(18)
          .onClick(() => {
            router.pushUrl({ url: "pages/ToDoListPage", params: { "index": 0 } })
          })
      }
      .width(CommonConstant.FULL_LENGTH)
    }
    .height(CommonConstant.FULL_LENGTH)
  }
}