
import Prompt from '@system.prompt'
import { ProjectTypeBean } from './ProjectModes'

@Component
export default struct ProjectList {
  private typeConfig: ProjectTypeBean

  build() {
    Column() {
      Text(this.typeConfig.id.toString())
        .fontWeight(FontWeight.Bold)
        .fontSize("24fp")
        .fontColor(Color.Blue)
    }
  }
}