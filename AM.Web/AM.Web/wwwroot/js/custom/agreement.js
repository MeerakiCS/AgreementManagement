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
        'columnDefs': [{ 'orderable': false, 'targets': [5] }], // hide sort icon on header of first column
    });
}
$(document).ready(function () {
    dataTableAgreements();
    var date = new Date();

})

function openAgreementModal(id) {
    debugger;
    if (id > 0) {
        $('#agreementModal .modal-body-content').html("<div style='text-align:center;'><i class='mb-1 mt-3 spinner-border text-primary'></i><p>Please wait...</p></div>").load("/Agreement/Edit/" + id, function () {
        })
    }
    else {
        $('#agreementModal .modal-body-content').html("<div style='text-align:center;'><i class='mb-1 mt-3 spinner-border text-primary'></i><p>Please wait...</p></div>").load("/Agreement/Create", function () {
        })
    }
}

var date = new Date();
var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
var SelectedDate = today;
$("#datePickerEffectiveDate").datepicker({
    dateFormat: "mm/dd/yy",
    showOtherMonths: true,
    selectOtherMonths: true,
    autoclose: true,
    changeMonth: true,
    changeYear: true,
    todayHighlight: true,
}).on("changeDate", function (newDate) {
});

function saveAgreement(id) {
    if (id > 0) {

    }
    else {

    }

}

