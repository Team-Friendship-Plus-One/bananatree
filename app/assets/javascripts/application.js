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
//= require turbolinks
//= require_tree .
//

// $(document).ready(function() {
//   $("#simplify-payment-form").on("submit", function() {
//       // Disable the submit button
//       $("#process-payment-btn").attr("disabled", "disabled");
//       // Generate a card token & handle the response
//       SimplifyCommerce.generateToken({
//           key: "sbpb_N2Y1YWViODEtNGFmYy00NWQzLTlkY2YtMTE2ZjA4ZjNhYjkx",
//           card: {
//               number: $("#cc-number").val(),
//               cvc: $("#cc-cvc").val(),
//               expMonth: $("#cc-exp-month").val(),
//               expYear: $("#cc-exp-year").val().subString(2,3)
//           }
//       }, simplifyResponseHandler);
//       // Prevent the form from submitting
//       return false;
//   });

//   function simplifyResponseHandler(data) {
//     var $paymentForm = $("#simplify-payment-form");
//     // Remove all previous errors
//     $(".error").remove();
//     // Check for errors
//     if (data.error) {
//         // Show any validation errors
//         if (data.error.code == "validation") {
//             var fieldErrors = data.error.fieldErrors,
//                 fieldErrorsLength = fieldErrors.length,
//                 errorList = "";
//             for (var i = 0; i < fieldErrorsLength; i++) {
//                 errorList += "<div class='error'>Field: '" + fieldErrors[i].field +
//                              "' is invalid - " + fieldErrors[i].message + "</div>";
//             }
//             // Display the errors
//             $paymentForm.after(errorList);
//         }
//         // Re-enable the submit button
//         $("#process-payment-btn").removeAttr("disabled");
//     } else {
//         // The token contains id, last4, and card type
//         var token = data["id"];
//         // Insert the token into the form so it gets submitted to the server
//         $paymentForm.append("<input type='hidden' name='simplifyToken' value='" + token + "' />");
//         // Submit the form to the server
//         $paymentForm.get(0).submit();
//     }
// 	}
// });