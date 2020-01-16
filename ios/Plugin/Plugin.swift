import Foundation
import Capacitor
//import openSDK
//import WechatKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */

@objc(wechat)
public class wechat: CAPPlugin {
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.success([
            "value": value
        ])
    }
    public override func load() {
        WXApi.registerApp("wx7cc21f33633fa22f",universalLink:"https://agent.beijingmj.com/lexun-launchvideo1plus");
    }
    @objc func loginToWx(_ call: CAPPluginCall) {
        
        //if WXApi.isWXAppInstalled(){
            print("yes")
            let req = SendAuthReq()
            req.scope = "snsapi_userinfo"
            req.state = "akjdhflajksdhfl"
            WXApi.send(req)
        //}
        //else{
        //    print("no")
        //}
        
        
        //WXApi.registerApp("wx7cc21f33633fa22f",universalLink:"https://agent.beijingmj.com/lexun-launchvideo1plus"); //改成你实际的AppID
    }
    
    public func handleOpenURL(_ url: URL) -> Bool {
        return WXApi.handleOpen(url, delegate: self)
    }
    
    
    public func handleOpenUniversalLink( userActivity: NSUserActivity) -> Bool {
        return WXApi.handleOpenUniversalLink(userActivity, delegate:self);
    }
}

// MARK: WeiChatDelegate

extension wechat: WXApiDelegate {
    /**
    收到一个来自微信的请求，第三方应用程序处理完后调用sendResp向微信发送结果
    * 收到一个来自微信的请求，异步处理完成后必须调用sendResp发送处理结果给微信。
    * 可能收到的请求有GetMessageFromWXReq、ShowMessageFromWXReq等。

    - parameter req: 具体请求内容，是自动释放的
    */

    public func onReq(_ req: BaseReq) {
    }
    /**
    发送一个sendReq后，收到微信的回应

    * 收到一个来自微信的处理结果。调用一次sendReq后会收到onResp。
    * 可能收到的处理结果有SendMessageToWXResp、SendAuthResp等

    - parameter resp: 具体的回应内容，是自动释放的
    */
    public func onResp(_ resp: BaseResp) {
        let a =10;
    }

}
