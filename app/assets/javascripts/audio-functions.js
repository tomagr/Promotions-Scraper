var keys = [];
var $videoIntro;
var $videoFinal;

// .noti
// .kwi
// .clown
// .intro
// .final

var noti = '190,78,79,84,73';
var kwi = '190,75,87,73';
var clown = '190,67,76,79,87,78';
var intro = '190,73,78,84,82,79';
var final = '190,70,73,78,65,76';
var gpaul = '190,71,80,65,85,76';
var gpol = '190,71,80,79,76';
var wisely = '190,87,73,83,69,76,89';
var poorly = '190,80,79,79,82,76,89';
var enter = '13';

jQuery(document).ready(function () {
  // $videoIntro = $('#quest-video');
  // $videoFinal = $('#final-video');

  readKeys();
});

function readKeys() {
  $(document).keydown(function ( e ) {
	keys.push(e.keyCode);
	checkCode(keys.toString())
  });
}

function checkCode( insertedKeys ) {
  console.log(insertedKeys);
  playIfNoti(insertedKeys);
  playIfKwi(insertedKeys);
  playIfClown(insertedKeys);
  playIfIntro(insertedKeys);
  playIfGpaul(insertedKeys);
  playIfGpol(insertedKeys);
  playIfWisely(insertedKeys);
  playIfPoorly(insertedKeys);
  submitIfEnter(insertedKeys);
}


function submitIfEnter( insertedKeys ) {
  if (insertedKeys.indexOf(enter) >= 0)
	$('#send-code').click();
}

function playIfNoti( insertedKeys ) {
  if (insertedKeys.indexOf(noti) >= 0) {
	document.getElementById('audio-noti').play();
	keys = [];
  }
}

function playIfKwi( insertedKeys ) {
  if (insertedKeys.indexOf(kwi) >= 0) {
	document.getElementById('audio-kwi').play();
	keys = [];
  }
}

function playIfClown( insertedKeys ) {
  if (insertedKeys.indexOf(clown) >= 0) {
	playClown();
	keys = [];
  }
}

// function playIfIntro( insertedKeys ) {
//   if (insertedKeys.indexOf(intro) >= 0) {
// 	playIntro();
// 	keys = [];
//   }
// }

function playIfGpaul( insertedKeys ) {
  if (insertedKeys.indexOf(gpaul) >= 0) {
	document.getElementById('audio-gpaul').play();
	keys = [];
  }
}

function playIfGpol( insertedKeys ) {
  if (insertedKeys.indexOf(gpol) >= 0) {
	document.getElementById('audio-gpol').play();
	keys = [];
  }
}

function playIfWisely( insertedKeys ) {
  if (insertedKeys.indexOf(wisely) >= 0) {
	document.getElementById('audio-wisely').play();
	keys = [];
  }
}

function playIfPoorly( insertedKeys ) {
  if (insertedKeys.indexOf(poorly) >= 0) {
	document.getElementById('audio-poorly').play();
	keys = [];
  }
}

function playClown() {
  document.getElementById('audio-clown').play();
}


// function playIntro() {
//   $videoIntro.show();
//   const introVideo = document.getElementById('quest-video');
//   introVideo.play();
//   introVideo.onended = function () {
// 	location.reload();
//   };
// }


// function playEnding() {
//   $videoFinal.show();
//   document.getElementById('final-video').play();
// }
