var agreementDataTable;
function initDatatable() {
    agreementDataTable = $("#users-table").DataTable({
        responsive: true,
        bPaginate: true,
        bFilter: true,
        bInfo: true,
        bLengthChange: false,
        bAutoWidth: true,
        pageLength: 10,
        lengthChange: true,
        searching: true,
        "ordering": true,
    });
}

function openUserModal(id) {
    /* $('#userModal .modal-title').text('Add Employee');*/
    $('#userModal .modal-body-content').html("<div style='text-align:center;'><i class='mb-1 mt-3 spinner-border text-primary'></i><p>Please wait...</p></div>").load("/User/Create", function () {
    });
}
function saveUser() {
    var formElements = GetFormControlData('user-form');
    if (formElements && formElements.length > 0) {
        ValidateForm(formElements);
    }
    if (isValidate) {
        $.ajax({
            url: "User/Create",
            type: "POST",
            data: $("#user-form").serializeToJSON(),
            success: function (response) {
                if (response.success) {
                    $("#userModal").modal('toggle');
                    swal({
                        title: "Success",
                        text: "User added successfully",
                        type: "success"
                    }).then(function () {
                        location.reload();
                    })
                }
                else {
                    if (response.type === 'error') {
                        swal("Error", response.message, response.type);
                    } else {
                        swal("Warning", response.message, response.type);
                    }
                }
            }, error: function (response) {
                swal("Error", "Something went wrong, please try again", "error");
            }
        });
    }
}


$(document).ready(function () {
    initDatatable();
})