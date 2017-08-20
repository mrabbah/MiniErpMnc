<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<script>
  function deletefile(idfile,id,val1){
  $.post(val1+"/LabelisationProjet/deletefile",
  {
  id:id,
  idfile:idfile
  },
  function(data){ 
  if(data==="true"){
  var selector="#"+idfile;
  $(selector).animate({ backgroundColor: "#FFFF00" }, "fast").animate({ opacity: "hide" }, "slow");
  $.sticky("Le fichier a été supprimé.", {autoclose: 5000, position: "top-right", type: "st-error"});
  location.reload();
  }
  }
  );

  }
</script>
<g:set var="context11" value="${request.contextPath}" />
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_2Bp" novalidate="novalidate" enctype="multipart/form-data">
  <fieldset>
    
                 <div class="v-heading" id="selection1">Pitch CT</div> 
<div class="v-heading" id="selection2">Dossier de labellisation & Fiche signalétique</div>
    <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
    <g:hiddenField name="datereuadition" id="datereuadition" value="${labelisationProjetInstance.dateReauditionEtape2Bp}" />
    <div class="row-fluid">
      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.decision.label" default="Décision :" /></label>
        </div>
        <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==3}">
        <div class="span9">
          <label class="radio inline">
            <input type="radio" value="preselection" id="" name="decisionEtape2Bp" <g:if test="${labelisationProjetInstance?.decisionEtape2Bp=="preselection" || labelisationProjetInstance?.decisionEtape2Bp=="" || labelisationProjetInstance?.decisionEtape2Bp=="null" || labelisationProjetInstance?.decisionEtape2Bp==null}">checked</g:if> />
            Préselection
          </label>
          <label class="radio inline">
            <input type="radio" value="reaudition" id="" name="decisionEtape2Bp"   <g:if test="${labelisationProjetInstance?.decisionEtape2Bp=="reaudition"}">checked</g:if>/>
            Ré-audition
          </label>
          <label class="radio inline">
            <input type="radio" value="redirection" id="" name="decisionEtape2Bp"  <g:if test="${labelisationProjetInstance?.decisionEtape2Bp=="redirection"}">checked</g:if> />
<!--            Redirection-->
            Redirigé
          </label>
          <label class="radio inline">
            <input type="radio" value="rejete" id="" name="decisionEtape2Bp"   <g:if test="${labelisationProjetInstance?.decisionEtape2Bp=="rejete"}">checked</g:if>/>
            Rejet
          </label>
        </div>
        </g:if>
            <g:else>
          <div class="span9">
          <label class="radio inline">
            <input type="radio" value="preselection" id="" name="decisionEtape2Bp" disabled="disabled" <g:if test="${labelisationProjetInstance?.decisionEtape2Bp=="preselection" || labelisationProjetInstance?.decisionEtape2Bp=="" || labelisationProjetInstance?.decisionEtape2Bp=="null" || labelisationProjetInstance?.decisionEtape2Bp==null}">checked</g:if> />
            Préselection
          </label>
          <label class="radio inline">
            <input type="radio" value="reaudition" id="" name="decisionEtape2Bp" disabled="disabled"  <g:if test="${labelisationProjetInstance?.decisionEtape2Bp=="reaudition"}">checked</g:if>/>
            Ré-audition
          </label>
          <label class="radio inline">
            <input type="radio" value="redirection" id="" name="decisionEtape2Bp" disabled="disabled" <g:if test="${labelisationProjetInstance?.decisionEtape2Bp=="redirection"}">checked</g:if> />
            Redirection
          </label>
          <label class="radio inline">
            <input type="radio" value="rejete" id="" name="decisionEtape2Bp"  disabled="disabled" <g:if test="${labelisationProjetInstance?.decisionEtape2Bp=="rejete"}">checked</g:if>/>
            Rejeté
          </label>
        </div>
            </g:else>
      </div>
      <div id="preselection">
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Rapport BP :" /><span style="color:red">* :</span></label>
          </div>
          <div class="span10">
            <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==3}">
            <g:if test="${labelisationProjetInstance.getTotalAttachments('rapportCT')!=0}">
              <table class="table table-striped table-bordered table-condensed">
                <tr>
                  <th>Icon</th>
                  <th>Nom du fichier</th>
                  <th>Taille</th>
                  <th>Supprimer</th>
                </tr>
                <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('rapportCT')) }">
                  <tr id="${labelisationProjetInstance.getAttachments('rapportCT')[i].id}">
                    <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('rapportCT')[i]}"/></td> 
                  <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('rapportCT')[i]}"/></td>
                  <td>${labelisationProjetInstance.getAttachments('rapportCT')[i].niceLength}</td>
                  <td><a href="#" onclick="deletefile(${labelisationProjetInstance.getAttachments('rapportCT')[i].id},${labelisationProjetInstance.id},'${context11}'); return false;"><i class="icon-trash"></i></a></td>
                  </tr>
                </g:each>
              </table>
            </g:if>
            <g:else>
            <div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden">
              <div class="input-append">
                <div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Uploader</span><span class="fileupload-exists">changer</span><input type="file" id="rapportCT" name="rapportCT"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">supprimer</a>
              </div>
            </div>
            </g:else>
            </g:if>
            <g:else>
            <g:if test="${labelisationProjetInstance.getTotalAttachments('rapportCT')!=0}">
              <table class="table table-striped table-bordered table-condensed">
                <tr>
                  <th>Icon</th>
                  <th>Nom du fichier</th>
                  <th>Taille</th>
                </tr>
                <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('rapportCT')) }">
                  <tr id="${labelisationProjetInstance.getAttachments('rapportCT')[i].id}">
                    <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('rapportCT')[i]}"/></td> 
                  <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('rapportCT')[i]}"/></td>
                  <td>${labelisationProjetInstance.getAttachments('rapportCT')[i].niceLength}</td>
                  </tr>
                </g:each>
              </table>
            </g:if>
            </g:else>
            
          </div>
        </div>
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Confirmation rapporteurs :" /></label>
          </div>
          <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==3}">
          <div class="span10">
            <g:select name="rapporteursconfirmes" id="rapporteursconfirmes" from="${labelisationProjetInstance?.evaluateurs}" optionKey="id" value="${labelisationProjetInstance?.rapporteursconfirmes*.id}"  multiple="multiple" data-placeholder="Ajoutez..." class="chzn_b span12"/>
          </div>
           </g:if>
          <g:else>
          <div class="span10">
            <g:select name="rapporteursconfirmes" id="rapporteursconfirmes" disabled="disabled" from="${labelisationProjetInstance?.evaluateurs}" optionKey="id" value="${labelisationProjetInstance?.rapporteursconfirmes*.id}"  multiple="multiple" data-placeholder="Ajoutez..." class="chzn_b span12"/>
          </div>
          </g:else>
        </div>
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Autres évaluateurs :" /></label>
          </div>
          <div class="span4">
            <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==2}">
            <div class="input-append  span9" >
              <input class="span12" type="text" id="autre" name="autre" value="${labelisationProjetInstance?.autre}" >
            </div>
            </g:if>
          <g:else>
            <div class="input-append  span9" >
              <input class="span12" type="text" id="autre" name="autre" readonly value="${labelisationProjetInstance?.autre}" >
            </div>
             </g:else>
          </div>
        </div>
          <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.dateDebut.label" default="Date de la préselection  :" /><span style="color:red">* :</span></label>
          </div>
         <div class="span4">
            <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==2}">
            <div class="input-append date datepicker1 span9" data-date-format="dd/mm/yyyy">
              <input class="span12" type="text" id="datePreselectionEtape2Bp" name="datePreselectionEtape2Bp" value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.datePreselectionEtape2Bp)}" readonly="readonly"><span class="add-on"><i class="splashy-calendar_day"></i></span>
            </div>
             </g:if>
          <g:else>
             <div class="input-append date datepicker span9" data-date-format="dd/mm/yyyy">
              <input class="span12" type="text" id="datePreselectionEtape2Bp" name="datePreselectionEtape2Bp" readonly value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.datePreselectionEtape2Bp)}" readonly="readonly"><span class="add-on"><i class="splashy-calendar_day"></i></span>
            </div>
            </g:else>
          </div>
        </div>
         
      
      </div>
      <div id="reaudition">
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.dateDebut.label" default="Date de la ré-eaudition" /></label>
          </div>
          <div class="span4">
            <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==3}">
            <div class="input-append date datepicker span9" data-date-format="dd/mm/yyyy">
              <input class="span12" type="text" id="dateReauditionEtape2Bp" name="dateReauditionEtape2Bp" value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateReauditionEtape2Bp)}" readonly="readonly"><span class="add-on"><i class="splashy-calendar_day"></i></span>
            </div>
               </g:if>
          <g:else>
            <div class="input-append date datepicker span9" data-date-format="dd/mm/yyyy">
              <input class="span12" type="text" id="dateReauditionEtape2Bp" name="dateReauditionEtape2Bp" readonly value="${formatDate(format:'dd/MM/yyyy',date:labelisationProjetInstance?.dateReauditionEtape2Bp)}" readonly="readonly"><span class="add-on"><i class="splashy-calendar_day"></i></span>
            </div>
            </g:else>
          </div>
        </div>
      </div>
      <div id="redirection">
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.motifRefusReception.label" default="Structure d'accompagnement :" /></label>
          </div>
          <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==3}">
          <div class="span10">
            <textarea cols="1" rows="6" name="structureAccompagnement" id="structureAccompagnement" class="span12" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.structureAccompagnement}</textarea>
          </div>
          </g:if>
          <g:else>
           <div class="span10">
            <textarea cols="1" rows="6" name="structureAccompagnement" id="structureAccompagnement" readonly class="span12" style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.structureAccompagnement}</textarea>
          </div> 
          </g:else>
        </div>
      </div>
      <div id="rejete">
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.motifRefusReception.label" default="Raisons du rejet :" /></label>
          </div>
          <g:if test="${labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==3}">
          <div class="span10">
            <textarea cols="1" rows="6" name="raisonRejetEtape2Bp" id="raisonRejetEtape2Bp" class="span12"  style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.raisonRejetEtape2Bp}</textarea>
          </div>
            </g:if>
          <g:else>
            <div class="span10">
            <textarea cols="1" rows="6" name="raisonRejetEtape2Bp" id="raisonRejetEtape2Bp" class="span12" readonly style="overflow: hidden; word-wrap: break-word; max-height: 90px; min-height: 90px; height: 90px;">${labelisationProjetInstance?.raisonRejetEtape2Bp}</textarea>
          </div>
            </g:else>
        </div>
      </div>
<g:if test="${(3>labelisationProjetInstance.etapePorteur && labelisationProjetInstance.etapeBp==3 && labelisationProjetInstance.etatProjet!='redirection' && labelisationProjetInstance.etatProjet!='rejet')}">
      <g:actionSubmit action="saveEtape2Bp" class="btn btn-danger" value="Envoyer" />
</g:if>
    </div>
  </fieldset>
</g:form>