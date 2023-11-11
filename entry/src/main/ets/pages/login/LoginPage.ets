import CommonConstant from '../../common/constant/CommonConstant'

@Entry
@Component
struct LoginPage {
  @State account: string = ""

  build() {
    Column() {
      TextInput({ placeholder: "账号" })
        .maxLength(11)
        .type(InputType.Number)
        .backgroundColor(Color.White)
        .margin(16)
        .height(50)
        .caretColor(Color.Red)
        .onChange((value: string) => {
          this.account = value
        })

      TextInput({ placeholder: "密码" })
        .type(InputType.Password)
        .backgroundColor(Color.White)
        .margin({left: 16, right: 16})
        .height(50)
        .onChange((value: string) => {
        })

      Button($r("app.string.login_text"), {type: ButtonType.Capsule })
        .width("75%")
        .margin({top: 20})
        .onClick(() => {

        })
    }
    .height(CommonConstant.FULL_LENGTH)
    .width(CommonConstant.FULL_LENGTH)
    .backgroundColor($r("app.color.page_background"))
  }
}