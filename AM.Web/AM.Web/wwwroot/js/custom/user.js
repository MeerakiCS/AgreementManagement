var agreementDataTable;
function initDatatable() {
    agreementDataTable = $("#users-table").DataTable({
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

function openUserModal(id) {
    /* $('#userModal .modal-title').text('Add Employee');*/
    $('#userModal .modal-body-content').html("<div style='text-align:center;'><i class='mb-1 mt-3 spinner-border text-primary'></i><p>Please wait...</p></div>").load("/User/Create", function () {
    });
}

$(document).ready(function () {
    initDatatable();
})