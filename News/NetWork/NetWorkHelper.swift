//
//  NetWorkHelper.swift
//  News
//
//  Created by 鲁成龙 on 2020/4/28.
//  Copyright © 2020 鲁成龙. All rights reserved.
//

import Foundation
import Alamofire



enum BaseUrl : String {

#if DEBUG
    case MainApi = "http://www.cdtv.com/"
    case VideoApi = "http://testvideo.yitoutiao.net/"
    case ShopApi = "http://testshop.yitoutiao.net/"
    case LiveApi = "http://testlive.yitoutiao.net/"
    case EduAPi = "http://testedu.yitoutiao.net/"
    case UserApi = "http://testuser.yitoutiao.net/"
    case NewsApi = "http://testnews.yitoutiao.net/"
    case CommunityApi = "http://testcommunity.yitoutiao.net/"
    case WatchApi = "http://api.mudu.tv/"
    case HtmlApi = "http://testh5.yitoutiao.net/"
#else
    case MainApi = "http ://img2.yitoutiao.net/app/"
    case VideoApi = "http://video2.yitoutiao.net/"
    case ShopApi = "http://shop2.yitoutiao.net/"
    case LiveApi = "http://onlive.yitoutiao.net/"
    case EduAPi = "http://edu2.yitoutiao.net/"
    case UserApi = "http://user2.yitoutiao.net/"
    case NewsApi = "http://news2.yitoutiao.net/"
    case CommunityApi = "http://community.yitoutiao.net/"
    case WatchApi = "http://api.mudu.tv/"
    case HtmlApi = "http://img2.yitoutiao.net/"
#endif
}

enum RequestType {
    case Get
    case Post
}

typealias RequestSuccess =  () -> Void
typealias RequestFailure =  () -> Void


class NetWorkHelper {
    
    static var header : [String : String] = ["apptype" : "ios",
                                             "devid" : Tool.UUID()!,
                                             "version" : Tool.appCurrentVersion()]
    
    static let `default` : NetWorkHelper = NetWorkHelper()
    
    private var helperSession : Session!
    
    private init() {
        let configuration = URLSessionConfiguration()
        configuration.timeoutIntervalForRequest = 15
        helperSession = Session.init(configuration: configuration, delegate: SessionDelegate())
        
    }
    
    func requestWithGet(url : String, para : Parameters?, success : @escaping RequestSuccess , failure : @escaping RequestFailure){
        request(url: url, method: HTTPMethod.get, para: para, success: success, failure: failure)
    }
    
    func requestWithPost(url : String, para : Parameters?, success : @escaping RequestSuccess , failure : @escaping RequestFailure){
        request(url: url, method: HTTPMethod.post, para: para, success: success, failure: failure)
    }
    
    private func request(url : String , method : HTTPMethod , para : Parameters? , success : @escaping RequestSuccess , failure : @escaping RequestFailure){
        let headers = HTTPHeaders.init(self.requestHeader())
        helperSession.request(url, method: HTTPMethod.get, parameters: para, headers: headers).responseJSON { (response) in
            switch response.result {
                case .success:
                    if response.response?.statusCode == 200 {
                        success()
                    } else {
                        failure()
                    }
                case .failure:
                    failure()
            }
        }
    }
    
    
    func requestHeader() -> [String : String]{
        
        let encrypyKey = "1234567890123456"
        let rand = (arc4random() % 501) + 100000
        let time = Date().milliTimeStamp
        let deviceID = Tool.UUID()!
        let appVersion = Tool.appCurrentVersion()
        
        
        let signString = "apptype=ios&devid=\(deviceID)&nonce=\(rand)&time=\(time)&version=\(appVersion)"
        
        
        NetWorkHelper.header["sign"] = NSString.encrypyAES(signString, key: encrypyKey)
        NetWorkHelper.header["nonce"] = "\(rand)"
        NetWorkHelper.header["time"] = time
//        NetWorkHelper.header["token"] = ""
        return NetWorkHelper.header
    }
    
}
