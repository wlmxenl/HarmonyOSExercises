import CommonConstant from '../common/constant/CommonConstant'
import TodoItem from '../view/TodoItem'
import DataModel from '../viewmodel/DataModel'

@Entry
@Component
struct ToDoListPage {
  private todoTasks: Array<string> = []

  aboutToAppear() {
    this.todoTasks = DataModel.getData()
  }

  build() {
    Column({space: CommonConstant.COLUMN_SPACE}) {
      Text("待办")
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Black)
        .width(CommonConstant.LIST_DEFAULT_WIDTH)
        .textAlign(TextAlign.Start)
        .margin({top: CommonConstant.COLUMN_SPACE})

      ForEach(this.todoTasks, (item: string) => {
        TodoItem({content: item})
      }, (item: string) => JSON.stringify(item))
    }
    .width(CommonConstant.FULL_LENGTH)
    .height(CommonConstant.FULL_LENGTH)
    .backgroundColor($r("app.color.page_background"))
  }
}