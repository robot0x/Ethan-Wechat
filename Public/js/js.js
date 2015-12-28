 /*从数组中移除元素
            sample code:
            var members = new array("zhangsan","lisi","wangwu");
            members.remove("zhangsan");
         */
 Array.prototype.remove = function() {
     var what, a = arguments,
         L = a.length,
         ax;
     while (L && this.length) {
         what = a[--L];
         while ((ax = this.indexOf(what)) !== -1) {
             this.splice(ax, 1);
         }
     }
     return this;
 };


/**
 * uploaderDelete监听点击事件
 * @return {[type]} [description]
 */
 var uploaderDeleteClick = function() {
     $(".uploaderDelete").each(function() {
         this.addEventListener("click", function() {
             $(this).parent().remove();
             var file = $("#" + $(this).attr("data-file"));
             var url = $(this).attr("data-url");
             file.val(file.val().split(",").remove(url).join(","));
         })
     });
 }
 //实例化
 uploaderDeleteClick();


 /**
  * 依据data返回URL值，添加代码
  * @param {[object]} file     [上传文件回传信息]
  * @param {[json string]} data     [uediter返回字符串]
  * @param {[object]} response [uploadify响应请求信息]
  * @param {[string]} fileId 用以存附件的字符串   
  * @param {string}  dom DOM的追加位置
  */
 var addHtml = function(file, data, response, fileId) {
     if (fileId === undefined) {
         fileId = "file";
     }
     var fileArray = new Array();
     var fileValue = $("#" + fileId).val();
     if (fileValue !== "") {
         fileArray = fileValue.split(",");
     }
     var jsonData = JSON.parse(data);
     if (jsonData.state === 'SUCCESS') {
         $("#" + fileId + "_img ul").append('<li><a href="'+jsonData.url+'" target="_blank"><img src="' + jsonData.url + '" class="img-rounded" /></a><button type="button" data-url="' + jsonData.url + '" data-file="' + fileId + '" class="uploaderDelete btn btn-danger btn-xs"><i class="fa fa-times"></i></button></li>');
     }

     fileArray.push(jsonData.url);
     $("#" + fileId).val(fileArray.join(","));
     uploaderDeleteClick();
 }

/**
 * uploaer 实例化
 * @param  {string} ROOT     调用uploader根路径
 * @param  {string} id       操作的DOM关键字
 * @param  {sting} btnClass 按钮额外的CLASS
 * @param  {string} btnText  按钮显示文字
 * @return {void}          [description]
 */
 var uploader = function(ROOT, id, btnClass, btnText) {
     if (id === undefined) {
         id = "file";
     }

     var fileId = id + '_upload';
     if (btnClass === undefined) {
         btnClass = "btn btn-primary";
     }

     if (btnText === undefined) {
         btnText = "选择图片";
     }
     $('#' + fileId).uploadify({
         'removeTimeout': 3,
         'buttonText': btnText,
         'buttonClass': btnClass,
         'fileObjName': 'yunzhifile',
         'swf': ROOT + '/lib/uploadify/uploadify.swf',
         'uploader': ROOT + '/yunzhi.php/ueditor/index?action=uploadimage',
         'debug': false,
         'onUploadError': function(file, errorCode, errorMsg, errorString) {
             alert('The file ' + file.name + ' could not be uploaded: ' + errorString);
         },
         'onUploadSuccess': function(file, data, response) {
             addHtml(file, data, response, id);
         },
     });
 }
