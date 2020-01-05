package com.lxlx.capicitor.plugin.wechat;

import android.util.Log;

import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.tencent.mm.opensdk.modelmsg.SendAuth;
import com.tencent.mm.opensdk.openapi.IWXAPI;
import com.tencent.mm.opensdk.openapi.WXAPIFactory;

@NativePlugin()
public class wechat extends Plugin {
    private IWXAPI api;

    @PluginMethod()
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", value);
        call.success(ret);
    }

    @PluginMethod()
    public void loginToWx(PluginCall call) {
        Log.e("WxLoginPlugin","-------------------------======loginToWx:");
        //请求响应权限'
        api = WXAPIFactory.createWXAPI(getContext(), "wx7cc21f33633fa22f", false);
        api.registerApp("wx7cc21f33633fa22f");

        SendAuth.Req req = new SendAuth.Req();
        req.scope = "snsapi_userinfo";
        req.state = "wechat_sdk_demo_test";
        api.sendReq(req);
    }
}
