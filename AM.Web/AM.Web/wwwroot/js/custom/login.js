var isFormSubmitted = false;
$(document).on('keyup', '.info', function (event) {
    if (event.keyCode === 13) {
        event.preventDefault();
        document.getElementById("myBtn").click();
    } else if (isFormSubmitted) {
        checkValidation(this)
    }
})

$(document).on('click', '#myBtn', function () {
    var formElements = GetFormControlData('loginform');
    if (formElements && formElements.length > 0) {
        ValidateForm(formElements)
        isFormSubmitted = true;
        if (isValidate) {
            $("#myBtn").html("Login <i class='float-right login-loder mt-1 spinner-border spinner-border-sm'></i>").attr('disabled', 'disabled').css('cursor', 'wait');
            $("#loginform").submit();
        }
    }
})
$(document).on('keyup', '.info', function () {
    if (isFormSubmitted) {
        checkValidation(this)
    }
})