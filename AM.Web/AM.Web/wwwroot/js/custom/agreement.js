var agreementDataTable;
function dataTableAgreements() {
    agreementDataTable = $("#agreement-data-table").DataTable({
        responsive: true,
        bPaginate: true,
        bFilter: true,
        bInfo: true,
        bLengthChange: false,
        bAutoWidth: true,
        pageLength: 25,
        searching: true,
        "ordering": true,
        //'columnDefs': [{ 'orderable': false, 'targets': [5] }], // hide sort icon on header of first column
        'aaSorting': [[0, 'desc']]
    });
}
$(document).ready(function () {
    dataTableAgreements();
})