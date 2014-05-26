/*$('[name="card-type"]').select2({
    placeholder: 'Select Card Type',
    formatResult: format_tcard_type_select,
    formatSelection: format_tcard_type_select,
    escapeMarkup: function(m) { return m; }
});

$('[name="mat-no"]').select2({
    placeholder: 'None',
    allowClear: true
});
*/
$('[name="shipper"]').select2({
    placeholder: 'None',
    allowClear: true
});

$('#sampol').select2({
    placeholder: 'None',
    allowClear: true,
    multiple: true,
    data: [{id: 0, text: 'story'},{id: 1, text: 'bug'},{id: 2, text: 'task'}]
});
/*
$('[name="trucker"]').select2({
    placeholder: 'None',
    allowClear: true
});

$('[name="van-type"]').select2({
    placeholder: 'Select Van Type',
});

$('[name="checker"]').select2({
    placeholder: 'None',
    allowClear: true
});
*/