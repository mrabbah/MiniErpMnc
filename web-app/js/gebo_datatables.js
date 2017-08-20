/* [ ---- Gebo Admin Panel - datatables ---- ] */

$(document).ready(function() {
    //* basic
    gebo_datatbles.dt_a();
    gebo_datatbles.dt_a1();
    // horizontal scroll
    gebo_datatbles.dt_b();
    //* large table
    gebo_datatbles.dt_c();
    //* hideable columns
    gebo_datatbles.dt_d();
    //* Table tools
    gebo_datatbles.dt_tools();
    //* server side proccessing with hiden row
    gebo_datatbles.dt_e();
        gebo_datatbles.dt_list();
});

//* calendar
gebo_datatbles = {
    dt_a: function() {
        $('#dt_a').dataTable({
            "sDom": "<'row'<'span4'<'dt_actions'>l><'span4 pull-right'f>r>t<'row'<'span4'i><'span6 pull-right'p>>",
            "sPaginationType": "bootstrap_alt",
            "oLanguage": {
                "sLengthMenu": "_MENU_ Lignes par page",
                "sInfo": "Affichage de _START_ à _END_ sur _TOTAL_ .",
                "sEmptyTable": "La table est vide",
                "sInfoEmpty": "Affichage de 0 à 0 sur 0 .",
                "oPaginate": {
                    "sFirst": "",
                    "sLast": "",
                    "sNext": "",
                    "sPrevious": ""
                }
            }
        });
    },
      dt_a1: function() {
        $('#dt_a1').dataTable({
            "sDom": "<'row'<'span4'<'dt_actions'>l><'span4 pull-right'f>r>t<'row'<'span4'i><'span6 pull-right'p>>",
            "sPaginationType": "bootstrap_alt",
            "oLanguage": {
                "sLengthMenu": "_MENU_ Lignes par page",
                "sInfo": "Affichage de _START_ à _END_ sur _TOTAL_ .",
                "sEmptyTable": "La table est vide",
                "sInfoEmpty": "Affichage de 0 à 0 sur 0 .",
                "oPaginate": {
                    "sFirst": "",
                    "sLast": "",
                    "sNext": "",
                    "sPrevious": ""
                }
            }
        });
    },
    dt_b: function() {
        $('#dt_b').dataTable({
            "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
            "sScrollX": "100%",
            "sScrollXInner": '110%',
            "sPaginationType": "bootstrap",
            "bScrollCollapse": true
        });
    },
    dt_c: function() {

        var aaData = [];
        for (var i = 1, len = 1000; i <= len; i++) {
            aaData.push([i, i, i, i, i]);
        }
        ;

        $('#dt_c').dataTable({
            "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
            "sScrollY": "200px",
            "aaData": aaData,
            "bDeferRender": true
        });

        $('#fill_table').click(function() {
            var aaData = [];
            for (var i = 1, len = 50000; i <= len; i++) {
                aaData.push([i, i, i, i, i]);
            }
            ;

            $('#dt_c').dataTable({
                "sDom": "<'row'<'span6'><'span6'f>r>t<'row'<'span6'i><'span6'>S>",
                "sScrollY": "200px",
                "aaData": aaData,
                "bDestroy": true,
                "bDeferRender": true
            });
            $(this).remove();
            $('#entries').html('50 000');
            $('.dataTables_scrollHeadInner').css({'height': '34px', 'top': '0'});
        });

    },
    dt_d: function() {

        function fnShowHide(iCol) {
            /* Get the DataTables object again - this is not a recreation, just a get of the object */
            var oTable = $('#dt_d').dataTable();

            var bVis = oTable.fnSettings().aoColumns[iCol].bVisible;
            oTable.fnSetColumnVis(iCol, bVis ? false : true);
        }
        ;

        var oTable = $('#dt_d').dataTable({
            "sDom": "<'row'<'span4'<'dt_actions'>l><'span4 pull-right'f>r>t<'row'<'span4'i><'span6 pull-right'p>>",
            "sPaginationType": "bootstrap_alt",
            "oLanguage": {
                "sLengthMenu": "_MENU_ Lignes par page",
                "sInfo": "Affichage de _START_ à _END_ sur _TOTAL_ .",
                "sEmptyTable": "La table est vide",
                "sInfoEmpty": "Affichage de 0 à 0 sur 0 .",
                "oPaginate": {
                    "sFirst": "",
                    "sLast": "",
                    "sNext": "",
                    "sPrevious": ""
                }
            }
        });

        $('#dt_d_nav').on('click', 'li input', function() {
            fnShowHide($(this).val());
        });
    },
    dt_e: function() {
        if ($('#dt_e').length) {

            var oTable;

            /* Formating function for row details */
            function fnFormatDetails(nTr)
            {
                var aData = oTable.fnGetData(nTr);
                var sOut = '<table cellpadding="5" cellspacing="0" border="0" class="table table-bordered" >';
                sOut += '<tr><td>Rendering engine:</td><td>' + aData[2] + ' ' + aData[5] + '</td></tr>';
                sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
                sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
                sOut += '</table>';

                return sOut;
            }
            oTable = $('#dt_e').dataTable({
                "bProcessing": true,
                "bServerSide": true,
                "sDom": "<'row'<'span4'<'dt_actions'>l><'span4 pull-right'f>r>t<'row'<'span4'i><'span6 pull-right'p>>",
                "sPaginationType": "bootstrap_alt",
                "oLanguage": {
                "sLengthMenu": "_MENU_ Lignes par page",
                "sInfo": "Affichage de _START_ à _END_ sur _TOTAL_ .",
                "sEmptyTable": "La table est vide",
                "sInfoEmpty": "Affichage de 0 à 0 sur 0 .",
                "oPaginate": {
                    "sFirst": "",
                    "sLast": "",
                    "sNext": "",
                    "sPrevious": ""
                }
            },
                        "sAjaxSource": "/geotask/societe/test",
                "aoColumns": [
                    { "mData": "raisonSociale","bSortable": true},
                    { "mData": "adresse","bSortable": true},
                    { "mData": "telFix","bSortable": true},
                    { "mData": "fax","bSortable": true},
                    { "mData": "email","bSortable": true}
                ],
                "aaSorting": [[0,'asc']]
            });


            $('#dt_e').on('click', 'tbody td img', function() {
                var nTr = $(this).parents('tr')[0];
                if (oTable.fnIsOpen(nTr))
                {
                    /* This row is already open - close it */
                    this.src = "img/details_open.png";
                    oTable.fnClose(nTr);
                } else {
                    /* Open this row */
                    this.src = "img/details_close.png";
                    oTable.fnOpen(nTr, fnFormatDetails(nTr), 'details');
                }
            });

        }
    },
            dt_list: function() {
        if ($('#dt_list').length) {

            var oTable;

            /* Formating function for row details */
            function fnFormatDetails(nTr)
            {
                var aData = oTable.fnGetData(nTr);

                var sOut = '<table cellpadding="5" cellspacing="0" border="0" class="table table-bordered" >';
                sOut += '<tr><td>Rendering engine:</td><td>' + aData[2] + ' ' + aData[5] + '</td></tr>';
                sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
                sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
                sOut += '</table>';

                return sOut;
            }
            oTable = $('#dt_list').dataTable({
                "bProcessing": true,
                "bServerSide": true,
                "sDom": "<'row'<'span4'<'dt_actions'>l><'span4 pull-right'f>r>t<'row'<'span4'i><'span6 pull-right'p>>",
                "sPaginationType": "bootstrap_alt",
                "oLanguage": {
                "sLengthMenu": "_MENU_ Lignes par page",
                "sInfo": "Affichage de _START_ à _END_ sur _TOTAL_ .",
                "sEmptyTable": "La table est vide",
                "sInfoEmpty": "Affichage de 0 à 0 sur 0 .",
                "oPaginate": {
                    "sFirst": "",
                    "sLast": "",
                    "sNext": "",
                    "sPrevious": ""
                }
            },
                        "sAjaxSource": "/MiniErpMnc/LabelisationProjet/test",
                "aoColumns": [
                    { "mData": "nomprojet","bSortable": true},
                    { "mData": "datesoumission","bSortable": true},
                    { "mData": "etat","bSortable": true},
                    { "mData": "etape","bSortable": true},
                    { "mData": "commentaire","bSortable": false}
                ],
                "aaSorting": [[0,'asc']]
            });


//            $('#dt_list').on('click', 'tbody td img', function() {
//                var nTr = $(this).parents('tr')[0];
//                if (oTable.fnIsOpen(nTr))
//                {
//                    /* This row is already open - close it */
//                    this.src = "img/details_open.png";
//                    oTable.fnClose(nTr);
//                } else {
//                    /* Open this row */
//                    this.src = "img/details_close.png";
//                    oTable.fnOpen(nTr, fnFormatDetails(nTr), 'details');
//                }
//            });

        }
    },
    dt_tools: function() {
        if ($('#dt_tools').length) {
            $('#dt_tools').dataTable({
                "sPaginationType": "bootstrap",
                "sDom": "<'row'<'span4'l><'span4'T><'span4'f>r>t<'row'<'span6'i><'span6'p>>",
                "oTableTools": {
                    "aButtons": [
                        "copy",
                        "print",
                        {
                            "sExtends": "collection",
                            "sButtonText": 'Save <span class="caret" />',
                            "aButtons": ["csv", "xls", "pdf"]
                        }
                    ],
                    "sSwfPath": "lib/datatables/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
                }
            });
        }
    }
};