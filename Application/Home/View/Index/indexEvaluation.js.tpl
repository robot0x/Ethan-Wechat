app.controller("EvaluationingCtrl", function($scope,$http){
  console.log('EvaluationingCtrl');
  $scope.upload = function(){
    $http.get('api.php/Index/getJssdk')
    .success(function(data,status){
     wx.config({
jsapiTicket: data.jsapiTicket,
      debug: true,
      appId:  data.appId,
      timestamp: data.timestamp,
      nonceStr: data.nonceStr,
      signature: data.signature,
      url: location.href.split('#')[0],
      jsApiList: [
      // 所有要调用的 API 都要加到这个列表中
      'previewImage','uploadImage','downloadImage','chooseImage'
      ]
     });

     wx.ready(function () {
      // 在这里调用 API

      //选择图片
  var images = {
      localId: [],
      serverId: []
   };
       wx.chooseImage({
        success: function (res) {
            images.localId = res.localIds;
          alert('已选择 ' + res.localIds.length + ' 张图片');

            if (images.localId.length == 0) {
            alert('请先使用 chooseImage 接口选择图片');
            return;
        }
        var i = 0, length = images.localId.length;
        images.serverId = [];
        function upload() {
          wx.uploadImage({
            localId: images.localId[i],
            success: function (res) {
                i++;
                alert('已上传：' + i + '/' + length);
                images.serverId.push(res.serverId);
                if (i < length) {
                  upload();
                }
                 $http.get('api.php/Evaluation/uploadImage')
                 .success(function(data,status){
                      alert('data');
                 })
            },
            fail: function (res) {
                alert(JSON.stringify(res));
            }
          });
      }
         upload();
         } 
     });
  
    
    });  
  })
  .error(function(data,status){

   });
 };
});