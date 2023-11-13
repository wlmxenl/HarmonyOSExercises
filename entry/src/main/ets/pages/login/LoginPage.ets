import Prompt from '@system.prompt'
import router from '@ohos.router'
import CommonConstants from '../../common/constant/CommonConstants'


@Extend(TextInput) function inputStyle() {
  .placeholderColor("#999999")
  .height("45vp")
  .backgroundColor($r("app.color.page_background"))
  .fontSize("18fp")
  .width('80%')
  .margin({ top: "12vp" })
}

@Extend(Line) function lineStyle() {
  .width('80%')
  .height("1vp")
  .backgroundColor("#33182431")
}

@Extend(Text) function blueTextStyle() {
  .fontColor("#007DFF")
  .fontSize("14fp")
  .fontWeight(FontWeight.Medium)
}


@Entry
@Component
struct LoginPage {
  @State account: string = ''
  @State password: string = ''
  @State isShowProgress: boolean = false
  private timeOutId: number = -1

  login(): void {
    if (this.account == '' || this.password == '') {
      Prompt.showToast({message: "请输入账号或密码"})
    } else {
      this.isShowProgress = true
      // 模拟登录
      if (this.timeOutId == -1) {
        this.timeOutId = setTimeout(() => {
          this.isShowProgress = false
          this.timeOutId = -1
          router.replaceUrl({url: "pages/main/MainPage"})
        }, 2000)
      }
    }
  }

  aboutToDisappear() {
    clearTimeout(this.timeOutId);
    this.timeOutId = -1;
  }

  build() {
    Column() {
      Image($r("app.media.icon"))
        .width($r("app.float.logo_image_size"))
        .height($r("app.float.logo_image_size"))
        .margin({ top: $r("app.float.logo_margin_top"), bottom: $r("app.float.logo_margin_bottom") })

      Text("登录页面")
        .fontSize("24fp")
        .fontWeight(FontWeight.Medium)
        .fontColor("#333333")

      Text("登录账号以使用更多服务")
        .fontSize("16fp")
        .fontWeight(FontWeight.Medium)
        .margin({ top: "8vp" })
        .fontColor("#999999")

      TextInput({ placeholder: "账号" })
        .maxLength(11)
        .type(InputType.Number)
        .inputStyle()
        .onChange((value: string) => {
          this.account = value
        })

      Line().lineStyle()

      TextInput({ placeholder: "密码" })
        .type(InputType.Password)
        .inputStyle()
        .onChange((value: string) => {
          this.password = value
        })
      Line().lineStyle()

      Row() {
        Text("短信验证码登录").blueTextStyle()
        Text("忘记密码").blueTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width("80%")
      .margin({ top: "8vp" })

      Button("登录", { type: ButtonType.Capsule, stateEffect: true })
        .margin({ top: "30vp" })
        .width("80%")
        .onClick(() => {
          this.login()
        })

      Text("注册账号")
        .blueTextStyle()
        .fontSize("16fp")
        .margin({ top: "8vp" })

      if (this.isShowProgress) {
        LoadingProgress()
          .alignSelf(ItemAlign.Center)
          .width("80vp")
          .height("80vp")
          .color("#3997ff")
      }

      Blank()

      Text("其他登录方式")
        .fontSize("14vp")
        .fontColor("#999999")

      Row({ space: "20vp" }) {
        Button("1", { type: ButtonType.Circle })
          .fontColor(Color.White)
          .backgroundColor("#dedede")

        Button("2", { type: ButtonType.Circle })
          .fontColor(Color.White)
          .backgroundColor("#dedede")

        Button("3", { type: ButtonType.Circle })
          .fontColor(Color.White)
          .backgroundColor("#dedede")
      }
      .margin({ top: "12vp" })
    }
    .backgroundColor($r("app.color.page_background"))
    .height(CommonConstants.FULL_PARENT)
    .width(CommonConstants.FULL_PARENT)
    .padding({
      left: $r("app.float.page_padding_hor"),
      right: $r("app.float.page_padding_hor"),
      bottom: $r("app.float.login_page_padding_bottom")
    })
  }
}