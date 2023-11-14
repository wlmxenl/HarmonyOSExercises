import hilog from '@ohos.hilog';
import CommonConstants from '../../common/constant/CommonConstants'
import { ProjectTypeBean } from './ProjectModes'
import ProjectViewModel from './ProjectViewModel'

@Component
export default struct TabBar {
  @State tabBarArray: ProjectTypeBean[] = new Array<ProjectTypeBean>();

  aboutToAppear() {
    ProjectViewModel.getProjectTypeList()
      .then((typeList: ProjectTypeBean[]) => {
        this.tabBarArray = typeList
        for (const item of this.tabBarArray) {
          hilog.info(0, "project", item.name)
        }

      })
      .catch(() => {
        this.tabBarArray = []
      })
  }

  build() {
    Tabs() {

    }
    .barHeight("50vp")
    .barMode(BarMode.Scrollable)
    .barWidth(CommonConstants.FULL_PARENT)
    .vertical(false)
    .onChange((index: number) => {

    })
  }
}