function validercandidat() {
     var t = chechfields();
    if (t.length > 0) {
        var lang = '';
        lang += '<div class="alert alert-danger">';
        lang += '<a class="close" data-dismiss="alert">Fermer</a>';
        lang += '<ul>';
        for (var i = 0; i < t.length; i = i + 1) {
            lang += '<li>' + t[i] + '</li>';
        }
        lang += '</ul>';
        lang += '</div>';
        $('#messageerreur').html(lang);
        $("html, body").animate({scrollTop: 0}, 1000);
    }
    else {
        document.candidat.submit();
    }
}

function chechfields() {
    $("#messageerreur").empty();
   
    var messageerreur = [];
    if ($("#nom").val() === "") {
        messageerreur.push('Veuillez remplir le champ Nom ');
    }
    if ($("#prenom").val() === "") {
        messageerreur.push('Veuillez remplir le champ Pr&eacute;nom ');
    }
    if ($("#login").val() === "") {
        messageerreur.push('Veuillez remplir le champ login');
    }
    
    if ( $("#login").val().length > 2) {
       var l=1;
    }
    else
        {
            messageerreur.push('Veuillez remplir le champ login avec au min 3 caractéres'); 
        }
    
    if ($("#password").val() === "") {
        messageerreur.push('Veuillez remplir le champ password');
    }
  
    if ($("#gsm").val() === "") {
        messageerreur.push('Veuillez remplir le champ T&eacute;l&eacute;phone gsm');
    }
    else if (!$("#gsm").val().match(/^([0-9\(\)\/\+ \-]*)$/i)) {
        messageerreur.push('Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone valide ');
    }
//    else if(8 > $("#gsm").val().length)
    else if( 10 > $("#gsm").val().length)
    { 
     messageerreur.push('Veuillez entrer un Num&eacute;ro de t&eacute;l&eacute;phone superieur à 10 ');   
    }
    
        

    var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
    if ($("#email").val() === "") {
        messageerreur.push('Veuillez remplir le champ Adresse mail ');
    }
    else if (!pattern.test($("#email").val())) {
        messageerreur.push("Veuillez entrer un Email valide ");
    }
//    var email = $("#email").val();
//    checkemail(email, messageerreur);  
return messageerreur;
}


function checkemail(email, messageerreur) {
    var context2=$("#context1").val();
    var url = context2+"/inscription/checkemail11";
    console.log('appel de lien : ' + url);
    $.ajax({
        type: "POST",
        url: url,
        data: {email : email},
        datatype: 'html',
           success: function(data) { alert('got here with data'); },
      error: function() { alert('something bad happened'); }
    });
    
}