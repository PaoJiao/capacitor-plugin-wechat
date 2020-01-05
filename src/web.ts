import { WebPlugin } from '@capacitor/core';
import { wechatPlugin } from './definitions';

export class wechatWeb extends WebPlugin implements wechatPlugin {
  constructor() {
    super({
      name: 'wechat',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }
}

const wechat = new wechatWeb();

export { wechat };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(wechat);
