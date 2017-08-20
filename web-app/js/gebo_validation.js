/* [ ---- Gebo Admin Panel - validation ---- ] */

$(document).ready(function() {
//    $("#budget").mask("9999.9999.99");
    //* validation with tooltips
var j='';
$('#dateDebut')
    .datepicker({
    startDate: "today",format: 'dd/mm/yyyy'
}).on('changeDate', function (ev) {
    var valini=$( "#dateDebut" ).val();
        var dsplit2 = valini.split("/");
        var d255=new Date(dsplit2[2]+"-"+dsplit2[1]+"-"+dsplit2[0]);
        j=d255;
       $('#dateFin').datepicker({
   startDate: new Date(d255),format: 'dd/mm/yyyy'
});


}).data('datepicker');


    gebo_validation.ttip();
    //* regular validation
    gebo_validation.firststep();
    gebo_validation.secondstep();
    gebo_validation.form_recevabilitestep();
    gebo_validation.form_2Bp();
    gebo_validation.form_3Porteur();
    gebo_validation.form_template();
    gebo_validation.forthstep();
    gebo_validation.sixthstep();
    gebo_validation.fifthstep();
    gebo_validation.fifthstep2();
    gebo_validation.fifthstep1();
    gebo_validation.seventhstep();
    gebo_validation.eighthstep();
    gebo_validation.eighthstep6();
    gebo_validation.ninethstep();
    gebo_validation.tenthstep();
    gebo_validation.eleventhstep();
    gebo_validation.twelvethstep();
    gebo_validation.thirteenthstep();
    gebo_validation.utilisateur();
    gebo_validation.finalstep();
    
    jQuery.validator.addMethod("uploadFile", function (val, element) {

          var size = element.files[0].size;
            console.log(size);

           if (size > 1048576*10)// checks the file more than 1 MB
           {
               console.log("returning false");
                return false;
           } else {
               console.log("returning true");
               return true;
           }

      }, "la taille du fichier ne doit pas depassé 1 MB");
    
    

    $.validator.addMethod(
            "checkdate",
            function(value, element) {
                if (!value.match(/^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/)) {
                    return false;
                }
                else {
                    return true;
                }
            },
            "Please enter a date in the format dd/mm/yyyy"
            );

    jQuery.validator.addMethod('selectcheck', function(value) {
        return (value != 'sélectionner');
    }, "Ce champ est obligatoire.");
    
    jQuery.validator.addMethod('requiredfieldcomitesThematiques', function(value) {
        if($("input[name='recevable']:checked").val()=="true"){
            var values = $("#comitesThematiques").chosen().val();
            if(values==null){
               return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }, "Ce champ est obligatoire.");
    
     jQuery.validator.addMethod('requiredfieldclusters', function(value) {
        if($("input[name='recevable']:checked").val()=="true"){
            var values = $("#clusters").chosen().val();
            if(values==null){
               return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }, "Ce champ est obligatoire.");
    
     jQuery.validator.addMethod('requiredfieldrapporteurs', function(value) {
        if($("input[name='recevable']:checked").val()=="true"){
            var values = $("#rapporteurs").chosen().val();
            if(values==null){
               return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }, "Ce champ est obligatoire.");
    
     jQuery.validator.addMethod('requiredfieldconflitint', function(value) {
        if($("input[name='recevable']:checked").val()=="true"){
            var values = $("#conflitint").chosen().val();
            if(values==null){
               return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }, "Ce champ est obligatoire.");
    
     jQuery.validator.addMethod('requiredfielddateAudition', function(value) {
        if($("input[name='recevable']:checked").val()=="true"){
            var value = $("#dateAudition").val();
            if(value==""){
               return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }, "Ce champ est obligatoire.");
    
     jQuery.validator.addMethod('requiredfieldlieuAudition', function(value) {
        if($("input[name='recevable']:checked").val()=="true"){
            var value = $("#lieuAudition").val();
            if(value==""){
               return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }, "Ce champ est obligatoire.");
    
     jQuery.validator.addMethod('requiredfieldreglesGestion', function(value) {
        if($("input[name='recevable']:checked").val()=="true"){
            var value = $("#reglesGestion").val();
            if(value==""){
               return false
            }
            else{
                return true
            }
        }
        else{
            return true
        }
    }, "Ce champ est obligatoire.");
    
    jQuery.validator.addMethod('checktinymce', function(value) {
        return false;
    }, "This field is required.");
jQuery.validator.addMethod("emailordomain", function(value, element) {
  return this.optional(element) || /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/.test(value) || /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/.test(value);
}, "Please specify the correct url/email");
    jQuery.validator.addMethod('greaterThan', function(value) {
//    if ($("#dateDebut").val()>value || $("#dateDebut").val()==value)
    if( (new Date($("#dateDebut").val()).getTime() > new Date(value).getTime()) || (new Date($("#dateDebut").val()).getTime() === new Date(value).getTime()))
    {
//            var dateTime = $("#dateDebut").val();
//            var startDate = dateTime;
//var date = new Date(startDate);
            return false;
        }
        else{
            return true;
        }
        
    }, "la date de fin doit être supérieure à la date de début.");

 jQuery.validator.addMethod('greaterThan1', function(value) {
      var val11=value.substring(0, 10);
      var valini1=$( "#datesoumission" ).val().substring(0, 10);
 var arrStartDate = val11.split("/");
var date11 = new Date(arrStartDate[2], arrStartDate[1], arrStartDate[0]);
var arrEndDate = valini1.split("-");
var date22 = new Date(arrEndDate[0], arrEndDate[1], arrEndDate[2]);
 
 if(date11 > date22)
      {
                return true;
                 
      }
      else
          {
              return false;
          }
      
      
      
      
      
//      var valini=$( "#datesoumission" ).val().substring(0, 10);
//      var test=$( "#datesoumission" ).val();
//      var ccvfv=test.substr(0,10);
//      var dsplit2 = ccvfv.split("-");
//        var d255=new Date(dsplit2[2]+"/"+dsplit2[1]+"/"+dsplit2[0]);
//    if( (new Date(d255).getTime() > new Date(value).getTime()) || (new Date(d255).getTime() === new Date(value).getTime()))
//    {
//            return false;
//        }
//        else{
//            return true;
//        }
        
    }, "cette date audition doit être supérieure à la date de Soumission.");
   jQuery.validator.addMethod('greaterThan22', function(value) {
     
   if($( "#datereuadition" ).val()!=null && $( "#datereuadition" ).val()!="" && $( "#datereuadition" ).val()!="null")
         {
     var val11=value.substring(0, 10);
      var valini1=$( "#datereuadition" ).val().substring(0, 10);
 var arrStartDate = val11.split("/");
var date11 = new Date(arrStartDate[2], arrStartDate[1], arrStartDate[0]);
var arrEndDate = valini1.split("-");
var date22 = new Date(arrEndDate[0], arrEndDate[1], arrEndDate[2]);
 if(date11 > date22)
      {
                return true; 
      }
      else
          {
              return false;
          }
         }
         else
             {
              return true;   
             }
    }, "cette date doit être supérieure à la date reaudition.");
 jQuery.validator.addMethod('greaterThan2', function(value) {
     
     var val11=value.substring(0, 10);
      var valini1=$( "#dateAuditionEtape1Bp" ).val().substring(0, 10);

 var arrStartDate = val11.split("/");
var date11 = new Date(arrStartDate[2], arrStartDate[1], arrStartDate[0]);
var arrEndDate = valini1.split("/");
var date22 = new Date(arrEndDate[2], arrEndDate[1], arrEndDate[0]);
 if(date11 > date22)
      {
                return true; 
      }
      else
          {
              return false;
          }
     
     
     
     
//      var test=$( "#dateAuditionEtape1Bp" ).val();
//      var ccvfv=test.substr(0,10);
//      var parts =ccvfv.split('/');
//var gg=parts[2].toString()+"-"+parts[1].toString()+"-"+parts[0].toString();
//var s = new Date(gg);
//      
//      var gg1=value;
//      var ccvfv11=gg1.substr(0,10);
//      var parts11 =ccvfv11.split('/');
//      var hh=parts11[2]+"-"+parts11[1]+"-"+parts11[0];
//      var s45 = new Date(hh);
//    if( (s.getTime() > s45.getTime()) ||(s.getTime() === s45.getTime()))
//    {
//            return false;
//        }
//        else{
//            return true;
//        }
        
    }, "cette date doit être supérieure à la date audition.");
    
    
  jQuery.validator.addMethod('greaterThan3', function(value) {
      var val11=value.substring(0, 10);
      var valini1=$( "#datePreselectionEtape2Bp" ).val().substring(0, 10);
 var arrStartDate = val11.split("/");
var date11 = new Date(arrStartDate[2], arrStartDate[1], arrStartDate[0]);
var arrEndDate = valini1.split("/");
var date22 = new Date(arrEndDate[2], arrEndDate[1], arrEndDate[1]);
 if(date11 > date22)
      {
                return true;
               
      }
      else
          {
              return false;
          }
     
      
      
      
      
//     var test=$("#datePreselectionEtape2Bp" ).val();
//      var ccvfv=test.substr(0,10);
//    if( (new Date(ccvfv).getTime() > new Date(value).getTime()) || (new Date(ccvfv).getTime() === new Date(value).getTime()))
//    {
//            return false;
//        }
//        else {
//            return true;
//        }
        
    }, "cette date de validation doit être supérieure à la date preselection.");
    
    
//    jQuery.validator.addMethod('greaterThan3', function(value) {
// var test=$( "# datePreselectionEtape2Bp" ).val();
// console.log("date validation  greaterThan3");
//      var ccvfv=test.substr(0,10);
//    if( (new Date(ccvfv).getTime() > new Date(value).getTime()) || (new Date(ccvfv).getTime() === new Date(value).getTime()))
//    {
////            var dateTime = $("#dateDebut").val();
////            var startDate = dateTime;
////var date = new Date(startDate);
//            return false;
//        }
//        else{
//            return true;
//        }
//        
//    }, "cette date doit être supérieure à la date de preselection.");
   jQuery.validator.addMethod('greaterThan4', function(value) {
       var val11=value.substring(0, 10);
      var valini1=$( "#dateValidation" ).val().substring(0, 10);

 var arrStartDate = val11.split("/");
var date11 = new Date(arrStartDate[2], arrStartDate[1], arrStartDate[0]);
var arrEndDate = valini1.split("/");
var date22 = new Date(arrEndDate[2], arrEndDate[1], arrEndDate[0]);
 if(date11 > date22)
      {
                return true;
      }
      else
          {
              return false;
          }
       
       
       
// var test=$("#dateValidation").val();
//      var ccvfv=test.substr(0,10);
//    if( (new Date(ccvfv).getTime() > new Date(value).getTime()) || (new Date(ccvfv).getTime() === new Date(value).getTime()))
//    {
//            return false;
//        }
//        else{
//            return true;
//        }
        
    }, "Cette date doit être supérieure à la date de Validation.");
    
    jQuery.validator.addMethod('greaterThan5', function(value) {
        var val11=value.substring(0, 10);
      var valini1=$( "#dateAuditionEtape6Bp" ).val().substring(0, 10);
 var arrStartDate = val11.split("/");
var date11 = new Date(arrStartDate[2], arrStartDate[1], arrStartDate[0]);
var arrEndDate = valini1.split("/");
var date22 = new Date(arrEndDate[2], arrEndDate[1], arrEndDate[0]);
 if(date11 > date22)
      {
                return true;  
                 
      }
      else
          {
              return false;
          }
        
        
        
// var test=$("#dateAuditionEtape6Bp" ).val();
//
//      var ccvfv=test.substr(0,10);
//    if( (new Date(ccvfv).getTime() > new Date(value).getTime()) || (new Date(ccvfv).getTime() === new Date(value).getTime()))
//    {
//            return false;
//        }
//        else{
//            return true;
//        }
        
    }, "Date réélle Commex  doit être supérieure à la date de Validation.");
    
});


//* validation
gebo_validation = {
    ttip: function() {
        var ttip_validator = $('.form_validation_ttip').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            rules: {
                first_name: {required: true, minlength: 3},
                last_name: {required: true, minlength: 3},
                your_message: {required: true, minlength: 20},
                days: {required: true, minlength: 2},
                gender: {required: true},
                address2: {required: true, minlength: 5},
                city: {required: true, minlength: 2},
                state: {required: true, minlength: 3}
            },
            invalidHandler: function(form, validator) {
                $.sticky("There are some errors. Please corect them and submit again.", {autoclose: 5000, position: "top-right", type: "st-error"});
            },
            errorPlacement: function(error, element) {
                // Set positioning based on the elements position in the form
                var elem = $(element);

                // Check we have a valid error message
                if (!error.is(':empty')) {
                    if ((elem.is(':checkbox')) || (elem.is(':radio'))) {
                        // Apply the tooltip only if it isn't valid
                        elem.filter(':not(.valid)').parent('label').parent('div').find('.error_placement').qtip({
                            overwrite: false,
                            content: error,
                            position: {
                                my: 'left bottom',
                                at: 'center right',
                                viewport: $(window),
                                adjust: {
                                    x: 6
                                }
                            },
                            show: {
                                event: false,
                                ready: true
                            },
                            hide: false,
                            style: {
                                classes: 'ui-tooltip-red ui-tooltip-rounded' // Make it red... the classic error colour!
                            }
                        })
                                // If we have a tooltip on this element already, just update its content
                                .qtip('option', 'content.text', error);
                    } else {
                        // Apply the tooltip only if it isn't valid
                        elem.filter(':not(.valid)').qtip({
                            overwrite: false,
                            content: error,
                            position: {
                                my: 'bottom left',
                                at: 'top right',
                                viewport: $(window),
                                adjust: {x: -8, y: 6}
                            },
                            show: {
                                event: false,
                                ready: true
                            },
                            hide: false,
                            style: {
                                classes: 'ui-tooltip-red ui-tooltip-rounded' // Make it red... the classic error colour!
                            }
                        })
                                // If we have a tooltip on this element already, just update its content
                                .qtip('option', 'content.text', error);
                    }
                    ;

                }
                // If the error is empty, remove the qTip
                else {
                    if ((elem.is(':checkbox')) || (elem.is(':radio'))) {
                        elem.parent('label').parent('div').find('.error_placement').qtip('destroy');
                    } else {
                        elem.qtip('destroy');
                    }
                }
            },
            success: $.noop // Odd workaround for errorPlacement not firing!
        })
    },
    firststep: function() {
//        $("#website").change(function() {
//          if ($(this).val() != '')
//                  $("#websitemail").attr('disabled', 'disabled');  
//          else
//              $("#websitemail").removeAttr("disabled");
//      });
//
//      $("#websitemail").change(function() {
//          if ($(this).val() != '')
//                  $("#website").attr('disabled', 'disabled');
//          else
//              $("#website").removeAttr("disabled");
//      });
      
//      if ($("#website").val() != '')
//                  $("#websitemail").attr('disabled', 'disabled');  
//          else
//              $("#websitemail").removeAttr("disabled");
//          if ($("#website").val() != '')
//                  $().attr('disabled', 'disabled');  
//          else
//              $("#website").removeAttr("disabled");

$("#comitesThematiques").change(function()
{   
    var listcommite=$("#comitesThematiques").val();
    var commites=null;
    var context1=$("#context1").val();
    if(listcommite!==null)
        {
         commites=listcommite.toString(); 
        }
    var url = context1+"/LabelisationProjet/getUtilisateurscommitethematique";
            var data = {commites: commites};
            $.ajax({
                type: 'POST',
                url: url,
                data: data,
                success: function(result) {
                    var options = ' ';
                    if(result==true)
                        {
                           $('#evaluateurs').html(options);  
                        }
                        else
                            {
                               $.each(result, function(key, value) {
 
//         $('#test')
//         .append($("<option></option>")
//         .attr("value",value.id)
//         .text(value.nom+" "+value.prenom));  
                            
                              options += '<option value="' + value.id + '">' + value.nom+" "+value.prenom + '</option>';
                                                     $('#evaluateurs').html(options);
                                                 }); 
                                
                            }
                    
                 
                                          },
                                                  
                                                  
                dataType: "json"
            });   
});
          
//       if($("#budget").val())
//        {
//         var lonbudget=$("#budget").val().length; 
//         var budget=$("#budget").val();
//         var cum='';
//         var cum1='';
//         if(lonbudget>4)
//             {
//                 res = budget.substring(0, 4);
//                 cum+=res+".";
//                 cum1+=res;
//                 res1 = budget.substring(4, lonbudget);
//                 var h=true;
//                 while(res1>4 && h==true)
//                     {
//                        res1 = budget.substring(4, lonbudget);
//                        if(res1.length>4)
//                            {
//                              res2 = budget.substring(0, 4);
//                              cum+=res2+".";
//                              cum1+=res2;
//                              res1 = budget.substring(4, lonbudget);  
//                            }
//                            else
//                            {
//                                    h=false;
//                                    cum+=res1;
//                                    cum1+=res1;
//                            }
//                     }
//                 
//             }
//             else
//                 {
//                  cum+=budget;  
//                  cum+=budget;
//                 }
//                 
//                 $("#budget").val(cum);
//                 $("#budget1").val(cum1);
//        };
          
          
          
//        $("#budget").change(function()
//        {
//        var lonbudget=$("#budget").val().length; 
//         var budget=$("#budget").val();
//         var cum='';
//         var cum1='';
//         if(lonbudget>4)
//             {
//                 res = budget.substring(0, 4);
//                 cum+=res+".";
//                 cum1+=res;
//                 res1 = budget.substring(4, lonbudget);
//                 var h=true;
//                 while(res1>4 && h==true)
//                     {
//                        res1 = budget.substring(4, lonbudget);
//                        if(res1.length>4)
//                            {
//                              res2 = budget.substring(0, 4);
//                              cum+=res2+".";
//                              cum1+=res2;
//                              res1 = budget.substring(4, lonbudget);  
//                            }
//                            else
//                            {
//                                    h=false;
//                                    cum+=res1;
//                                    cum1+=res1;
//                            }
//                     }
//                 
//             }
//             else
//                 {
//                  cum+=budget;  
//                 }
//                 $("#budget").val(cum);
//                 $("#budget1").val(cum1);
//        });
        
        reg_validator = $('.form_firststep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                interlocuteur: {required: true, minlength: 2},
                fonction: {required: true, minlength: 2},
                nomProjet: {required: true, minlength: 2},
                nomCompletProjet: {required: true, minlength: 2},
//                website: {required: true, emailordomain: true},
//                websitemail: {required: true,emailordomain: true},
                aap: {required: true, number: 2},
                budget: {required: true, number: true,min:50000},
                duree: {required: true, number: true,min:6,max:54},
                dateDebut: {required: true, checkdate: true},
                datepicker: {required: true, checkdate: true},
                dateFin: {required: true, checkdate: true},
//                dateFin: {required: true, checkdate: true, greaterThan: true},
                datepicker2: {required: true, checkdate: true, greaterThan: true},
                resumeFrancais: {required: true, minlength: 20},
//                resumeAnglais: {required: true, minlength: 20},
//                lienAap: {required: true, minlength: 2},
                motsCles: {required: true, minlength: 2},
                aide: {required: true, minlength: 2}
            },
                    messages: {
                interlocuteur: {required: "Ce champ est obligatoire"},
                fonction: {required: "Ce champ est obligatoire"},
                nomProjet: {required: "Ce champ est obligatoire"},
                nomCompletProjet: {required: "Ce champ est obligatoire"},
                aap: {required: "Ce champ est obligatoire"},
                budget: {required: "Ce champ est obligatoire",number:"ce champ doit etre un numero",min:"la valeur du champ doit etre superieur ou egal à 50000"},
                dateDebut: {required: "Ce champ est obligatoire"},
                duree: {required: "Ce champ est obligatoire",number:"ce champ doit etre un numero",min:"la valeur du champ doit etre superieur ou egal à 6",max:"la valeur du champ doit etre inferieur ou egal à 54"},
                dateFin: {required: "Ce champ est obligatoire"},
                resumeFrancais: {required: "Ce champ est obligatoire"},
                resumeAnglais: {required: "Ce champ est obligatoire"},
                motsCles: {required: "Ce champ est obligatoire"},
                aide: {required: "Ce champ est obligatoire"}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-right", type: "st-error"});
            },
            submitHandler: function(form, validator) {
        var kkk=$("#city").val();
    var nomprojet=$("#nomProjet").val();
    var idprojet=$("#idprojet").val();
    var context1=$("#context1").val();
    var got=false;
    var url = context1+"/LabelisationProjet/verificationnomprojet";
            var data = {projet: nomprojet,idprojet:idprojet};
            $.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: function(result) {
            if (result === "true") {
                got = true;
                $.sticky("il existe deja un projet avec ce nom, veuillez le changer", {autoclose: 10000, position: "top-left", type: "st-error"});  
            }
        },
        dataType: "text",
        async: false
    }); 
        if(got===true)
            {
               
            }
            else
                {
           form.submit();
                }
                
                
                
    }
        });
    },
    secondstep: function() {
        reg_validator = $('.form_secondtstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            ignore: ":hidden:not(select)",
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                recevable: {required: true},
                raisonRecevabilite: {required: true, minlength: 2},
                comitesThematiques: {requiredfieldcomitesThematiques: true},
                clusters: {requiredfieldclusters: true},
                rapporteurs: {requiredfieldrapporteurs: true},
                conflitint: {requiredfieldconflitint: true},
                //reglesGestion: {requiredfieldreglesGestion: true},
                dateAuditionEtape1Bp: {required: true, greaterThan1: true},
                lieuAuditionEtape1Bp: {required: true}
               
        //, 
                //autre:{required: false, email: true}
            },
                     messages: {
                recevable: {required: "Ce champ est obligatoire"},
                raisonRecevabilite: {required: "Ce champ est obligatoire"},
                comitesThematiques: {required: "Ce champ est obligatoire"},
                clusters: {required: "Ce champ est obligatoire"},
                rapporteurs: {required: "Ce champ est obligatoire"},
                conflitint: {required: "Ce champ est obligatoire"},
                dateAuditionEtape1Bp: {required: "Ce champ est obligatoire"},
                lieuAuditionEtape1Bp: {required: "Ce champ est obligatoire"}
                
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
//        var valini=$( "#datesoumission" ).val().substring(0, 10);
//      var test=$( "#datesoumission" ).val();
//      var ccvfv=test.substr(0,10);
//      var test1=$( "#dateAuditionEtape1Bp" ).val();
//      var ccvfv1=test.substr(0,10);
       var autreevaluateurs=$("#autre").val();
       var recevable=$("input[name=recevable]:checked").val();
       var context1=$("#context1").val();
if(recevable==="false")
    {
     form.submit();   
    }
    else
        {
//            if( (new Date(ccvfv).getTime() > new Date(ccvfv1).getTime()) || (new Date(ccvfv).getTime() === new Date(ccvfv1).getTime()))
//    {

//        }
//        else
//            {
           var got=false;
    var url = context1+"/LabelisationProjet/verificationautresevaluateurs";
            var data = {autreeva: autreevaluateurs};
            $.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: function(result) {
            if (result === "true") {
                got = true;
                $.sticky("vous devriez taper des mails separés par ; comme indiqué au dessous du champ autres", {autoclose: 10000, position: "top-left", type: "st-error"});  
            }
            else
                {
                    if (confirm('Vous-avez déjà confirmé le rendez-vous avec le porteur concernant la date et lieu d\'audition ?')) 
                    {
                        form.submit();
                    } 
                    
                }
        },
        dataType: "text",
        async: false
    }); 
            
        }
//        }
    
             
    }
    
    
    
    
        });
    },
     form_recevabilitestep: function() {
        reg_validator = $('.form_recevabilitestep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            ignore: ":hidden:not(select)",
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
         accepterReglesConfidentialite:
       {
            required: true
       },
        presentation: {
//            required: true, extension: "docx|doc|ppt"
//            required: true, extension: "pptx|ppt",filesize: 2000000
            required: true, extension: "pdf", uploadFile:true
        }
      
//                recevable: {required: true},
//                raisonRecevabilite: {required: true, minlength: 2},
//                comitesThematiques: {requiredfieldcomitesThematiques: true},
//                clusters: {requiredfieldclusters: true},
//                rapporteurs: {requiredfieldrapporteurs: true},
//                conflitint: {requiredfieldconflitint: true},
//                reglesGestion: {requiredfieldreglesGestion: true},
//                dateAudition: {requiredfielddateAudition: true},       
//                lieuAudition: {requiredfieldlieuAudition: true}          
            },
                     messages: {
                accepterReglesConfidentialite: {required: "Ce champ est obligatoire"},
                presentation: {required: "Ce champ est obligatoire",extension:"le type de fichier doit etre sous format pdf",filesize:"la taille du fichier ne doit pas depasse 2MO"}
               
                
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {

        
        
      //$.sticky("vous avez valider etape recevabilite pour passer à pitch CT .", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
   form_2Bp: function() {
        reg_validator = $('.form_2Bp').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            ignore: ":hidden:not(select)",
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
        

//        rapportCT  : {required: true, extension: "xls|csv|docx|doc|pdf",filesize: 1000000},
              datePreselectionEtape2Bp: { required: true,greaterThan2: true},
              
              dateReauditionEtape2Bp: { required: true,greaterThan2: true,greaterThan22: true},
              
              rapportCT  : {required: true, uploadFile:true}
//        ,
//                autre:{required: false, email: true}
//         decisionEtape2Bp:
//       {
//            required: true
//       }
//       ,
                       
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
            
      form.submit(); 
      
       
       
    }
        });
    },
    form_3Porteur: function() {
        reg_validator = $('.form_3Porteur').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            ignore: ":hidden:not(select)",
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
         presentationdetaillee:
       {
            required: true, extension: "xls|csv|docx|doc|pdf", uploadFile:true
       },
        ficheTechnique  : {
            required: true, extension: "xls|csv|docx|doc|pdf", uploadFile:true
        }
      
//                recevable: {required: true},
//                raisonRecevabilite: {required: true, minlength: 2},
//                comitesThematiques: {requiredfieldcomitesThematiques: true},
//                clusters: {requiredfieldclusters: true},
//                rapporteurs: {requiredfieldrapporteurs: true},
//                conflitint: {requiredfieldconflitint: true},
//                reglesGestion: {requiredfieldreglesGestion: true},
//                dateAudition: {requiredfielddateAudition: true},       
//                lieuAudition: {requiredfieldlieuAudition: true}          
            },
                     messages: {
                presentationdetaillee: {required: "Ce champ est obligatoire",extension:"le type de fichier doit etre sous formats(xls|csv|docx|doc|pdf)",filesize:"la taille du ne doit depasse 1MO"},
                ficheTechnique: {required: "Ce champ est obligatoire",extension:"le type de fichier doit etre sous formats(xls|csv|docx|doc|pdf)",filesize:"la taille du ne doit depasse 1MO"}
               
                
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez valider etape pitch CT pour passer à Validation CT .", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    
    
    form_template: function() {
        reg_validator = $('.form_template').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            ignore: ":hidden:not(select)",
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
         code:
       {
            required: true
       },
        template  : {
            required: true
        }   
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
       form.submit();
    }
        });
    },
    
    
    
    
    forthstep: function() {
        reg_validator = $('.form_forthstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            ignore: ":hidden:not(select)",
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                clusters: {required: true},
                rapporteursInternes: {required: true},
                rapporteursExternes: {required: true},
                comitesThematiques4: {required: true},
                membresComiteValides: {required: true},
                dateDiffusionProposition: {required: true, checkdate: true},
                datePresentation1: {required: true, checkdate: true}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
             ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez la forthstep etape.", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    sixthstep: function() {
        reg_validator = $('.form_sixthstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                preselection: {selectcheck: true},
                motifRejetPreselection: {required: true, minlength: 20},
                dateReaudition: {checkdate: true},
                dateActionPreselectionEtape5: {checkdate: true}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
              ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez la sixthstep etape.", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    fifthstep: function() {
        reg_validator = $('.form_fifthstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
//                presentationetape5: {required: true, extension: "xls|csv|docx|doc|pdf"}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez de l\'étape Evaluation CT à Decision Commex.", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    fifthstep2: function() {
         $('.form_fifthstep').load({
           
          });
    },
    fifthstep1: function() {
        reg_validator = $('.form_fifthstep5').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
//                presentationetape5: {required: true, extension: "xls|csv|docx|doc|pdf"}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez de l\'étape Labelisation Commex à Post_Label.", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    seventhstep: function() {
        reg_validator = $('.form_seventhstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                fichetechnique: {required: true, extension: "xls|csv|docx|doc|pdf"},
                        autre:{required: false}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
             ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez de PD+FT  appel à compétences.", {autoclose: 10000, position: "top-left", type: "st-error"});
    form.submit();
            }
        });
    },
    eighthstep: function() {
        reg_validator = $('.form_eighthstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
//                datePlanificationDiffusion: {required: true, checkdate: true},
//                dateDiffusion: {required: true, checkdate: true}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
     // $.sticky("vous avez passez de appel à compétences à resultat d'evaluation.", {autoclose: 10000, position: "top-left", type: "st-error"});
         var autreevaluateurs=$("#competenceexterne1").val();
    var got=false;
    var context12=$("#context1").val();
    var url = context12+"/LabelisationProjet/verificationautresevaluateurs";
            var data = {autreeva: autreevaluateurs};
            $.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: function(result) {
            if (result === "true") {
                got = true;
                $.sticky("vous devriez taper des mails separés par ; comme indiqué au dessous du champ autres competences", {autoclose: 10000, position: "top-left", type: "st-error"});  
            }
            else
                {
                    
                        form.submit();
                    
                }
        },
        dataType: "text",
        async: false
    });
                
                //form.submit();
    }
        });
    },
    eighthstep6: function() {
        reg_validator = $('.form_fifthstep6').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
//                datePlanificationDiffusion: {required: true, checkdate: true},
//                dateDiffusion: {required: true, checkdate: true}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez de appel à compétences à resultat d'evaluation.", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    finalstep: function() {
        reg_validator = $('.form_administration').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
//                datePlanificationDiffusion: {required: true, checkdate: true},
//                dateDiffusion: {required: true, checkdate: true}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez de appel à compétences à resultat d'evaluation.", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    ninethstep: function() {
        reg_validator = $('.form_ninethstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
//                grilleAnalyse: {required: true, extension: "xls|csv|docx|doc|pdf"}
                presentation1: {required: true, extension: "xls|csv|docx|doc|pdf", uploadFile:true}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
            ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez de resultat d\'évaluation à Validation VGA.", {autoclose: 10000, position: "top-left", type: "st-error"});
       var autreevaluateurs=$("#autre").val();
       var context13=$("#context1").val();
    var got=false;
    var url = context13+"/LabelisationProjet/verificationautresevaluateurs";
            var data = {autreeva: autreevaluateurs};
            $.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: function(result) {
            if (result === "true") {
                got = true;
                $.sticky("vous devriez taper des mails separés par ; comme indiqué au dessous du champ", {autoclose: 10000, position: "top-left", type: "st-error"});  
            }
            else
                {
                    
                        form.submit();
                    
                }
        },
        dataType: "text",
        async: false
    });
    
            
              
            
            }
        });
    },
    tenthstep: function() {
        reg_validator = $('.form_tenthstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
       dateValidation: {required: true,greaterThan3: true},
        dateAuditionEtape6Bp: {required: true,greaterThan4: true},
                lieuAuditionEtape6Bp: {required: true},
               raisonRejetEtape6Bp: {required: true, minlength: 4}
             
             
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
             ,
            submitHandler: function(form, validator) {
      
//     var valini=$( "#datePreselectionEtape2Bp" ).val().substring(0, 10);
//      var test=$( "#dateValidation" ).val();
//      var ccvfv=test.substr(0,10);
//      var test1=$( "#dateAuditionEtape6Bp" ).val();
//      var ccvfv1=test1.substr(0,10);
//    var validation=false;
//    var validation1=false;
//                if( (new Date(valini).getTime() > new Date(ccvfv).getTime()) || (new Date(valini).getTime() === new Date(ccvfv).getTime()))
//        {
//        alert("la date de validation doit etre superieur a la date de preselection111");
//
//        }
//        else{
//       validation=true;
//        }
//        if( (new Date(ccvfv).getTime() > new Date(ccvfv1).getTime()) || (new Date(ccvfv).getTime() === new Date(ccvfv1).getTime()))
//    {
//        alert("la date de rendez-vous doit etre superieur a la date de validation");
//
//        }
//        else{
//validation1=true;
//        }
//      if(validation1===true && validation===true)
//          {
//              form.submit();
//          }
      
      form.submit();
      
    }
        });
    },
    eleventhstep: function() {
        reg_validator = $('.form_eleventhstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                avisSynthese: {required: true, minlength: 20},
                opinionComitePilotage: {required: true, minlength: 20},
                raisonNonConformiteEtape10: {required: true, minlength: 20},
                dateReunionComiteThematique: {required: true, checkdate: true}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
             ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez la elevenstep etape.", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    twelvethstep: function() {
        reg_validator = $('.form_twelvethstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                dateEnvoiDecisionPorteur: {required: true, checkdate: true},
                datePrevuAuditionComex: {required: true, checkdate: true}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
             ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez la twelvestep etape.", {autoclose: 10000, position: "top-left", type: "st-error"});
       form.submit();
    }
        });
    },
    thirteenthstep: function() {
        reg_validator = $('.form_thirteenthstep').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
            dateReeleffCommex: {required: true,greaterThan4: true}

//                decisionComex: {required: true, minlength: 20}
            },
            invalidHandler: function(form, validator) {
                $.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-left", type: "st-error"});
            }
             ,
            submitHandler: function(form, validator) {
      //$.sticky("vous avez passez de decision Commex à Post_label.", {autoclose: 10000, position: "top-left", type: "st-error"});
       
//       var test=$( "#dateValidation" ).val();
//      var ccvfv=test.substr(0,10);
//      var test1=$( "#dateReeleffCommex" ).val();
//      var ccvfv1=test1.substr(0,10);
//    var validation=false;
//                if( (new Date(ccvfv).getTime() > new Date(ccvfv1).getTime()) || (new Date(ccvfv).getTime() === new Date(ccvfv1).getTime()))
//    {
//        alert("la date de decision commex doit etre superieur a la date de validation");
//
//        }
//        else{
//       validation=true;
//        }
//       
//       if(validation===true)
//           {
//              form.submit(); 
//           }
//  


    form.submit();    
    
    
    
    }
        });
    },
    utilisateur: function() {
        reg_validator = $('.form_utilisateur').validate({
            onkeyup: false,
            errorClass: 'error',
            validClass: 'valid',
            ignore: ":hidden:not(select)",
            highlight: function(element) {
                $(element).closest('div').addClass("f_error");
            },
            unhighlight: function(element) {
                $(element).closest('div').removeClass("f_error");
            },
            errorPlacement: function(error, element) {
                $(element).closest('div').append(error);
            },
            rules: {
                login: {required: true, minlength: 2},
                nom: {required: true, minlength: 2},
                prenom: {required: true, minlength: 2},
                password: {required: true, minlength: 2},
                gsm: {required: true,number: true,minlength: 10},
                phoneId: {required: false, minlength: 14},
                profil: {selectcheck: true},
                societes: {required: true},
                email: {required: true, email: true}
            },
            messages: {
                login: {required: "Ce champ est obligatoire1"},
                nom: {required: "Ce champ est obligatoire2"},
                prenom: {required: "Ce champ est obligatoire3"},
                password: {required: "Ce champ est obligatoire4"},
                societes: {required: "Ce champ est obligatoire"},
                gsm: {required: "Ce champ est obligatoire",number: "veuillez entrer une valeur valide"},
                phoneId: {number: "veuillez entrer une valeur valide"},
                email: {required: "Ce champ est obligatoire", email: "veuillez entrer une adresse électronique valide111"}
            },
            invalidHandler: function(form, validator) {
                //$.sticky("Merci de corriger les messages d'erreur qui apparaissent dans le formulaire.", {autoclose: 5000, position: "top-right", type: "st-error"});
            }
        });
    }
};