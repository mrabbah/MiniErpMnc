<%@ page import="com.rabbahsoft.securite.Utilisateur" %>
<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<!DOCTYPE html>
<html lang="en" class="login_page">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!--     <g:javascript src="jquery.js" />
<g:javascript src="jquery.min.js" />
    <g:javascript src="validercandidat.js" />-->

    <title>MAROC NUMERIC CLUSTER - Inscription Page</title>

    <!-- Bootstrap framework -->
    <link rel="stylesheet" href="${request.contextPath}/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${request.contextPath}/bootstrap/css/bootstrap-responsive.min.css" />
    <!-- theme color-->
    <link rel="stylesheet" href="${request.contextPath}/css/blue.css" />
    <!-- tooltip -->    
    <link rel="stylesheet" href="${request.contextPath}/lib/qtip2/jquery.qtip.min.css" />
    <!-- main styles -->
    <link rel="stylesheet" href="${request.contextPath}/css/style.css" />

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico" />

    <link href='http://fonts.googleapis.com/css?family=PT+Sans' rel='stylesheet' type='text/css'>

    <!--[if lte IE 8]>
        <script src="js/ie/html5.js"></script>
        <script src="js/ie/respond.min.js"></script>
    <![endif]-->

  </head>
  <body>

    <div class="login_box" style="margin-top: -270px;width: 40%;">
      <div class="top_b">Veuillez accèder au Système de Labellisation</div> 
      
      
      <g:if test="${flash.message}">
        <br/>
        <div class="message" role="status">
        <g:message code="${flash.message}" args="${flash.args}" default="${flash.default}"/>
        </div>
        <br/>
        </g:if>
      
       <div id="messageerreur"></div>
      
        <g:hasErrors bean="${labelisationProjetInstance}">
            <div class="alert alert-danger">
                <g:renderErrors bean="${labelisationProjetInstance}" as="list" />
            </div>
        </g:hasErrors>

      </br>
      <g:if test="${params.state==null && params.state!="true"}">
        <g:form  controller="inscription" action="inscrir" class="form-horizontal" role="form"  >

        <g:hiddenField name="version" value="${utilisateurInstance?.version}" />
        <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
        <fieldset>
          <div class="control-group formSep">
            <label class="control-label">Login :<span class="f_req">*</span></label>
            <div class="controls text_line">
              <input type="text" id="login" name="login" class="input-xlarge" value="${utilisateurInstance?.login}" />
            </div>
          </div>
          <div class="control-group formSep">
            <label for="u_fname" class="control-label">Nom :<span class="f_req">*</span></label>
            <div class="controls">
              <input type="text" id="nom" name="nom" class="input-xlarge" value="${utilisateurInstance?.nom}" />
            </div>
          </div>
          <div class="control-group formSep">
            <label for="u_fprenom" class="control-label">Prénom :<span class="f_req">*</span></label>
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
            <label for="u_email" class="control-label">Email :<span class="f_req">*</span></label>
            <div class="controls">
              <input type="text" id="email" name="email" class="input-xlarge" value="${utilisateurInstance?.email}"  autocomplete="off"/>
            </div>
          </div>
          <div class="control-group formSep">
            <label for="u_password" class="control-label">Mot de passe :<span class="f_req">*</span></label>
            <div class="controls">
              <div class="sepH_b">
                <input type="password" id="password" name="password" class="input-xlarge" value="${utilisateurInstance?.password}" autocomplete="off"/>
              </div>
            </div>
          </div>                                                                                       
                                                                                    
          <div class="control-group">
            <div class="controls">
             <g:submitButton name="create" class="btn btn-gebo"  value="Enregistrer" onClick="validercandidat();return false;"/>       
          </div>
        </fieldset>
          </g:form>
      </g:if>
    </div>
<script src="${request.contextPath}/js/jquery.js"></script>
<script src="${request.contextPath}/js/validercandidat.js"></script>
</body>
</html>