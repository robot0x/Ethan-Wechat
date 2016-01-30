wx.config({
jsapiTicket: "{$M->signPackage['jsapiTicket']}",
      debug: true,
      appId:  "{$M->signPackage['appId']}",
      timestamp: "{$M->signPackage['timestamp']}",
      nonceStr: "{$M->signPackage['nonceStr']}",
      signature: "{$M->signPackage['signature']}",
      url: location.href.split('#')[0],
      jsApiList: [
      // 所有要调用的 API 都要加到这个列表中
      'previewImage','uploadImage','downloadImage','chooseImage','openLocation', 'getLocation','chooseWXPay'
      ]
     });