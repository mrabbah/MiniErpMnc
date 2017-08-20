<%@ page import="com.rabbahsoft.securite.Utilisateur" %>

<div class="span12 formSep center">
  <div class="span2"><label>Login :<span class="f_req">*</span></label></div>
  <div class="span3"><input type="text" id="login" name="login" class="span3" value="${utilisateurInstance?.login}" /></div>
  <div class="span1"></div>
  <div class="span2"><label>Mot de passe :<span class="f_req">*</span></label></div>
  <div class="span3"><input type="password" id="password" name="password" class="span3" value="${utilisateurInstance?.password}" /></div>
</div>

<div class="span12 formSep">
  <div class="span2"><label for="u_fprenom" class="control-label">Prénom :<span class="f_req">*</span></label></div>
  <div class="span3"><input type="text" id="prenom" name="prenom" class="span3" value="${utilisateurInstance?.prenom}" /></div>
  <div class="span1"></div>
  <div class="span2"><label for="u_fgsm" class="control-label">GSM :<span class="f_req">*</span></label></div>
  <div class="span3"><input type="text" id="gsm" name="gsm" class="span3" value="${utilisateurInstance?.gsm}" /></div>
</div>

<div class="span12 formSep">
  <div class="span2"><label for="u_fname" class="control-label">Nom :<span class="f_req">*</span></label></div>
  <div class="span3"><input type="text" id="nom" name="nom" class="span3" value="${utilisateurInstance?.nom}" /></div>
  <div class="span1"></div>
  <div class="span2"><label for="u_email" class="control-label">Email :<span class="f_req">*</span></label></div>
  <div class="span3"><input type="text" id="email" name="email" class="span3" value="${utilisateurInstance?.email}" /></div>
</div>
<g:if test="${session.profil!='porteur'}">
<div class="span12 formSep">
  <div id="profil">
  <div class="span2"><label class="control-label">Profil :<span class="f_req">*</span></label></div>
  <div class="span3"><g:select data-placeholder="Sélectionner un profil..." id="profil" name="profil" from="${com.rabbahsoft.securite.Profil.list()}" optionKey="id" value="${utilisateurInstance?.profil?.id}" noSelection="['sélectionner': '']" style="width: 107%;"/></div>  
  </div>
  <div class="span1"></div>
  <div id="committe">
  <div class="span2"><label class="control-label">Comités thématique :</label></div>
  <div class="span3"><g:select id="comitesThematiques" name="comitesThematiques" from="${com.rabbahsoft.securite.ComiteThematique.list()}" multiple='multiple' optionKey="id" value="${utilisateurInstance?.comitesThematiques*.id}" multiple="multiple" data-placeholder="Ajoutez des comités thématiques..." class="chzn_b span12"/></div>  
  </div>
  </div>
</g:if>
<!--<div class="span12 formSep">
  <div class="span2"><label class="control-label">Bureau permanent :</label></div>
  <div id="normal-toggle-button"><div class="span3"><g:checkBox name="bp" id="bp" value="${utilisateurInstance?.bp}" /></div></div>
  <div class="span1"></div>
  <div class="span2"><label class="control-label">Consiel d'administration :</label></div>
  <div class="span3"><g:checkBox name="ca" id="ca" value="${utilisateurInstance?.ca}" /></div>
</div>

<div class="span12 formSep">
  <div class="span2"><label class="control-label">Comex :</label></div>
  <div id="normal-toggle-button"><div class="span3"><g:checkBox name="comex" id="comex" value="${utilisateurInstance?.comex}" /></div></div>
  <div class="span1"></div>
  <div class="span2"><label class="control-label">Compte activé :</label></div>
  <div id="normal-toggle-button"><div class="span3"><g:checkBox name="active" id="active" value="${utilisateurInstance?.active}" /></div></div>
</div>-->



