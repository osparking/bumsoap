/**
 * 
 */
$(document).ready(function () {
  "use strict";
  var thmCnt = $("div#thumbs").children('div').length;
  var thmIdx = 0;

  function toggleLR_button_Disabled(index) {
    if (index === thmCnt - 1) {
      $("#toRight").addClass('hidden');
    }
    if (index > 0 &&
      $("#toLeft").hasClass('hidden')) {
      $("#toLeft").removeClass("hidden");
    }

    if (index === 0) {
      $("#toLeft").addClass('hidden');
    }
    if (index < thmCnt - 1 &&
      $("#toRight").hasClass('hidden')) {
      $("#toRight").removeClass("hidden");
    }
  }

  function changeBorder(imgElt, oldBorder, newBorder) {
    var imgDiv = imgElt.closest('div');

    imgDiv.removeClass(oldBorder);
    imgDiv.addClass(newBorder);
  }

  function changeMainPic(idx, prvIdx) {

    toggleLR_button_Disabled(idx);

    var resoName;
    if (idx === -1) {
      resoName = 'no_img_12_10.png';
    } else {
      var prvElt = $("#thumb" + prvIdx);
      changeBorder(prvElt, "pinkBox", "greyBox");

      var imgElt = $("#thumb" + idx);
      changeBorder(imgElt, "greyBox", "pinkBox");

      var semiPath = imgElt.attr('src');
      var itemArr = semiPath.split('/');

      resoName = itemArr[itemArr.length - 1];
    }
    $('#bigImgDiv').css('background-image', "url('img/" + resoName + "')");

  }

  changeMainPic(thmCnt === 0 ? -1 : 0, -1);

  $("img.thumb").mouseenter(function (e) {
    // 5: 'thumb' 문자열 길이
    var idx = parseInt(this.id.substring(5));

    if (idx !== thmIdx) {
      var prvIdx = thmIdx;
      thmIdx = idx;
      changeMainPic(thmIdx, prvIdx);
    }
  });

  $("#toRight").click(function (e) {
    if ($("#toRight").attr('disabled') === "disabled") {
      e.preventDefault();
      return;
    }
    if (thmIdx < thmCnt - 1) {
      var prvIdx = thmIdx;
      changeMainPic(++thmIdx, prvIdx);
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
      var prvIdx = thmIdx;
      changeMainPic(--thmIdx, prvIdx);
    } else {
      alert("No more image"); // 이 경보가 뜨면 안됨!
    }
  });
});
