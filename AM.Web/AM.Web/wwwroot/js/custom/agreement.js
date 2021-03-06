var agreementDataTable;
function dataTableAgreements() {
    agreementDataTable = $("#agreement-data-table").DataTable({
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
        'columnDefs': [{ 'orderable': false, 'targets': [7] }], // hide sort icon on header of first column
    });
}
$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();
    dataTableAgreements();
})

function openAgreementModal(id) {
    if (id > 0) {
        $('#agreementModal .modal-body-content').html("<div style='text-align:center;'><i class='mb-1 mt-3 spinner-border text-primary'></i><p>Please wait...</p></div>").load("/Agreement/Edit?id=" + id, function () {
        })
    }
    else {
        $('#agreementModal .modal-body-content').html("<div style='text-align:center;'><i class='mb-1 mt-3 spinner-border text-primary'></i><p>Please wait...</p></div>").load("/Agreement/Create", function () {
        })
    }
}
function saveAgreement(id) {
    var formElements = GetFormControlData('add-update-agreement');
    if (formElements && formElements.length > 0) {
        ValidateForm(formElements);
    }
    var url = id > 0 ? "Agreement/Edit" : "Agreement/Create"
    if (isValidate) {
        let form = $("#add-update-agreement").serializeToJSON()
        form.expirationDateString = form.expirationDate;
        form.effectiveDateString = form.effectiveDate;
        $.ajax({
            url: url,
            type: "POST",
            data: form,
            success: function (response) {
                debugger
                if (response.success) {
                    $("#agreementModal").modal('hide');
                    swal({
                        title: "Success",
                        text: id > 0 ? "Agreement updated successfully." : "Agreement added successfully.",
                        type: "success"
                    }).then(function () {
                        window.location.reload();
                    });
                }
                else {
                    if (response.type === 'error') {
                        swal("Error", response.message, response.type);
                    } else {
                        swal("Warning", response.message, response.type);
                    }
                }

            }, error: function (response) {
                swal("Error", "Something went wrong, please try again");
            }
        });

    }
}

function DeleteAgreement(id) {
    swal({
        title: "Warning",
        text: " Are you certain you want to delete ?",
        icon: "warning",
        buttons: true,

        type: "warning",
        showCancelButton: true,
        confirmButtonClass: "btn-danger",
        confirmButtonText: "Yes",
        closeOnConfirm: false,
        dangerMode: true,
    }).then((confirm) => {
        if (confirm) {
            $.ajax({
                url: "/Agreement/Delete",
                type: "Delete",
                data: { id: id },
                success: function (response) {
                    if (response.success) {
                        $("#agreementModal").modal('hide');
                        swal({
                            title: "Success",
                            text: "Agreement deleted successfully.",
                            type: "success"
                        }).then(function () {
                            window.location.reload();
                        });

                    }
                    else {
                        alert("Something went wrong, please try again");
                    }

                }
            })
        }
    })
}

