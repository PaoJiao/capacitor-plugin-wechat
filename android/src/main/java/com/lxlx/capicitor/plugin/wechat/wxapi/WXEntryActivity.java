package __PACKAGE_NAME__;
//package com.lxlx.video1plus.wxapi;


//import org.cocos2dx.lua.AppActivity;
import android.util.Log;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Toast;

import com.tencent.mm.opensdk.constants.ConstantsAPI;
import com.tencent.mm.opensdk.modelbase.BaseReq;
import com.tencent.mm.opensdk.modelbase.BaseResp;
import com.tencent.mm.opensdk.modelmsg.SendAuth;
import com.tencent.mm.opensdk.openapi.IWXAPI;
import com.tencent.mm.opensdk.openapi.IWXAPIEventHandler;
import com.tencent.mm.opensdk.openapi.WXAPIFactory;

import android.support.v4.content.LocalBroadcastManager;

public class WXEntryActivity extends Activity implements IWXAPIEventHandler{

	private static String TAG = "MicroMsg.WXEntryActivity";

	private IWXAPI api;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		Log.e("WxLoginPlugin","-------------------------======onCreate:");
		api = WXAPIFactory.createWXAPI(this, "wx7cc21f33633fa22f", false);

		try {
			Intent intent = getIntent();
			api.handleIntent(intent, this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	protected void onNewIntent(Intent paramIntent)
	{
		super.onNewIntent(paramIntent);
		setIntent(paramIntent);
		api.handleIntent(paramIntent, this);
	}

	@Override
	public void onReq(BaseReq arg0) {
		// TODO Auto-generated method stub
		System.out.println("onreq call!");
	}

	@Override
	public void onResp(BaseResp resp) {
		Log.e("WxLoginPlugin","-------------------------======onResp:"+resp.errCode);

		Intent intent = new Intent("wxResp");
		switch(resp.errCode){
			case BaseResp.ErrCode.ERR_OK:
				String code = ((SendAuth.Resp) resp).code; // 这里的code就是接入指南里要拿到的code
				intent.putExtra("type", resp.getType());
				intent.putExtra("errcode", resp.errCode);
				if (resp.getType() == ConstantsAPI.COMMAND_SENDAUTH)//登陆回调
				{
					intent.putExtra("code", code);
				}
				LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(intent);
				break;
			case BaseResp.ErrCode.ERR_USER_CANCEL:
				intent.putExtra("type", resp.getType());
				intent.putExtra("errcode", resp.errCode);
				LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(intent);
				break;
			case BaseResp.ErrCode.ERR_AUTH_DENIED:
				intent.putExtra("type", resp.getType());
				intent.putExtra("errcode", resp.errCode);
				LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(intent);
				break;
			default:

				break;
		}

		finish();
	}


//    @Override
//    public void onResp(BaseResp resp) {
//    	System.out.println("onresp call!");
//        switch (resp.errCode) {
//        case BaseResp.ErrCode.ERR_OK:
////      可用以下两种方法获得code
////      resp.toBundle(bundle);
////      Resp sp = new Resp(bundle);
////      String code = sp.code;<span style="white-space:pre">
////      或者
//        	SendAuth.Resp newResp = (SendAuth.Resp) resp;
////        	String code = ((SendAuth.Resp) resp).;
//            //上面的code就是接入指南里要拿到的code
//            Toast.makeText(this, "call back!", Toast.LENGTH_LONG).show();
//            break;
//
//        default:
//            break;
//        }
//
//    }
}
