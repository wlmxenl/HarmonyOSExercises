import CommonConstant from '../common/constant/CommonConstants'
import TodoItem from '../view/TodoItem'
import DataModel from '../viewmodel/DataModel'
import router from '@ohos.router'
import hilog from '@ohos.hilog'

@Entry
@Component
struct ToDoListPage {
  private todoTasks: Array<string> = []

  aboutToAppear() {
    this.todoTasks = DataModel.getData()
    // 接受上级页面传递参数
    hilog.info(0x0000, "ToDoListPage", "--> " + router.getParams()?.['index'])
  }

  build() {
    Column({ space: CommonConstant.COLUMN_SPACE }) {
      Row() {
        Image($r("app.media.ic_back"))
          .objectFit(ImageFit.Contain)
          .padding(6)
          .width($r("app.float.action_bar_height"))
          .height($r("app.float.action_bar_height"))
          .onClick(() => {
            router.showAlertBeforeBackPage({
              message: 'Message Info'
            });
            router.back({ url: "", params: { "src": "todoList" } })
          })

        Text("待办")
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Black)
      }
      .align(Alignment.Start)
      .width(CommonConstant.FULL_PARENT)
      .margin({ top: CommonConstant.COLUMN_SPACE })


      ForEach(this.todoTasks, (item: string) => {
        TodoItem({ content: item })
      }, (item: string) => JSON.stringify(item))
    }
    .width(CommonConstant.FULL_PARENT)
    .height(CommonConstant.FULL_PARENT)
    .backgroundColor($r("app.color.page_background"))
  }
}