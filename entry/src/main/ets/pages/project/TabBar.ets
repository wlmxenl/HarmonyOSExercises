import hilog from '@ohos.hilog';
import CommonConstants from '../../common/constant/CommonConstants'
import ProjectList from './ProjectList';
import { ProjectTypeBean } from './ProjectModes'
import ProjectViewModel from './ProjectViewModel'

@Component
export default struct TabBar {
  @State tabBarArray: ProjectTypeBean[] = new Array<ProjectTypeBean>()
  @State currentIndex: number = 0

  aboutToAppear() {
    ProjectViewModel.getProjectTypeList()
      .then((typeList: ProjectTypeBean[]) => {
        this.tabBarArray = typeList.slice(0, 3)
        for (const item of this.tabBarArray) {
          hilog.info(0, "project", item.name)
        }

      })
      .catch(() => {
        this.tabBarArray = []
      })
  }

  @Builder TabBuilder(index: number) {
    Column() {
      Text(this.tabBarArray[index].name)
        .height(CommonConstants.FULL_PARENT)
        .padding({ left:  index == 0 ? "16vp" : "8vp" , right: "8vp" })
        .fontSize(this.currentIndex == index ? "26fp" : "18fp")
        .fontColor(this.currentIndex == index ? "#333333" : "#666666")
    }
  }

  build() {
    Tabs() {
      ForEach(this.tabBarArray, (item: ProjectTypeBean, index: number) => {
        TabContent() {
          ProjectList({typeConfig: item})
        }
        .tabBar(this.TabBuilder(index))
      })
    }
    .barHeight("50vp")
    .barMode(BarMode.Scrollable)
    .barWidth(CommonConstants.FULL_PARENT)
    .vertical(false)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}