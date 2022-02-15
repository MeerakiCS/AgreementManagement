var isValidate = true;

function removeValidation(formId) {
    var formElements = GetFormControlData(formId);
    $.each(formElements, function (idx, element) {
        $("#" + element.elementId + 'Message').remove();
        $("#" + element.elementId + "Required").removeClass("text-danger");
        $("#" + element.elementId).removeClass("input-border");
        $("#" + element.elementId).val('');
        $("." + element.elementName).val('');

        if ($("#" + element.elementId).attr("class").includes("selectdrop")) {
            $(".select2-container").removeClass("input-border");
            // $("#" + element.elementId).select2("val", "");
            // $("#" + element.elementId).trigger("change");
        }
    });
}

function GetFormControlData(formId) {
    var formElements = [];
    $('#' + formId + " input").each(
        function () {
            var input = $(this);
            if (input.attr('type') !== 'hidden') {
                if (!input.attr('readonly')) {
                    if (input.attr('type') !== 'file') {
                        var formElement = { elementId: input.attr('id'), elementName: input.attr('name'), message: input.attr('placeholder') };
                        if (formElement.elementName !== '__RequestVerificationToken' && input.attr('required')) {
                            formElements.push(formElement);
                        }
                    }
                }
            }
        }
    );
    $('#' + formId + " select").each(
        function () {
            var select = $(this);
            var formElementSelect = { elementId: select.attr('id'), elementName: select.attr('name'), message: select.attr('placeholder') };
            if (select.attr('required')) {
                formElements.push(formElementSelect);
            }
        }
    );

    $('#' + formId + " textarea").each(
        function () {
            var textarea = $(this);
            var formElementsTextArea = { elementId: textarea.attr('id'), elementName: textarea.attr('name'), message: textarea.attr('placeholder') };
            if (textarea.attr('required')) {
                formElements.push(formElementsTextArea);
            }
        });
    return formElements;
}

function ValidateForm(formElements) {
    debugger
    var isFocus = false;
    isValidate = true;
    $.each(formElements, function (idx, element) {
        var elmnt = $("#" + element.elementId);
        if (!elmnt.val() || (elmnt.val().length === 0 || elmnt.val().length === [] && elmnt.val().trim() == "") || elmnt.val() == " ") {
            isValidate = false;
            if ($("#" + element.elementId + 'Message').length === 0) {
                let checkTagType = $("#" + element.elementId)[0].nodeName;
                if (checkTagType == "SELECT") {
                    var span = '<span class="message text-danger" id="' + element.elementId + "Message" + '">Select ' + element.message + ' </span>';
                    elmnt.after(span);
                    elmnt.addClass("input-border");
                }
                else {
                    var span = '<span class="message text-danger" id="' + element.elementId + "Message" + '">Enter ' + element.message + ' </span>';
                    if ($(elmnt).parent('.input-group') && $(elmnt).parent('.input-group').length) {
                        $(elmnt).parent('.input-group').after(span);
                    } else {
                        $(elmnt).after(span);
                    }
                }

                $("#" + element.elementId + "Required").addClass("text-danger");
                $("#" + element.elementId).addClass("input-border");
                if (!isFocus) {
                    elmnt.focus();
                    isFocus = true;
                }
            }
        }
        else {
            if ($("#" + element.elementId).prop('multiple')) {
                elmnt.next(".select2-container").removeClass("input-border");
            }
            else {
                $("#" + element.elementId + 'Message').remove();
                $("#" + element.elementId + "Required").removeClass("text-danger");
                $("#" + element.elementId).removeClass("input-border");
            }

            if ($(elmnt[0]).attr("class").includes("selectdrop")) {
                $(".select2-container").removeClass("input-border");
            }
        }
        if (elmnt && elmnt[0].attributes && elmnt[0].attributes.type && elmnt[0].attributes.type.value == 'email') {
            isValidate = validEmail(document.getElementById(element.elementId)) && isValidate
        }
        if (elmnt && elmnt[0].attributes && elmnt[0].attributes.type && elmnt[0].attributes.type.value == 'password') {
            isValidate = validPassword(document.getElementById(element.elementId)) && isValidate
        }
    });
}

function checkValidation(e) {
    var isFocus = false;
    if ($(e).attr('id') === 'username' || $(e).attr('id') === 'password') {
        $("#login-message").hide();
    }
    var element = { elementId: $(e).attr('id'), elementName: $(e).attr('name'), message: $(e).attr('placeholder') };

    if (!$(e).val()) {
        isValidate = false;
        if ($("#" + element.elementId + 'Message').length === 0) {
            checkTagType = $("#" + element.elementId)[0].nodeName;
            if (checkTagType == "SELECT") {
                var span = '<span class="message text-danger" id="' + element.elementId + "Message" + '">Select ' + element.message + ' </span>';
            }
            else {
                var span = '<span class="message text-danger" id="' + element.elementId + "Message" + '">Enter ' + element.message + ' </span>';
            }
            if (checkTagType == "SELECT") {
                var span = '<span class="message text-danger" id="' + element.elementId + "Message" + '">Select ' + element.message + ' </span>';
                $(e).next(".select2-container").after(span);
                $(e).next(".select2-container").addClass("input-border");
            }
            else {
                if ($(e).parent('.input-group') && $(e).parent('.input-group').length) {
                    $(e).parent('.input-group').after(span);
                } else {
                    $(e).after(span);
                }
            }

            $("#" + element.elementId + "Required").addClass("text-danger");
            $("#" + element.elementId).addClass("input-border");
            if (!isFocus) {
                $(e).focus();
                isFocus = true;
            }
        }
    }
    else {
        $("#" + element.elementId + 'Message').remove();
        $("#" + element.elementId + "Required").removeClass("text-danger");
        $("#" + element.elementId).removeClass("input-border");
        $(e).next('.select2-container').removeClass("input-border");
    }
}

function validEmail(e) {
    let element = { elementId: $(e).attr('id'), elementName: $(e).attr('name'), message: $(e).attr('placeholder') };
    let inputvalues = $("#" + element.elementId).val();
    if (inputvalues) {
        let regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if (!inputvalues.match(regex)) {
            if ($("#" + element.elementId + 'Message').length === 0) {
                var span = '<span class="message text-danger" id="' + element.elementId + "Message" + '">Enter valid ' + element.message + ' </span>';
                if ($(e).parent('.input-group') && $(e).parent('.input-group').length) {
                    $(e).parent('.input-group').after(span);
                } else {
                    $(e).after(span);
                }
                $("#" + element.elementId + "Required").addClass("text-danger");
            }
            return false;
        }
        else {
            $("#" + element.elementId + 'Message').remove();
            $("#" + element.elementId + "Required").removeClass("text-danger");
            $("#" + element.elementId).removeClass("input-border");
            return true;
        }
    }
    return false;
}
function validPassword(e) {
    let element = { elementId: $(e).attr('id'), elementName: $(e).attr('name'), message: $(e).attr('placeholder') };
    let inputvalues = $("#" + element.elementId).val();
    if (inputvalues) {
        let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(.{8,16})/;
        if (!inputvalues.match(regex)) {
            if ($("#" + element.elementId + 'Message').length === 0) {
                var span = '<span class="message text-danger" id="' + element.elementId + "Message" + '">' + element.message + ' must be strong </span>';
                $(e).after(span);
                $("#" + element.elementId + "Required").addClass("text-danger");
            }
            return false;
        }
        else {
            $("#" + element.elementId + 'Message').remove();
            $("#" + element.elementId + "Required").removeClass("text-danger");
            $("#" + element.elementId).removeClass("input-border");
            return true;
        }
    }
    return false;
}





