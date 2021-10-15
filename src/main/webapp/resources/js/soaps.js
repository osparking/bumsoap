/**
 * 
 */
$(document).ready(function () {
  "use strict";
  var thmCnt = $("div#thumbs").children('div').length;
  var thmIdx = 0;

  function toggleLR_button_Disabled(index) {
    if (index === thmCnt - 1) {
      $("#toRight").attr("disabled", "disabled");
    }
    if (index > 0 &&
      $("#toLeft").attr("disabled") === "disabled") {
      $("#toLeft").removeAttr("disabled");
    }

    if (index === 0) {
      $("#toLeft").attr("disabled", "disabled");
    }

    if (index < thmCnt - 1 &&
      $("#toRight").attr("disabled") === "disabled") {
      $("#toRight").removeAttr("disabled");
    }
  }

  function changeMainPic(idx) {

    toggleLR_button_Disabled(idx);

    var resoName;
    if (idx === -1) {
      resoName = 'no_img_12_10.png';
    } else {
      var semiPath = $("#thumb" + idx).attr('src');
      var itemArr = semiPath.split('/');

      resoName = itemArr[itemArr.length - 1];
    }
    $('#bigImgDiv').css('background-image', "url('img/" + resoName + "')");
  }

  changeMainPic(thmCnt === 0 ? -1 : 0);

  $("img.thumb").mouseenter(function (e) {
    // 5: 'thumb' 문자열 길이
    var idx = parseInt(this.id.substring(5));

    if (idx !== thmIdx) {
      thmIdx = idx;
      changeMainPic(thmIdx);
    }
  });

  $("#toRight").click(function (e) {
    if ($("#toRight").attr('disabled') === "disabled") {
      e.preventDefault();
      return;
    }
    if (thmIdx < thmCnt - 1) {
      changeMainPic(++thmIdx);
    } else {
      alert("No more image"); // 이 경보가 뜨면 안됨!
    }
  });

  $("#toLeft").click(function (e) {
    if ($("#toLeft").attr('disabled') === "disabled") {
      e.preventDefault();
      return;
    }
    if (0 < thmIdx) {
      changeMainPic(--thmIdx);
    } else {
      alert("No more image"); // 이 경보가 뜨면 안됨!
    }
  });
});
