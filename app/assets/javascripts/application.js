// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min.js
//= require digits.min.js
//= require turbolinks
//= require_tree .
//

// $(document).ready(function() {
// 	$('#process-payment-btn').on('click', function() {
// 		var url = $('#simplify-payment-form').attr('action');
// 		console.log("URL", url);
// 		var id = $(this).closest(".campaignId");
// 		id = parseInt(id.attr('id'));
// 		dataId = {campaginID: id}
// 		console.log(id);

// 		$.ajax({
// 			url: "/campaigns/pay",
// 			type: "POST",
// 			data: JSON.stringify(dataId)
// 		});
// 	});
// });

$(function() {
  Digits.init({ consumerKey: 'F6W9oHNeu1oPLPwtmAZWErWkY' });
  console.log('doc loaded')
  $('#digits').click(function(event) {
    Digits.logIn()
      .done(onLogin)
      .fail(onLoginFailure)
        });


  function onLogin(loginResponse){
  
    // Send headers to your server and validate user by calling Digits’ API
    var oAuthHeaders = loginResponse.oauth_echo_headers;
    var verifyData = {
      authHeader: oAuthHeaders['X-Verify-Credentials-Authorization'],
      apiUrl: oAuthHeaders['X-Auth-Service-Provider']
    };
    debugger
    $.post('/users/sign_in', verifyData)
      .done(function(){ window.reload(); });
  }

  function onLoginFailure(error){
    println('Login error: ', error); 
  }  
    
  // function parseOAuthHeaders(oAuthEchoHeaders) {
  //   var credentials = oAuthEchoHeaders['X-Verify-Credentials-Authorization'];
  //   var apiUrl = oAuthEchoHeaders['X-Auth-Service-Provider'];
  //   return {
  //     apiUrl: apiUrl,
  //     headers: credentials
  //   };
  // } 

  function println(text, response) {
    var message = document.createElement('p');
    message.innerText = text;
    
    if (response){
      var code = document.createElement('code');
      code.innerText = typeof response == 'string' ? response : JSON.stringify(response);
      message.appendChild(code);
    }
    
    // document.body.appendChild(message);
  }


})