<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<script>
  function deletefile(idfile,id){
  $.post("/MiniErpMnc/LabelisationProjet/deletefile",
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
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_fifthstep6" novalidate="novalidate" enctype="multipart/form-data" >
  <div class="v-heading">Post Label</div>
  <div class="row-fluid">
    <div class="control-group">
      <div class="span2">
        <label><g:message code="labelisationProjet.dateDebut.label" default="Dossier de financement:" /></label>
      </div>
      <div class="span9">
        <g:if test="${labelisationProjetInstance.getTotalAttachments('dossierfinnacement')!=0}">
            <table class="table table-striped table-bordered table-condensed">
              <tr>
                <th>Icon</th>
                <th>Nom du fichier</th>
                <th>Taille</th>
                <th>Supprimer</th>
              </tr>
              <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('dossierfinnacement')) }">
                <tr id="${labelisationProjetInstance.getAttachments('dossierfinnacement')[i].id}">
                  <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('dossierfinnacement')[i]}"/></td> 
                <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('dossierfinnacement')[i]}"/></td>
                <td>${labelisationProjetInstance.getAttachments('dossierfinnacement')[i].niceLength}</td>
                <td><a href="#" onclick="deletefile(${labelisationProjetInstance.getAttachments('dossierfinnacement')[i].id},${labelisationProjetInstance.id}); return false;"><i class="icon-trash"></i></a></td>
                </tr>
              </g:each>
            </table>
          </g:if>
          <g:else>
            <div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden">
              <div class="input-append">
                <div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">sélectionner</span><span class="fileupload-exists">changer</span><input type="file"  name="dossierfinnacement"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">supprimer</a>
              </div>
            </div>
          </g:else>
      </div>
    </div>
    <g:actionSubmit action="saveEtape7porteur" class="btn btn-danger" value="Soumettre" />
  </div>
</g:form>