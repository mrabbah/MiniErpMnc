/* [ ---- Gebo Admin Panel - location finder ---- ] */

$(document).ready(function() {
    var context11=$("#context1").val()+"/Document/uploadfiles";
    initupload(context11);
    //zoning();
});


function initupload(context11) {
    $("#fileuploader").uploadFile({
        url: "/MiniErpMnc/LabelisationProjet/uploadfile",
        fileName: "presentationetape5",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var idprojet = $("#idprojet").val();
            var data = {idprojet: idprojet};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
        }
    });
    $("#fichetechnique").uploadFile({
        url: "/MiniErpMnc/Document/uploadfiles",
        fileName: "ficheTechnique",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var type = "ficheTechnique";
            var data = {type: type};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
        }
    });
    $("#grilleAnalyse").uploadFile({
//        url: "/MiniErpMnc/Document/uploadfiles",
url: context11,
        fileName: "grilleAnalyse",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var type = "grilleAnalyse";
            var data = {type: type};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
//            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
//            location.reload();
if(data==="false")
                {
                  $.sticky("La taille du fichier depasse 1 Mo .", {autoclose: 60000, position: "top-center", type: "st-error"});
            location.reload();    
            }
                else
                    {
                       $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
                    }

        }
    });
     $("#lettreConfidentialite").uploadFile({
//        url: "/MiniErpMnc/Document/uploadfiles",
url: context11,
        fileName: "lettreConfidentialite",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var type = "lettreConfidentialite";
            var data = {type: type};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
//            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
//            location.reload();
if(data==="false")
                {
                  $.sticky("La taille du fichier depasse 1 Mo .", {autoclose: 60000, position: "top-center", type: "st-error"});
            location.reload();    
            }
                else
                    { 
                       $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
                    }
        }
    });
    $("#ficheTechiqueLabelisationProjet").uploadFile({
        url: "/MiniErpMnc/LabelisationProjet/uploadfile",
        fileName: "ficheTechnique",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var idprojet = $("#idprojet").val();
            var data = {idprojet: idprojet};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
        }
    });
    $("#grilleAnalyse1").uploadFile({
        url: "/MiniErpMnc/LabelisationProjet/uploadfile",
        fileName: "grilleAnalyse1",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var idprojet = $("#idprojet").val();
            var data = {idprojet: idprojet};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
        }
    });
    $("#fichesignaletique").uploadFile({
//        url: "/MiniErpMnc/Document/uploadfiles",
        url: context11,
        fileName: "fichesignaletique",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var type = "fichesignaletique";
            var data = {type: type};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
            if(data==="false")
                {
                  $.sticky("La taille du fichier depasse 1 Mo .", {autoclose: 60000, position: "top-center", type: "st-error"});
            location.reload();    
            }
                else
                    {
                       $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
                    }
           
        }
//        ,
//        onError: function(files, data, xhr, pd)
//        {
//           $.sticky("La taille du fichier depasse 1Mo.", {autoclose: 5000, position: "top-center", type: "st-error"});
//           
//        }        
        
    });
    $("#dossierlabellisation").uploadFile({
//        url: "/MiniErpMnc/Document/uploadfiles",
url: context11,
        fileName: "dossierlabellisation",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var type = "dossierlabellisation";
            var data = {type: type};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
//            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
//            location.reload();
if(data==="false")
                {
                  $.sticky("La taille du fichier depasse 1 Mo .", {autoclose: 60000, position: "top-center", type: "st-error"});
            location.reload();    
            }
                else
                    {
                       $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
                    }
        }
    });
       $("#business_model_canevas").uploadFile({
//        url: "/MiniErpMnc/Document/uploadfiles",
url: context11,
        fileName: "business_model_canevas",
        dragDropStr: "Déposez votre fichier dans le cadre",
        doneStr: "Effectué",
        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
                dynamicFormData: function()
        {
            var type = "business_model_canevas";
            var data = {type: type};
            return data;
        },
        onSuccess: function(files, data, xhr, pd)
        {
//            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
//            location.reload();
if(data==="false")
                {
                  $.sticky("La taille du fichier depasse 1 Mo .", {autoclose: 60000, position: "top-center", type: "st-error"});
            location.reload();    
            }
                else
                    {
                       $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
            location.reload();
                    }
        }
    });
//    $("#dossierfinnacement").uploadFile({
//        url: "/MiniErpMnc/LabelisationProjet/uploadfile",
//        fileName: "dossierfinnacement",
//        dragDropStr: "Déposez votre fichier dans le cadre",
//        doneStr: "Effectué",
//        dragDropStr: "<span><b>Faites glisser et déposez les fichiers</b></span>",
//                dynamicFormData: function()
//        {
//            var idprojet = $("#idprojet").val();
//            var data = {idprojet: idprojet,etape:'dossierfinacement'};
//            return data;
//        },
//        onSuccess: function(files, data, xhr, pd)
//        {
//            $.sticky("Le fichier a été uploadé.", {autoclose: 5000, position: "top-center", type: "st-error"});
//            location.reload();
//        }
//    });
}
;

    