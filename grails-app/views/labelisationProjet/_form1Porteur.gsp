<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_firststep" novalidate="novalidate" >
  <g:hiddenField name="id" id="idprojet" value="${labelisationProjetInstance?.id}" />
  <g:hiddenField name="version" value="${labelisationProjetInstance?.version}" />
  <fieldset>
    <div class="v-heading" style="background-color:#4c9689">Infos Projet</div>
    <div class="row-fluid">
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.interlocuteur.label" default="Interlocuteur :" /><span style="color:red">* :</span></label>
          <g:hiddenField name="idprojet" id="idprojet" value="${labelisationProjetInstance.id}" />
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="interlocuteur" id="interlocuteur"  value="${labelisationProjetInstance?.interlocuteur}" autocomplete="off"/>
          <g:hiddenField name="city" id="city" value="" />
          <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
        
           </g:if>
      <g:else>
        <input type="text" class="span10" name="interlocuteur" id="interlocuteur"  readonly value="${labelisationProjetInstance?.interlocuteur}" autocomplete="off"/>
        </g:else>
        </div>
        <div class="span2">
          <label><g:message code="labelisationProjet.fonction.label" default="Fonction :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="fonction" id="fonction" value="${labelisationProjetInstance?.fonction}" autocomplete="off">
        </g:if>
      <g:else>
        <input type="text" class="span10" name="fonction" readonly id="fonction" value="${labelisationProjetInstance?.fonction}" autocomplete="off">
        </g:else>
          </div>
      </div>


      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.nomProjet.label" default="Nom du projet :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="nomProjet" id="nomProjet"  value="${labelisationProjetInstance?.nomProjet}" autocomplete="off"> 
        </g:if>
      <g:else>
        <input type="text" class="span10" name="nomProjet" readonly id="nomProjet"  value="${labelisationProjetInstance?.nomProjet}" autocomplete="off"> 
        </g:else>
          </div>
        <div class="span2">
          <label><g:message code="labelisationProjet.nomCompletProjet.label" default="Nom complet du projet :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="nomCompletProjet" id="nomCompletProjet" value="${labelisationProjetInstance?.nomCompletProjet}" autocomplete="off">
       </g:if>
      <g:else>
         <input type="text" class="span10" name="nomCompletProjet" readonly id="nomCompletProjet" value="${labelisationProjetInstance?.nomCompletProjet}" autocomplete="off">
         </g:else>
          </div>
      </div>
      
<!--<div class="control-group span12">
  <div class="span2">
          <label><g:message code="labelisationProjet.website.label" default="Site web :" /></label>
        </div>
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.website.label" default="Adresse web/Url :" /></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="website" id="website" value="${labelisationProjetInstance?.website}" autocomplete="off">
        </g:if>
      <g:else>
         <input type="text" class="span10" name="website" readonly id="website" value="${labelisationProjetInstance?.website}" autocomplete="off">
         </g:else>
          </div>
      </div>
</div>-->
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.budget.label" default="Budget  :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="budget" id="budget" value="${labelisationProjetInstance.budget}" autocomplete="off">DH
           </g:if>
      <g:else>
        <input type="text"  class="span10" readonly name="budget" id="budget" value="${labelisationProjetInstance.budget}" autocomplete="off">DH
        </g:else>
<!--          <g:hiddenField id="budget1" name="budget1" value=""  />-->
        </div>
        <div class="span2">
          <label><g:message code="labelisationProjet.duree.label" default="Durée en nombre de mois :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="duree" id="duree" value="${labelisationProjetInstance.duree}" autocomplete="off">
         </g:if>
      <g:else>
        <input type="text" class="span10" name="duree" readonly id="duree" value="${labelisationProjetInstance.duree}" autocomplete="off">
         </g:else> 
        </div>
      </div>
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.dateDebut.label" default="Date de début du projet :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <!--<input type="text" class="span10 date" >-->
          
<!--            <input class="span12" type="text" id="dateDebut" name="dateDebut" value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateDebut)}" readonly="readonly"><span class="add-on"><i class="splashy-calendar_day_up"></i></span>-->
            <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
              <div class="input-append date span9" id="dp_start" data-date-format="dd/mm/yyyy">
            <input type="text" id="dateDebut" name="dateDebut" value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateDebut)}" placeholder="dd/mm/yyyy"/>
          </g:if>
      <g:else>
        <div class="input-append  span9" id="dp_start" >
        <input type="text" id="dateDebut" readonly name="dateDebut" value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateDebut)}" disabled/>
        </g:else> 
          </div>
        </div>
        <div class="span2">
          <label><g:message code="labelisationProjet.dateFin.label" default="Date de fin du projet :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <!--<input type="text" class="span10 date" id="dateFin" name="dateFin" value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateFin)}">-->
          
<!--            <input class="span12" type="text" id="dateFin" name="dateFin" value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateFin)}" readonly="readonly"><span class="add-on"><i class="splashy-calendar_day_down"></i></span>-->
            <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
              <div class="input-append date span9" id="dp_end" data-date-format="dd/mm/yyyy">
            <input type="text" id="dateFin" name="dateFin" value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateFin)}" placeholder="dd/mm/yyyy" disabled/>
           </g:if>
      <g:else>
        <div class="input-append span9" id="dp_end" >
        <input type="text" id="dateFin" name="dateFin" readonly value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateFin)}" disabled/>
        </g:else>
          </div>
        </div>
      </div>
      
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.resumeFrancais.label" default="Résumé en français :" /><span style="color:red">* :</span></label>
        </div>
        <div class="span10">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <textarea cols="1" rows="6" id="resumeFrancais" name="resumeFrancais" class="span12" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.resumeFrancais}</textarea>
        </g:if>
      <g:else>
        <textarea cols="1" rows="6" id="resumeFrancais" readonly name="resumeFrancais" class="span12" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.resumeFrancais}</textarea>
        </g:else>
        </div>
      </div>

      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.resumeAnglais.label" default="Résumé en anglais :" /></label>
        </div>
        <div class="span10">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <textarea cols="1" rows="6" class="span12" id="resumeAnglais" name="resumeAnglais" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.resumeAnglais}</textarea>
        </g:if>
      <g:else>
       <textarea cols="1" rows="6" class="span12" id="resumeAnglais" readonly name="resumeAnglais" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.resumeAnglais}</textarea>
       </g:else>
        
        </div>
      </div>

      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.lienAap.label" default="Lien avec d’autres projets " /></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="lienAap" id="lienAap" value="${labelisationProjetInstance?.lienAap}" autocomplete="off">
        </g:if>
      <g:else>
        <input type="text" class="span10" name="lienAap" readonly id="lienAap" value="${labelisationProjetInstance?.lienAap}" autocomplete="off">
        </g:else>
        
          </div>
        <div class="span2">
          <label><g:message code="labelisationProjet.motsCles.label" default="Mots clés du projet" /><span style="color:red">* :</span></label>
        </div>
        <div class="span4">
          <g:if test="${(labelisationProjetInstance.etapePorteur==0 && labelisationProjetInstance.etapeBp==1)}">
          <input type="text" class="span10" name="motsCles" id="motsCles" value="${labelisationProjetInstance?.motsCles}" autocomplete="off">
         </g:if>
      <g:else>
        <input type="text" class="span10" name="motsCles" readonly id="motsCles" value="${labelisationProjetInstance?.motsCles}" autocomplete="off">
        </g:else>
          </div>
      </div>
<!--      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="labelisationProjet.aide.label" default="Aide" /></label>
        </div>
        <div class="span4">
          <input type="text" class="span10" name="aide" id="aide" value="${labelisationProjetInstance?.aide}">
        </div>
      </div> -->

      <g:if test="${session.profil=="porteur"}">
        <g:if test="${etapePorteur<1}">
           <g:if test="${labelisationProjetInstance?.etape==null || labelisationProjetInstance?.etapePorteur==0}">
          <g:actionSubmit action="saveEtape1Porteur" class="btn btn-danger" value="Sauvegarder" id="valide1"/>
          </g:if>
         <g:actionSubmit action="SubmitEtape1Porteur" class="btn" value="Soumettre" id="valide1"/>
<!--            <g:actionSubmit action="SubmitEtape1Porteur" class="btn" value="Valider cet etape" id="valide2"/>-->
        </g:if>
      </g:if>
    </div>
  </fieldset>
</g:form>