<%@ page import="com.rabbahsoft.securite.Profil" %>
<fieldset>
  <div class="span12 formSep center">
    <div class="span2"><label><g:message code="profil.code.label" default="Code :" /></label></div>
    <div class="span3"><g:textField name="code" required="" value="${profilInstance?.code}"/></div>
    <div class="span1"></div>
    <div class="span2"><label><g:message code="profil.description.label" default="Description :" /></label></div>
    <div class="span3"><g:textField class="span3" name="description" value="${profilInstance?.description}"/></div>
  </div>
</fieldset>
<div class="span12 formSep center">
  <div class="w-box" id="w_sort07">
    <div class="w-box-header">
      Modules
    </div>
    <div class="w-box-content">
      <div class="tabbable clearfix">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab1" data-toggle="tab">Module utilisateur</a></li>
          <li class=""><a href="#tab2" data-toggle="tab">Module profil</a></li>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab1"> 
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('AJOUTER_UTILISATEUR')}" <g:if test="${droits!=null && droits['AJOUTER_UTILISATEUR']!=null}">checked</g:if>/>
              Ajouter un utilisateur
            </label>
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('MODIFIER_UTILISATEUR')}" <g:if test="${droits!=null && droits['MODIFIER_UTILISATEUR']!=null}">checked</g:if>/>
              Modifier un utilisateur
            </label>
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('SUPPRIMER_UTILISATEUR')}" <g:if test="${droits!=null && droits['SUPPRIMER_UTILISATEUR']!=null}">checked</g:if>/>
              Supprimer un utilisateur
            </label>
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('VISUALISER_UTILISATEUR')}" <g:if test="${droits!=null && droits['VISUALISER_UTILISATEUR']!=null}">checked</g:if>/>
              Visualiser un utilisateur
            </label>
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('LISTE_UTILISATEUR')}" <g:if test="${droits!=null && droits['LISTE_UTILISATEUR']!=null}">checked</g:if>/>
              Liste des utilisateurs
            </label>
          </div>
          <div class="tab-pane" id="tab2">
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('AJOUTER_PROFIL')}" <g:if test="${droits!=null && droits['AJOUTER_PROFIL']!=null}">checked</g:if>/>
              Ajouter un profil
            </label>
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('MODIFIER_PROFIL')}" <g:if test="${droits!=null && droits['MODIFIER_PROFIL']!=null}">checked</g:if>/>
              Modifier un profil
            </label>
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('SUPPRIMER_PROFIL')}" <g:if test="${droits!=null && droits['SUPPRIMER_PROFIL']!=null}">checked</g:if>/>
              Supprimer un profil
            </label>
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('VISUALISER_PROFIL')}" <g:if test="${droits!=null && droits['VISUALISER_PROFIL']!=null}">checked</g:if>/>
              Visualiser un profil
            </label>
            <label class="checkbox span4">
              <input type="checkBox"  name="enabled" id="enabled" value="${com.rabbahsoft.securite.Droit.findByCode('LISTE_PROFIL')}" <g:if test="${droits!=null && droits['LISTE_PROFIL']!=null}">checked</g:if>/>
              Liste des profils
            </label>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>