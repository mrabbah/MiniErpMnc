<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<%@ page import="com.rabbahsoft.mnc.Document" %>
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
  }
  }
  );

  }
</script>
<g:set var="grilleAnalyseInstance" value="${Document.findByCode("grilleAnalyse")}" />
<g:set var="mailEtape9Porteur" value="${MailTemplate.findByCode("mailEtape9Porteur")}"/>
<g:set var="mailEtape9Bp" value="${MailTemplate.findByCode("mailEtape9Bp")}"/>
<g:set var="context11" value="${request.contextPath}" />
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_ninethstep" novalidate="novalidate" enctype="multipart/form-data">
  <fieldset>
    <div class="v-heading">Grille d'analyse</div>
<g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
    <div class="row-fluid">     
      
      
      <g:if test="${labelisationProjetInstance.getTotalAttachments('presentation1')!=0}">
        <div class="control-group">
          
          <div class="span2">
            <label><g:message code="labelisationProjet.dateDebut.label" default="Grille analyse :" /><span style="color:red">* :</span></label>
          </div>
          
          <div class="span9">
          
          <table class="table table-striped table-bordered table-condensed">
            <tr>
              <th>Icon</th>
              <th>Nom du fichier</th>
              <th>Taille</th>
              <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==6)}">
              <th>Supprimer</th>
              </g:if>
            </tr>
            <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('presentation1')) }">
              <tr id="${labelisationProjetInstance.getAttachments('presentation1')[i].id}">
                <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('presentation1')[i]}"/></td> 
              <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('presentation1')[i]}"/></td>
              <td>${labelisationProjetInstance.getAttachments('presentation1')[i].niceLength}</td>
              <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==6)}">
              <td><a href="#" onclick="deletefile(${labelisationProjetInstance.getAttachments('presentation1')[i].id},${labelisationProjetInstance.id},'${context11}'); return false;"><i class="icon-trash"></i></a></td>
              </g:if>
              </tr>
            </g:each>
          </table>
            
            </div>
          
        </div>
      </g:if>
      <g:else>
             <div data-provides="fileupload" class="fileupload fileupload-new span12"><input type="hidden" value="" name="presentation1" id="presentation1"><input type="hidden" name="presentation1" id="presentation1" >
               <div class="span2">
               <label><g:message code="labelisationProjet.Grilleanalyse.label" default="Grille analyse:" /></label> 
              </div> 
               <div class="input-append span4" >
                 <div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Uploader</span><span class="fileupload-exists">changer</span><input type="file" name="presentation1" id="presentation1"></span>
                
                 <a data-dismiss="fileupload" class="btn fileupload-exists" href="#">supprimer</a>
                
                </div>
                
              </div>
          </g:else>
          
        <div class="control-group span12">
          <div class="span2">
            <dt>Rapporteurs :</dt>
            </div>
          <div class="span10">
            <dd> <g:each in="${labelisationProjetInstance.rapporteursconfirmes}" status="i" var="ct">
              <span class="label label-info"> ${ct}</span>
            </g:each></dd>
            </div>
        </div>
           <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Evaluateurs externes :" /></label>
          </div>
          <div class="span4">
            <div class="input-append  span9" >
              <input class="span12" type="text" id="autre" name="autre" value="${labelisationProjetInstance?.autre}" readonly>
            </div>
          </div>
        </div>
      <g:if test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==6)}">
      <g:actionSubmit action="saveEtape5Bp" class="btn btn-danger" value="Soumettre" />
      </g:if>
    </div>
  </fieldset>
</g:form>