$(document).ready(function() {
    $("#selection2").hide();
      oTable = $('#example1').dataTable({
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
                 "sAjaxSource" : "/MiniErpMnc/LabelisationProjet/listEnCours",
                "aoColumns": [
                    { "mData": "nomProjet","bSortable": true},
                    { "mData": "etatProjet","bSortable": true}
                   
                ],
                "aaSorting": [[0,'asc']]
            });

    
    
    
    
    
    
    
    var profilselectionne=$( "#profil option:selected" ).text();
    if(profilselectionne==='BUREAU PERMANENT')
        {
             $("#committe").hide();
        }
        else
        {
             $("#committe").hide();
        }
    $("#profil").change(function()
{   
    var profil=$('select[name="profil"]').val();
   var context2=$("#context1").val();
    var url = context2+"/Utilisateur/verificationprofil";
            var data = {profil: profil};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    if(result==true)
                        {
                          $("#committe").hide()
                        }
                       else
                        {
                           $("#committe").show() 
                        }
                        
                                          },
                                                  
                                                  
                dataType: "json"
            });   
});
    
    if(($('#decisionEtape7Bp1').val()=='avisFavorable') ||(($('#decisionEtape7Bp1').val()=='')&&(($('#decisionEtape7Bp2').val()==''))))
        {
            $("#decisionEtape7Bp").prop("checked", true)
        }
        if(($('#administration1').val()==true) ||(($('#administration1').val()=='')&&(($('##administration2').val()==''))))
        {
            $("#administration1").prop("checked", true);
        }
    var isChecked = $('#checkedpreselction').val();
    $("#projetRejete").hide(); 
    $("#avisFavorablediv").show(); 
    var selected1 = $("input[type='radio'][name='decisionEtape6Bp']");
    $('#decisionEtape6Bp[type="radio"]').click(function(){
                if($(this).val() == "rejete"){
                    $("#projetRejete").show();
                    $("#avisFavorablediv").hide(); 
                }
                else if($(this).val() == "nouvelleVersion")
                    {
                      $("#projetRejete").hide();  
                      $("#avisFavorablediv").hide(); 
                    }
                    else if($(this).val() == "avisFavorable" || $(this).val() == "")
                        {
                            $("#projetRejete").hide(); 
                            $("#avisFavorablediv").show(); 
                        }
});
    var selected = $("input[type='radio'][name='decisionEtape7Bp']");
    $("#projetRejeteDecisionFinale").hide();
    if(selected.val()=='avisFavorable')
        {
            
            $("#projetRejeteDecisionFinale").hide();
        }
        else
            {
               $("#projetRejeteDecisionFinale").show(); 
            }
    
    
   // var isChecked = $('#rdSelect:checked').val()?true:false;
    if(isChecked==null || isChecked=='null' || isChecked=='')
        {
            $("#preselection").show();
            $("#reaudition").hide();
            $("#rejete").hide();
            $("#redirection").hide();
        }
    if ($("#siOui").length > 0) {
        if (recevable == true) {
            $("#siOui").show();
            $("#oui1").show();
        }
        else {
            $("#siOui").hide();
            $("#oui1").hide();
        }
    }

    $("input[name='recevable']").change(function() {
        if (this.value === "true") {
            $("#siOui").show();
            var context5=$("#context1").val();
            var url = context5+"/MailTemplate/getTemplate";
            var data = {state: 'mailEtape2Accepter'};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    $('#templateEtape2').html(result.template);
                },
                dataType: "json"
            });
        }
        if (this.value === "false") {
            $("#siOui").hide();
            var url = context5+"/MailTemplate/getTemplate";
            var data = {state: 'mailEtape2Refuser'};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    $('#templateEtape2').html(result.template);
                },
                dataType: "json"
            });
        }
    });
    
    $("input[name='decisionEtape2Bp']").change(function() {
        if (this.value == "preselection") {
            $("#preselection").show();
            $("#reaudition").hide();
            $("#rejete").hide();
            $("#redirection").hide();
            $("#selection2").hide();
            $("#selection1").show();
        }
        if (this.value == "reaudition") {
            $("#reaudition").show();
            $("#redirection").hide();
            $("#rejete").hide();
            $("#preselection").hide();
            $("#selection2").hide();
            $("#selection1").show();
        }
        if (this.value == "redirection") {
            $("#redirection").show();
            $("#reaudition").hide();
            $("#rejete").hide();
            $("#preselection").hide();
            $("#selection2").show();
            $("#selection1").hide();
        }
        if (this.value == "rejete") {
            $("#rejete").show();
            $("#reaudition").hide();
            $("#redirection").hide();
            $("#preselection").hide();
            $("#selection2").hide();
            $("#selection1").show();
        }
    });

    $("input[name='competenceexternesollicite']").change(function() {
        if (this.value == "true") {
            $("#compétenceexternesollicite").show();
        }
        if (this.value == "false") {
            $("#compétenceexternesollicite").hide();
        }
    });
    
    $("input[name='decisionAchanger']").change(function() {
        if (this.value == "avisFavorable") {
            $("#projetRejete").hide();
            $("#avisFavorable").show();
        }
        if (this.value == "rejete") {
            $("#projetRejete").show();
            $("#avisFavorable").hide();
        }
        if (this.value == "nouvelleVersion") {
            $("#projetRejete").hide();
            $("#avisFavorable").hide();
        }
    });

    $("input[name='decisionFinale']").change(function() {
        if (this.value == "avisFavorable") {
            $("#projetRejeteDecisionFinale").hide();
        }
        if (this.value == "rejete") {
            $("#projetRejeteDecisionFinale").show();
        }
    });


    $('#preselection').change(function() {
        if (this.value == "preselection") {
            $('#dateReaudition').attr("disabled", "disabled");
            $('#motifRejetPreselection').attr("disabled", "disabled");
            $('#dateActionPreselectionEtape5').removeAttr("disabled");
            $('#dateActionPreselectionEtape5').val("");
            var context51=$("#context1").val();
            var url = context51+"/MailTemplate/getTemplate";
            var data = {state: 'mailEtape6Preselection'};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    $('#templateEtape6').html(result.template);
                },
                dataType: "json"
            });
        }
        if (this.value == "re-audition") {
            $('#motifRejetPreselection').attr("disabled", "disabled");
            $('#dateActionPreselectionEtape5').attr("disabled", "disabled");
            $('#dateReaudition').removeAttr("disabled");
            $('#dateReaudition').val("");
            var context56=$("#context1").val();
            var url = context56+"/MailTemplate/getTemplate";
            var data = {state: 'mailEtape6Re-audition'};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    $('#templateEtape6').html(result.template);
                },
                dataType: "json"
            });
        }
        if (this.value == "rejet") {
            $('#dateReaudition').attr("disabled", "disabled");
            $('#dateActionPreselectionEtape5').attr("disabled", "disabled");
            $('#motifRejetPreselection').removeAttr("disabled");
            $('#motifRejetPreselection').val("");
            var context8=$("#context1").val();
            var url = context8+"/MailTemplate/getTemplate";
            var data = {state: 'mailEtape6Rejet'};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    $('#templateEtape6').html(result.template);
                },
                dataType: "json"
            });
        }
    });

    $(".chzn_f").change(function() {
        var ids1 = $(".chzn_f").val();
        $("#membresComiteValides").chosen().empty();
        $('#membresComiteValides').trigger('liszt:updated');
        var listecomite = ids1.join();
        var context8=$("#context1").val();
        var url = context8+"/Utilisateur/userbycomite";
        var data = {comites: listecomite};
        $.ajax({
            type: 'POST',
            url: url,
            data: data,
            success: function(result) {
                $.each(result, function(key, value) {
                    $(".chzn_e").append("<option value='" + value.id + "'>" + value.nom + ' ' + value.prenom + "</option>");
                    $(".chzn_e").trigger("liszt:updated");
                });

            },
            dataType: "json"
        });
    });

    $("input[name='president']").click(function() {
        var context8=$("#context1").val();
        $.post(context8+"/ComiteThematique/selectpresident",
                {
                    value: this.id
                },
        function(data) {
            if (data === 0) {
                $.sticky("L'opération a été enregistré.", {autoclose: 5000, position: "top-center", type: "st-error"});
            }
            else {
                $.sticky("L'opération n'a pas été enregistré.", {autoclose: 5000, position: "top-center", type: "st-error"});
            }
        }
        );
    });

    $("input[name='stateEtape9']").change(function() {
        if (this.value == "Conforme") {
            $('#raisonNonConformiteEtape9').val("");
            $('#dateLimiteRemiseNouvelleVersion').val("");
            $('#raisonNonConformiteEtape9').attr("disabled", "disabled");
            $('#dateLimiteRemiseNouvelleVersion').attr("disabled", "disabled");
            $('#syntheseEvaluations').removeAttr("disabled");
            $('#dateEnvoiDecisionPorteur').removeAttr("disabled");
            $('#datePrevuAuditionComex').removeAttr("disabled");
            $('#syntheseEvaluations').val("");
            $('#recommandations').removeAttr("disabled");
            $('#recommandations').val("");
            var context9=$("#context1").val();
            var url = context9+"/MailTemplate/getTemplate";
            var data = {state: 'mailEtape6Preselection'};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    $('#templateEtape10').html(result.template);
                },
                dataType: "json"
            });
        }
        if (this.value == "Non conforme") {
            $('#dateEnvoiDecisionPorteur').attr("disabled", "disabled");
            $('#datePrevuAuditionComex').attr("disabled", "disabled");
            $('#syntheseEvaluations').attr("disabled", "disabled");
            $('#recommandations').attr("disabled", "disabled");
            $('#dateEnvoiDecisionPorteur').val("");
            $('#datePrevuAuditionComex').val("");
            $('#syntheseEvaluations').val("");
            $('#recommandations').val("");
            $('#raisonNonConformiteEtape9').removeAttr("disabled");
            $('#raisonNonConformiteEtape9').val("");
            $('#dateLimiteRemiseNouvelleVersion').removeAttr("disabled");
            $('#dateLimiteRemiseNouvelleVersion').val("");
            var context91=$("#context1").val();
            var url = context91+"/MailTemplate/getTemplate";
            var data = {state: 'mailEtape6Re-audition'};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    $('#templateEtape10').html(result.template);
                },
                dataType: "json"
            });
        }
    });

});