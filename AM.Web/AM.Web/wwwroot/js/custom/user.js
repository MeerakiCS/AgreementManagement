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
        'columnDefs': [{ 'orderable': false, 'targets': [3] }], // hide sort icon on header of first column
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
                    //toastr.info(response.message, "Information!");
                    $("#userModal").modal('toggle');
                    alert("User added successfully");
                    window.location.reload();
                }
                else {
                    alert(response.type.toUpperCase() + ', ' + response.message);
                }
            }, error: function (response) {
                alert("Something went wrong, please try again");
            }
        });
    }
}


$(document).ready(function () {
    initDatatable();
})