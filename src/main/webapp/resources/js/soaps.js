/**
 * 
 */
$(document).ready(function () {
  "use strict";
  var thmCnt = $("div#thumbs").children('div').length;
  var thmIdx = 0;

  function changeMainPic(thmIdx) {
    var resoName;
    if (thmIdx === -1) {
      resoName = no_img_12_10.png;
    } else {
      var semiPath = $("#thumb" + thmIdx).attr('src');
      var itemArr = semiPath.split('/');
      resoName = itemArr[itemArr.length - 1];
    }
    $('#bigImgDiv').css('background-image', "url('img/" + resoName + "')");
  }

  changeMainPic(thmCnt === 0 ? -1 : 0);

  $(".thumb").mouseover(function (e) {
    changeMainPic(parseInt(this.id.substring(5))); // number after 'thumb' 
  });

  $("#toRight").click(function (e) {
    if ($("#toRight").attr('disabled') === "disabled") {
      e.preventDefault();
      return;
    }
    if (thmIdx < (thmCnt - 1)) {
      thmIdx++;
      if (thmIdx === thmCnt - 1) {
        $("#toRight").attr("disabled", "disabled");
      }
      if ($("#toLeft").attr("disabled") === "disabled") {
        $("#toLeft").removeAttr("disabled");
      }
      changeMainPic(thmIdx);
    } else {
      alert("No more image");
    }
  });

  $("#toLeft").click(function (e) {
    if ($("#toLeft").attr('disabled') === "disabled") {
      e.preventDefault();
      return;
    }
    if (0 < thmIdx) {
      thmIdx--;

      if (thmIdx === 0)
        $("#toLeft").attr("disabled", "disabled");

      if ($("#toRight").attr("disabled") === "disabled")
        $("#toRight").removeAttr("disabled");

      changeMainPic(thmIdx);
    } else {
      alert("No more image");
    }
  });
});
