<%@ page import="com.rabbahsoft.mnc.Formation" %>
<script>
  function deletefile(idfile,id,type){
    $.post("/MiniErpMnc/Formation/deletefile",
              {
                id:id,
                idfile:idfile
              },
               function(data){ 
               if(data==="true"){
               var selector="#"+idfile;
               $(selector).html("");
               if(type=="fichetechnique"){
               $(selector).html('<div class="span2"><label><g:message code="labelisationProjet.fichetechnique.label" default="Document technique :" /></label></div><div class="span4"><div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden"><div class="input-append"><div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Sélectionner ...</span><span class="fileupload-exists">Changer</span><input type="file" name="fichetechnique" id="fichetechnique"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">Supprimer</a></div></div></div>');  
               }
               if(type=="lettresoutien1"){
               $(selector).html('<div class="span2"><label><g:message code="labelisationProjet.fichetechnique.label" default="Lettre de soutien 1 :" /></label></div><div class="span4"><div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden"><div class="input-append"><div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Sélectionner ...</span><span class="fileupload-exists">Changer</span><input type="file" name="lettresoutien1" id="lettresoutien1"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">Supprimer</a></div></div></div>');  
               }
               if(type=="lettresoutien2"){
               $(selector).html('<div class="span2"><label><g:message code="labelisationProjet.fichetechnique.label" default="Lettre de soutien 2 :" /></label></div><div class="span4"><div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden"><div class="input-append"><div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Sélectionner ...</span><span class="fileupload-exists">Changer</span><input type="file" name="lettresoutien2" id="lettresoutien2"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">Supprimer</a></div></div></div>');  
               }
               if(type=="lettresoutien3"){
               $(selector).html('<div class="span2"><label><g:message code="labelisationProjet.fichetechnique.label" default="Lettre de soutien 3 :" /></label></div><div class="span4"><div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden"><div class="input-append"><div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Sélectionner ...</span><span class="fileupload-exists">Changer</span><input type="file" name="lettresoutien3" id="lettresoutien3"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">Supprimer</a></div></div></div>');  
               }
               $.sticky("Le fichier a été supprimé.", {autoclose: 5000, position: "top-right", type: "st-error"});
               }
               }
           );
         
}
</script>
<g:form url="[resource:formationInstance]" class="form-horizontal form_firststep" novalidate="novalidate" enctype="multipart/form-data">
  <g:hiddenField name="id" value="${formationInstance?.id}" />
  <g:hiddenField name="version" value="${formationInstance?.version}" />
  <fieldset>
    <div class="v-heading">Grilles d'analyses</div>
    <div class="row-fluid">
      
      <div class="control-group">
        <div class="span2">
          <label><g:message code="labelisationProjet.fichetechnique.label" default="Grille d'analyse :" /></label>
        </div>
        <div class="span4">
          <div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden">
            <div class="input-append">
              <div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">Sélectionner ...</span><span class="fileupload-exists">Changer</span><input type="file" name="grilleanalyse" id="grilleanalyse"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">Supprimer</a>
            </div>
          </div>
        </div>
      </div>
      <table class="table table-striped table-bordered table-condensed">
        <tr>
          <th>Icon</th>
          <th>Nom du fichier</th>
          <th>Taille</th>
          <th>Rapporteur</th>
          <th>Supprimer</th>
        </tr>
        <g:each in="${formationInstance.grillesAnalyse}">
          <tr id="">
            <td><attachments:icon attachment="${it.getAttachments('grilleanalyse')[0]}"/></td>
          <td><attachments:downloadLink attachment="${it.getAttachments('grilleanalyse')[0]}"/></td>
          <td>${it.getAttachments('grilleanalyse').niceLength}</td>
          <td>${it.rapporteur}</td>
          <td><a href="#" onclick="deletefile(${it.getAttachments('grilleanalyse')[0].id},${it.id},'grilleanalyse'); return false;"><i class="icon-trash"></i></a></td>
          </tr>
        </g:each>
      </table>
     
      <div class="form-actions">
        <g:actionSubmit action="saveEtape4" class="btn btn-danger" value="Enregistrer" />
      </div>
    </div>
  </fieldset>
</g:form>


