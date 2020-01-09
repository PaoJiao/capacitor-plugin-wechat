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
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.success([
            "value": value
        ])
    }
    
    @objc func loginToWx(_ call: CAPPluginCall) {
        if WechatManager.shared.isInstalled(){
            print("yes");
        }else{
            print("no");
        }
       WechatManager.appid = "wx7cc21f33633fa22f"
       WechatManager.appSecret = "xxxxx"

        WechatManager.shared.getUserInfo { result in
      switch result {
      case .failure(let errCode)://获取失败
          print(errCode)
      case .success(let value)://获取成功 value为([String: String]) 微信用户基本信息
          print(value) //当前是在子线程，如需回到主线程调用 DispatchQueue.main.async { print(value) }
      }
  }
        
        
        //WXApi.registerApp("wx7cc21f33633fa22f",universalLink:"https://agent.beijingmj.com/lexun-launchvideo1plus"); //改成你实际的AppID
    }
}
