<%@ page import="com.rabbahsoft.securite.Utilisateur" %>

<div class="span12 formSep center">
  <div class="span2"><label>Login :</label></div>
  <div class="span3"><input type="text" id="login" name="login" class="span3" value="${utilisateurInstance?.login}" disabled/></div>
  <div class="span1"></div>
  <div class="span2"><label>Mot de passe :</label></div>
  <div class="span3"><input type="password" id="password" name="password" class="span3" value="${utilisateurInstance?.password}" disabled/></div>
</div>

<div class="span12 formSep">
  <div class="span2"><label for="u_fprenom" class="control-label">Prénom :</label></div>
  <div class="span3"><input type="text" id="prenom" name="prenom" class="span3" value="${utilisateurInstance?.prenom}" disabled/></div>
  <div class="span1"></div>
  <div class="span2"><label for="u_fgsm" class="control-label">GSM :</label></div>
  <div class="span3"><input type="text" id="gsm" name="gsm" class="span3" value="${utilisateurInstance?.gsm}" disabled/></div>
</div>

<div class="span12 formSep">
  <div class="span2"><label for="u_fname" class="control-label">Nom :</label></div>
  <div class="span3"><input type="text" id="nom" name="nom" class="span3" value="${utilisateurInstance?.nom}" disabled/></div>
  <div class="span1"></div>
  <div class="span2"><label for="u_email" class="control-label">Email :</label></div>
  <div class="span3"><input type="text" id="email" name="email" class="span3" value="${utilisateurInstance?.email}" disabled/></div>
</div>

<div class="span12 formSep">
<!--  <div id="profil">
  <div class="span2"><label class="control-label">Profil :</label></div>
  <div class="span3">${utilisateurInstance?.profil?.encodeAsHTML()}</div>  
  </div>-->
  </div>




