
import http from '@ohos.net.http';
import { ResponseResult } from '../../pages/project/ProjectModes';

export function httpRequestGet(url: string): Promise<ResponseResult> {
  let httpRequest = http.createHttp()
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.GET,
    header: {
      'Content-Type': 'application/json'
    },
    extraData: {}
  })
  let serverData: ResponseResult = new ResponseResult()
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode == http.ResponseCode.OK) {
      let result = `${value.result}`;
      return JSON.parse(result);
    } else {
      serverData.errorMsg = `errorCode = ${value.responseCode}`
      return serverData
    }
  }).catch(() => {
    serverData.errorMsg = "请求失败"
    return serverData
  })
}