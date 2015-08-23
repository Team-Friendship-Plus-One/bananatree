simplifyResponseHandler = (data) ->
    paymentForm = $('#simplify-payment-form')
    $('.error').remove()
    if data.error
        if data.error.code == 'validation'
            errorList = ''
            for f in data.error.fieldErrors
                errorList += "<div class='error'>Field #{f.field} is invalid &ndash; #{f.message}</div>"
            paymentForm.after errorList

        $('#process-payment-btn').removeAttr 'disabled'
    else
        token = data['id']
        paymentForm.append "<input type='hidden' name='simplifyToken' value='#{token}'>"
        paymentForm.get(0).submit()
    return

ready = ->
    $('#simplify-payment-form').on 'submit', ->
        $('#process-payment-btn').attr disabled: 'disabled'
        SimplifyCommerce.generateToken {
            key: "sbpb_ZDE4NzAyY2EtYzQ0MC00YzllLWJmN2UtODcyM2MxMzhhYmJk",
            card: {
                number: $('#cc-number').val(),
                cvc: $('#cc-cvc').val(),
                expMonth: $('#cc-exp-month').val(),
                expYear: $('#cc-exp-year').val().slice(-2)
            },
            amount: $('#donation-amount').val(),
        }, simplifyResponseHandler
        false
    SimplifyCommerce.addMasterPassCheckoutButton("buy-with-masterpass-div", "sbpb_ZDE4NzAyY2EtYzQ0MC00YzllLWJmN2UtODcyM2MxMzhhYmJk", masterPassResponseHandler, masterPassCanceledHandler)
    masterPassResponseHandler = (data, status) ->
    $paymentForm = $("#simplify-payment-form")
    $(".error").remove()
    if data.error
        if data.error.code == "validation" 
            fieldErrors = data.error.fieldErrors fieldErrorsLength = fieldErrors.length, errorList = "";
            for i in fieldErrorsLength
                errorList += "<div class='error'>Field: '" + fieldErrors[i].field + "' is invalid - " + fieldErrors[i].message + "</div>"
            $paymentForm.after(errorList)
    else 
        token = data.cardToken["id"];
        $paymentForm.append("<input type='hidden' name='simplifyToken' value='" + token + "' />");
        $paymentForm.get(0).submit();
    masterPassCanceledHandler = () ->
    console.log ("MasterPass canceled")
    return

$(document).ready(ready)