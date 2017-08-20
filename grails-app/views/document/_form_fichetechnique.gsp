<%@ page import="com.rabbahsoft.mnc.Document" %>
<script>
  function deletefile(idfile,id){
    $.post("/MiniErpMnc/Document/deletefile",
              {
                id:id,
                idfile:idfile,
              },
               function(data){ 
               if(data==="true"){
               location.reload();
               }
               }
           );
         
}
</script>
<g:set var="ficheTechniqueInstance" value="${Document.findByCode("ficheTechnique")}" />
<g:set var="grilleAnalyseInstance" value="${Document.findByCode("grilleAnalyse")}" />
<div class="control-group">
<g:if test="${ficheTechniqueInstance!=null}">
  <g:if test="${ficheTechniqueInstance.getTotalAttachments('ficheTechnique')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Fiche technique</th>
        <th><attachments:downloadLink attachment="${ficheTechniqueInstance.getAttachments('ficheTechnique')[0]}"/></th>
      <th><a href="#" onclick="deletefile(${ficheTechniqueInstance.getAttachments('ficheTechnique')[0].id},${ficheTechniqueInstance.id},'ficheTechnique'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Fiche technique</th>
        <th><div id="fichetechnique">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
</div>

<g:form url="[resource:documentInstance]" class="form-horizontal" novalidate="novalidate" enctype="multipart/form-data">
<div id="preselection">
        <div class="control-group span12">
          <div class="span2">
            <label><g:message code="labelisationProjet.comitesThematiques.label" default="Fiche Technique :" /></label>
          </div>
          <div class="span10">
            <g:if test="${ficheTechniqueInstance.getTotalAttachments('ficheTechnique')!=0}">
              <table class="table table-striped table-bordered table-condensed">
                <tr>
                  <th>Icon</th>
                  <th>Nom du fichier</th>
                  <th>Taille</th>
                  <th>Supprimer</th>
                </tr>
                <g:each var="i" in="${ (0..<ficheTechniqueInstance.getTotalAttachments('ficheTechnique')) }">
                  <tr id="${ficheTechniqueInstance.getAttachments('ficheTechnique')[i].id}">
                    <td><attachments:icon attachment="${ficheTechniqueInstance.getAttachments('ficheTechnique')[i]}"/></td> 
                  <td><attachments:downloadLink attachment="${ficheTechniqueInstance.getAttachments('ficheTechnique')[i]}"/></td>
                  <td>${ficheTechniqueInstance.getAttachments('ficheTechnique')[i].niceLength}</td>
                  <td><a href="#" onclick="deletefile(${ficheTechniqueInstance.getAttachments('ficheTechnique')[i].id},${ficheTechniqueInstance.id}); return false;"><i class="icon-trash"></i></a></td>
                  </tr>
                </g:each>
              </table>
            </g:if>
            <g:else>
            <div data-provides="fileupload" class="fileupload fileupload-new"><input type="hidden" value="" name=""><input type="hidden">
              <div class="input-append">
                <div class="uneditable-input span2"><i class="icon-file fileupload-exists"></i> <span class="fileupload-preview"></span></div><span class="btn btn-file"><span class="fileupload-new">sélectionner</span><span class="fileupload-exists">changer</span><input type="file" id="ficheTechnique" name="ficheTechnique"></span><a data-dismiss="fileupload" class="btn fileupload-exists" href="#">supprimer</a>
              </div>
            </div>
            </g:else>
          </div>
        </div>
   <g:actionSubmit action="save_fichetechnique" class="btn btn-danger" value="Confirmer" />
  </g:form>