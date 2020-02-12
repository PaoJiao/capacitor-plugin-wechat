import Foundation
import Capacitor
//import openSDK
import WechatKit

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */

@objc(wechat)
public class wechat: CAPPlugin {
    static var staticSelf:wechat?
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.success([
            "value": value
        ])
    }

    public override func load() {
        //WXApi.registerApp("wx7cc21f33633fa22f",universalLink:"https://agent.beijingmj.com/lexun-launchvideo1plus");
        //WechatManager.shared.handleOpenURL(url)
        wechat.staticSelf = self
    }

    @objc func loginToWx(_ call: CAPPluginCall) {
        
        if isInstalled(){
            print("yes")
            /*  */
            let req = SendAuthReq()
            req.scope = "snsapi_userinfo"
            req.state = "akjdhflajksdhfl"
            WXApi.send(req)

            //WechatManager.shared.sendAuth()

        }
        else{
           print("no")
        }
    }

    public func isInstalled() -> Bool {
        //return WXApi.isWXAppInstalled()
        return WXApi.isWXAppInstalled()
    }

    // instance
    public static let shared: wechat = {
        let instalce = wechat()
        return instalce
    }()
    
    public func loginSucc( code:String ) -> Void {
        //ok
        if let controller = wechat.staticSelf {
            print("yes: "+"{\"code\":\""+code+"\"}");
            controller.bridge.triggerWindowJSEvent(eventName: "loginWXSucceed", data: "{\"code\":\""+code+"\"}")
        }
        return
    }
    
    public func loginFailed( errCode:Int ) -> Void {
        //ok
        if let controller = wechat.staticSelf {
            print("no: "+"{\"code\":"+"\(errCode)"+"}");
            controller.bridge.triggerWindowJSEvent(eventName: "loginWXFailed", data: "{\"code\":"+"\(errCode)"+"}")
        }
        return
    }
}
