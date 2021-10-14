/**
 * 
 */
$(document).ready(function () {
  "use strict";
  var thumbArray = [];

  function changeMainPic(thmIdx) {
    var resoName;
    if (thmIdx === -1) {
      resoName = no_img_12_10.png;
    } else {
      var fullpath = thumbArray[thmIdx].src;
      var itemArr = fullpath.split('/');
      resoName = itemArr[itemArr.length - 1];
    }
    $('#bigImgDiv').css('background-image', "url('img/" + resoName + "')");
  }
  /*$('#bigImgDiv').css('background-image', "url(img/" + resoName + ")");*/

  alert("before picCount: ");

  var bigImgDiv;

  var thmCnt;
  var thmIdx = 0;
  var size = $("div#thumbs").children('div').length;
  alert("size: " + size);
  bigImgDiv = document.getElementById("bigImgDiv");
  for (var i = 0; i < size; i++) {
    thumbArray[i] = document.getElementById("thumb" + i);
  }
  thmCnt = size;
  changeMainPic(size === 0 ? -1 : 0);

  $(".thumb").mouseover(function (e) {
    alert(this.id);
    changeMainPic(parseInt(this.id.substring(5)));
  });

  /*	$("#toRight").click(function(e) {
  		alert("toRight clicked");
  		if ($("#toRight").attr('disabled') === "disabled") {
  			e.preventDefault();
  			return;
  		}
  		if (thmIdx < (thmCnt - 1)) {
  			thmIdx++;
  			if (thmIdx === thmCnt - 1) {
  				$("#toRight").attr("disabled", "disabled");
  			}
  			if ($("#toLeft").attr("disabled") === "disabled")
  				$("#toLeft").removeAttr("disabled");
  		} else {
  			alert("No more image");
  		}
  		if (preIdx !== thmIdx) {
  			var fullpath = thumbArray[thmIdx].src;
  			var itemArr = fullpath.split('/');
  			var resoName = "img/" + itemArr[itemArr.length - 1];

  			bigImgDiv.style.backgroundImage = "url('" + resoName + "')";
  		}
  	});*/

  /*	$("#toLeft").click(function(e) {
  		alert("toLeft clicked");
  		if ($("#toLeft").attr('disabled') === "disabled") {
  			alert("to left disabled");
  			e.preventDefault();
  			return;
  		}
  		if (0 < thmIdx) {
  			thmIdx--;
  			if (thmIdx === 0)
  				$("#toLeft").attr("disabled", "disabled");
  			if ($("#toRight").attr("disabled") === "disabled")
  				$("#toRight").removeAttr("disabled");
  		} else {
  			alert("No more image");
  		}
  	});*/

  /*	var picCount = '${soap.pics.length}';
  	alert("picCount: " + picCount);
  	$("#toRight").click(function (e) {
  	});*/
});
