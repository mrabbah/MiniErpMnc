<%@ page import="com.rabbahsoft.mnc.Formation" %>
<g:form url="[resource:formationInstance]" class="form-horizontal form_firststep" novalidate="novalidate">
  <g:hiddenField name="id" value="${formationInstance?.id}" />
  <g:hiddenField name="version" value="${formationInstance?.version}" />
  <fieldset>
    <div class="v-heading">Fiche technique</div>
    <div class="row-fluid">

      <div class="control-group">
        <div class="span2">
          <label for="acronymeFormation" class="control-label"><g:message code="formation.acronymeFormation.label" default="Acronyme Formation" /></label>
        </div>
        <div class="span4">
          <g:textField class="form-control" name="acronymeFormation" value="${formationInstance?.acronymeFormation}"/>			
        </div>
        <div class="span2">
          <label for="nomformation" class="control-label"><g:message code="formation.nomformation.label" default="Nomformation" /></label>
        </div>
        <div class="span4">
          <g:textField class="form-control" name="nomformation" value="${formationInstance?.nomformation}"/>
        </div>
      </div>

    <div class="control-group">
      <div class="span2">
        <label for="dateCreationFormation" class="control-label"><g:message code="formation.dateCreationFormation.label" default="Date Creation Formation" /></label>
      </div>
      <div class="span4">
        <g:textField name="dateCreationFormation" class="date" precision="day"  value="${formationInstance?.dateCreationFormation}" default="none" noSelection="['': '']" />
      </div>	
      <div class="span2">
        <label for="etablissementFormation" class="control-label"><g:message code="formation.etablissementFormation.label" default="Etablissement Formation" /></label>
      </div>
      <div class="span4">
        <g:textField class="form-control" name="etablissementFormation" value="${formationInstance?.etablissementFormation}"/>
      </div>
    </div>





    <div class="control-group">
      <div class="span2">
        <label for="statutAdhesion" class="control-label"><g:message code="formation.statutAdhesion.label" default="Statut Adhesion" /></label>
      </div>
      <div class="span4">
        <g:select class="form-control" name="statutAdhesion" from="${formationInstance.constraints.statutAdhesion.inList}" value="${formationInstance?.statutAdhesion}" valueMessagePrefix="formation.statutAdhesion" noSelection="['': '']"/>
      </div>
      <div class="span2">
        <label for="accredidationEtat" class="control-label"><g:message code="formation.accredidationEtat.label" default="Accredidation Etat" /></label>
      </div>  
      <div class="span4">
        <g:select class="form-control" name="accredidationEtat" from="${formationInstance.constraints.accredidationEtat.inList}" value="${formationInstance?.accredidationEtat}" valueMessagePrefix="formation.accredidationEtat" noSelection="['': '']"/>
      </div>
    </div>

    <div class="control-group">
      <div class="span2">
        <label for="entite" class="control-label"><g:message code="formation.entite.label" default="Entite" /></label>
      </div>
      <div class="span4">
        <g:textField class="form-control" name="entite" value="${formationInstance?.entite}"/>
      </div>
      <div class="span2">
        <label for="nomContact" class="control-label"><g:message code="formation.nomContact.label" default="Nom Contact" /></label>
      </div>
      <div class="span4">
        <g:textField class="form-control" name="nomContact" value="${formationInstance?.nomContact}"/>
      </div>
    </div>

    <div class="control-group">
      <div class="span2">
        <label for="telephone" class="control-label"><g:message code="formation.telephone.label" default="Telephone" /></label>
      </div>
      <div class="span4">
        <g:textField class="form-control" name="telephone" value="${formationInstance?.telephone}"/>
      </div>
      <div class="span2">
        <label for="email" class="control-label"><g:message code="formation.email.label" default="Email" /></label>
      </div>
      <div class="span4">   
        <g:textField class="form-control" name="email" value="${formationInstance?.email}"/>
      </div>
    </div>

    <div class="control-group">
      <div class="span2">
        <label for="descriptionFormation" class="control-label"><g:message code="formation.descriptionFormation.label" default="Description Formation" /></label>
      </div>
      <div class="span4">
        <g:textArea class="form-control" name="descriptionFormation" cols="40" rows="5" maxlength="65535" value="${formationInstance?.descriptionFormation}"/>
      </div>
      <div class="span2">
        <label for="diplome" class="control-label"><g:message code="formation.diplome.label" default="Diplome" /></label>
      </div>
      <div class="span4">
        <g:textArea class="form-control" name="diplome" cols="40" rows="5" maxlength="65535" value="${formationInstance?.diplome}"/>
      </div>
    </div>


    <div class="control-group">
      <div class="span2">
        <label for="etatArt" class="control-label"><g:message code="formation.etatArt.label" default="Etat Art" /></label>
      </div>
      <div class="span4">
        <g:textArea class="form-control" name="etatArt" cols="40" rows="5" maxlength="65535" value="${formationInstance?.etatArt}"/>
      </div>
      <div class="span2">
        <label for="programmeFormation" class="control-label"><g:message code="formation.programmeFormation.label" default="Programme Formation" /></label>
      </div>
      <div class="span4">
        <g:textArea class="form-control" name="programmeFormation" cols="40" rows="5" maxlength="65535" value="${formationInstance?.programmeFormation}"/>
      </div>
    </div>

    <div class="control-group">
      <div class="span2">
        <label for="stages" class="control-label"><g:message code="formation.stages.label" default="Stages" /></label>
      </div>
      <div class="span4">
        <g:textArea class="form-control" name="stages" cols="40" rows="5" maxlength="65535" value="${formationInstance?.stages}"/>
      </div>
      <div class="span2">
        <label for="reseaux" class="control-label"><g:message code="formation.reseaux.label" default="Reseaux" /></label>
      </div>
      <div class="span4">
        <g:textArea class="form-control" name="reseaux" cols="40" rows="5" maxlength="65535" value="${formationInstance?.reseaux}"/>
      </div>
    </div>

    <div class="control-group">
      <div class="span2">
        <label for="interactionFormationEntreprise" class="control-label"><g:message code="formation.interactionFormationEntreprise.label" default="Interaction Formation Entreprise" /></label>
      </div>
      <div class="span4">
        <g:textArea class="form-control" name="interactionFormationEntreprise" cols="40" rows="5" maxlength="65535" value="${formationInstance?.interactionFormationEntreprise}"/>
      </div>
      <div class="span2">
        <label for="interactionActiviteEntreprise" class="control-label"><g:message code="formation.interactionActiviteEntreprise.label" default="Interaction Activite Entreprise" /></label>
      </div>
      <div class="span4">
        <g:textArea class="form-control" name="interactionActiviteEntreprise" cols="40" rows="5" maxlength="65535" value="${formationInstance?.interactionActiviteEntreprise}"/>
      </div>
    </div>
     <div class="form-actions">
        <g:actionSubmit action="saveEtape1" class="btn btn-danger" value="Enregistrer" />
      </div>
    </div>
  </fieldset>
</g:form>


