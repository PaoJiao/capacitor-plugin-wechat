declare module "@capacitor/core" {
  interface PluginRegistry {
    wechat: wechatPlugin;
  }
}

export interface wechatPlugin {
  echo(options: { value: string }): Promise<{value: string}>;
  loginToWx(options: { value: string }): Promise<{value: string}>;
}
