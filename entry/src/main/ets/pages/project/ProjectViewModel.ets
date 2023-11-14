import { httpRequestGet } from '../../common/http/HttpUtils';
import { ProjectTypeBean, ResponseResult } from './ProjectModes';

export class ProjectViewModel {

  getProjectTypeList(): Promise<ProjectTypeBean[]> {
    return new Promise((resolve: Function) => {
      httpRequestGet("https://www.wanandroid.com/project/tree/json")
        .then((data: ResponseResult) => {
          if (data.errorCode === 0) {
            resolve(data.data)
          } else {
            resolve(new Array<ProjectTypeBean>())
          }
        })
        .catch(() => {
          resolve(new Array<ProjectTypeBean>())
        })
    })
  }
}

export default new ProjectViewModel()