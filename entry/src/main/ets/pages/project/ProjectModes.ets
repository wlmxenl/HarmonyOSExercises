export class ProjectTypeBean {
  id: number = 0
  name: string = ""
}

export class ResponseResult {
  errorMsg: string
  errorCode: number
  data: string | Object | ArrayBuffer;

  constructor() {
    this.errorCode = -1
    this.errorMsg = ""
    this.data = ""
  }
}