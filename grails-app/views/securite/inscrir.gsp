<!DOCTYPE html>
<html lang="en" class="login_page">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MAROC NUMERIC CLUSTER - Inscription Page</title>

    <!-- Bootstrap framework -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css" />
    <!-- theme color-->
    <link rel="stylesheet" href="css/blue.css" />
    <!-- tooltip -->    
    <link rel="stylesheet" href="lib/qtip2/jquery.qtip.min.css" />
    <!-- main styles -->
    <link rel="stylesheet" href="css/style.css" />

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico" />

    <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>

    <!--[if lte IE 8]>
        <script src="js/ie/html5.js"></script>
        <script src="js/ie/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>

    <div class="login_box" style="margin-top: -181px;width: 50%;">
      <div class="top_b">veuillez accèder au Système de labélisation</div>                    
      <g:if test="${flash.message}">
        <div class="alert alert-error alert-login">
${flash.message}
        </div>
      </g:if>
      <g:else>
        <div class="alert alert-info alert-login">
          veuillez remplir tout les champs.
        </div>
      </g:else>
      </br>
      <g:form class="form-horizontal" url="[resource:utilisateurInstance,contactoller:'inscription',action:'inscrir']" id="login_form">
        <g:hiddenField name="version" value="${utilisateurInstance?.version}" />
        <fieldset>
          <div class="control-group formSep">
            <label class="control-label">Login :</label>
            <div class="controls text_line">
              <input type="text" id="login" name="login" class="input-xlarge" value="${utilisateurInstance?.login}" />
            </div>
          </div>
          <div class="control-group formSep">
            <label for="u_fname" class="control-label">Nom :</label>
            <div class="controls">
              <input type="text" id="nom" name="nom" class="input-xlarge" value="${utilisateurInstance?.nom}" />
            </div>
          </div>
          <div class="control-group formSep">
            <label for="u_fprenom" class="control-label">Prénom :</label>
            <div class="controls">
              <input type="text" id="prenom" name="prenom" class="input-xlarge" value="${utilisateurInstance?.prenom}" />
            </div>
          </div>
          <div class="control-group formSep">
            <label for="u_fgsm" class="control-label">GSM :<span class="f_req">*</span></label>
            <div class="controls">
              <input type="text" id="gsm" name="gsm" class="input-xlarge" value="${utilisateurInstance?.gsm}" />
            </div>
          </div>
          <div class="control-group formSep">
            <label for="u_email" class="control-label">Email :</label>
            <div class="controls">
              <input type="text" id="email" name="email" class="input-xlarge" value="${utilisateurInstance?.email}" />
            </div>
          </div>
          <div class="control-group formSep">
            <label for="u_password" class="control-label">Mot de passe :</label>
            <div class="controls">
              <div class="sepH_b">
                <input type="password" id="password" name="password" class="input-xlarge" value="${utilisateurInstance?.password}" />
              </div>
            </div>
          </div>                                                                                       
          <div class="control-group formSep">
            <label for="u_password" class="control-label">Re-tapez votre mot de passe :</label>
            <div class="controls">
              <div class="sepH_b">
                <input type="password" id="s_password_re" name="s_password_re" class="input-xlarge" />
              </div>
            </div>
          </div>                                                                                       
          <div class="control-group">
            <div class="controls">
              <button class="btn btn-gebo" type="submit">Enregistrer</button>
            </div>
          </div>
        </fieldset>
      </g:form>
    </div>

    <script src="js/jquery.min.js"></script>
    <script src="js/jquery-migrate.min.js"></script>
    <script src="js/jquery.actual.min.js"></script>
    <script src="lib/validation/jquery.validate.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script>
            $(document).ready(function(){
                
                //* boxes animation
                form_wrapper = $('.login_box');
                function boxHeight() {
                    form_wrapper.animate({ marginTop : ( - ( form_wrapper.height() / 2) - 24) },400);   
                };
                form_wrapper.css({ marginTop : ( - ( form_wrapper.height() / 2) - 24) });
                $('.linkform a,.link_reg a').on('click',function(e){
                    var target  = $(this).attr('href'),
                        target_height = $(target).actual('height');
                    $(form_wrapper).css({
                        'height'        : form_wrapper.height()
                    }); 
                    $(form_wrapper.find('form:visible')).fadeOut(400,function(){
                        form_wrapper.stop().animate({
                            height   : target_height,
                            marginTop: ( - (target_height/2) - 24)
                        },500,function(){
                            $(target).fadeIn(400);
                            $('.links_btm .linkform').toggle();
                            $(form_wrapper).css({
                                'height'        : ''
                            }); 
                        });
                    });
                    e.preventDefault();
                });
                
                //* validation
                $('#login_form').validate({
                    onkeyup: false,
                    errorClass: 'error',
                    validClass: 'valid',
                    rules: {
                        login: { required: true, minlength: 3 },
                        nom: { required: true, minlength: 3 },
                        prenom: { required: true, minlength: 3 },
                        gsm: { required: true, minlength: 3 },
                        email: { required: true, email: true },
                        password: {required: true},
                        s_password_re: {equalTo: "#password"}
                    },
                    messages: {
                        login: {required: "Ce champ est obligatoire"},
                        nom: {required: "Ce champ est obligatoire"},
                        prenom: {required: "Ce champ est obligatoire"},
                        password: {required: "Entrez votre mot de passe"},
                        s_password_re: {equalTo: "Re-tapez le méme mot de passe"},
                        gsm: {required: "Ce champ est obligatoire"},
                        email: {required: "Ce champ est obligatoire", email: "veuillez entrer une adresse électronique valide"}
                    },
                    highlight: function(element) {
                        $(element).closest('div').addClass("f_error");
                        setTimeout(function() {
                            boxHeight()
                        }, 200)
                    },
                    unhighlight: function(element) {
                        $(element).closest('div').removeClass("f_error");
                        setTimeout(function() {
boxHeight()
}, 200)
},
errorPlacement: function(error, element) {
$(element).closest('div').append(error);
}
});
});
</script>
</body>
</html>