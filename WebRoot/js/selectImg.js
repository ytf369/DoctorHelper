      //js本地图片预览，兼容ie[6-9]、火狐、Chrome17+、Opera11+、Maxthon3  
      function PreviewImage(fileObj,imgPreviewId,divPreviewId){  
          var allowExtention=".jpg,.bmp,.gif,.png";//允许上传文件的后缀名document.getElementById("hfAllowPicSuffix").value;  
          var extention=fileObj.value.substring(fileObj.value.lastIndexOf(".")+1).toLowerCase();              
          var browserVersion= window.navigator.userAgent.toUpperCase();  
          if(allowExtention.indexOf(extention)>-1){   
              if(fileObj.files){//HTML5实现预览，兼容chrome、火狐7+等  
                  if(window.FileReader){  
                      var reader = new FileReader();   
                      reader.onload = function(e){  
                          document.getElementById(imgPreviewId).setAttribute("src",e.target.result);  
                      }    
                      reader.readAsDataURL(fileObj.files[0]);  
                  }else if(browserVersion.indexOf("SAFARI")>-1){  
                      alert("不支持Safari6.0以下浏览器的图片预览!");  
                  }  
              }else if (browserVersion.indexOf("MSIE")>-1){  
                  if(browserVersion.indexOf("MSIE 6")>-1){//ie6  
                      document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);  
                  }else{//ie[7-9]  
                      fileObj.select();  
                      if(browserVersion.indexOf("MSIE 9")>-1)  
                          fileObj.blur();//不加上document.selection.createRange().text在ie9会拒绝访问  
                      var newPreview =document.getElementById(divPreviewId+"New");  
                      if(newPreview==null){  
                          newPreview =document.createElement("div");  
                          newPreview.setAttribute("id",divPreviewId+"New");  
                          newPreview.style.width = document.getElementById(imgPreviewId).width+"px";  
                          newPreview.style.height = document.getElementById(imgPreviewId).height+"px";  
                          newPreview.style.border="solid 1px #d2e2e2";  
                      }  
                      newPreview.style.filter="progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='" + document.selection.createRange().text + "')";                              
                      var tempDivPreview=document.getElementById(divPreviewId);  
                      tempDivPreview.parentNode.insertBefore(newPreview,tempDivPreview);  
                      tempDivPreview.style.display="none";                      
                  }  
              }else if(browserVersion.indexOf("FIREFOX")>-1){//firefox  
                  var firefoxVersion= parseFloat(browserVersion.toLowerCase().match(/firefox\/([\d.]+)/)[1]);  
                  if(firefoxVersion<7){//firefox7以下版本  
                      document.getElementById(imgPreviewId).setAttribute("src",fileObj.files[0].getAsDataURL());  
                  }else{//firefox7.0+                      
                      document.getElementById(imgPreviewId).setAttribute("src",window.URL.createObjectURL(fileObj.files[0]));  
                  }  
              }else{  
                  document.getElementById(imgPreviewId).setAttribute("src",fileObj.value);  
              }           
          }else{  
              alert("仅支持"+allowExtention+"为后缀名的文件!");  
              fileObj.value="";//清空选中文件  
              if(browserVersion.indexOf("MSIE")>-1){                          
                  fileObj.select();  
                  document.selection.clear();  
              }                  
              fileObj.outerHTML=fileObj.outerHTML;  
          }  
      } 
      
      function clearImg1(){
    	  $('input').remove('#img1');
    	  $('#imgHeadPhoto1').attr("src","../images/add_img.png")
    	  $('#img2').before("<input id=\"img1\" name=\"imgfile\" type=\"file\" onchange=\"PreviewImage(this,'imgHeadPhoto1','divPreview')\" style=\"visibility:hidden;position: absolute;\" />");
      }
      function clearImg2(){
    	  $('input').remove('#img2');
    	  $('#imgHeadPhoto2').attr("src","../images/add_img.png")
    	  $('#img3').before("<input id=\"img2\" name=\"imgfile\"  type=\"file\" onchange=\"PreviewImage(this,'imgHeadPhoto2','divPreview')\" style=\"visibility:hidden;position: absolute;\" />");
      }
      function clearImg3(){
    	  $('input').remove('#img3');
    	  $('#imgHeadPhoto3').attr("src","../images/add_img.png")
    	  $('#img2').after("<input id=\"img3\"  name=\"imgfile\" type=\"file\" onchange=\"PreviewImage(this,'imgHeadPhoto3','divPreview')\" style=\"visibility:hidden;position: absolute;\" />");
      }