const exitCode = '152BTH';

var $notification;
var $button;

$(document).ready(function () {
  $notification = $('.notification');
  $button = $('#send-code');


  setupButton();
  setupFocusInputs();
});


function setupFocusInputs() {
  $('input').keyup(function () {
	let value = $(this).val();


	if (value !== "") {
	  $(this).next().focus();
	  //console.log('value', value);
	  hideMessage();
	}
  });
}

function setupButton() {
  $button.click(function () {
	if (codeIsValid())
	  displaySuccessMessage('Bien Coquita! Ahora si podes ir a buscar Papa Noel en su puerta de acceso');
	else
	  displayErrorMessage('El codigo "' + getCode().toUpperCase() + ' " es incorrecto Chipapita :/');

	eraseInputs();
  });
}

function eraseInputs() {
  $('input').val('');
  $('input:first-child').focus();
  keys = [];
}

function codeIsValid() {
  return getCode().toUpperCase() == exitCode;
}

function displayErrorMessage( message ) {
  $notification.css('background-color', '#fe7a7b');
  displayMessage(message);
  playClown();
}

function displaySuccessMessage( message ) {
  $notification.css('background-color', '#a7ffb2');
  displayMessage(message);
  playEnding();
}

function displayMessage( message ) {
  $notification.html(message).show();
}

function hideMessage() {
  $notification.hide();
}

function getCode() {
  return $('input:nth-child(1)').val() + $('input:nth-child(2)').val() + $('input:nth-child(3)').val() + $('input:nth-child(4)').val() + $('input:nth-child(5)').val() + $('input:nth-child(6)').val();
}
