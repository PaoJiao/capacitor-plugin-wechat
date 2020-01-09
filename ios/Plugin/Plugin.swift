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
    
    @objc func loginToWx(_ call: CAPPluginCall) {
        WXApi.isWXAppInstalled()
        
        
        //WXApi.registerApp("wx7cc21f33633fa22f",universalLink:"https://agent.beijingmj.com/lexun-launchvideo1plus"); //改成你实际的AppID
    }
}
