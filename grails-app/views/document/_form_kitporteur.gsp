<%@ page import="com.rabbahsoft.mnc.Document" %>
<script>
  function deletefile(idfile,id,h,val1){
    
  var chemin=val1+"/Document/deletefile";
    $.post(chemin,
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
<g:set var="fichesignaletiqueInstance" value="${Document.findByCode("fichesignaletique")}" />
<g:set var="dossierlabellisationInstance" value="${Document.findByCode("dossierlabellisation")}" />
<g:set var="businessmodelcanevasInstance" value="${Document.findByCode("business_model_canevas")}" />
<g:set var="grilleAnalyseInstance" value="${Document.findByCode("grilleAnalyse")}" />
<g:set var="lettreconfidentialiteInstance" value="${Document.findByCode("lettreConfidentialite")}" />
<g:set var="context11" value="${request.contextPath}" />
<div class="control-group">
  <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
<g:if test="${fichesignaletiqueInstance!=null}">
  <g:if test="${fichesignaletiqueInstance.getTotalAttachments('fichesignaletique')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Fiche Signalétique</th>
        <th><attachments:downloadLink attachment="${fichesignaletiqueInstance.getAttachments('fichesignaletique')[0]}"/></th>
      <th><a href="#" onclick="deletefile(${fichesignaletiqueInstance.getAttachments('fichesignaletique')[0].id},${fichesignaletiqueInstance.id},'fichesignaletique','${context11}'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Fiche Signalétique</th>
        <th><div id="fichesignaletique">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th>Fiche Signalétique</th>
      <th><div id="fichesignaletique">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>

<div class="control-group">
<g:if test="${dossierlabellisationInstance!=null}">
  <g:if test="${dossierlabellisationInstance.getTotalAttachments('dossierlabellisation')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Dossier de Labellisation</th>
        <th><attachments:downloadLink attachment="${dossierlabellisationInstance.getAttachments('dossierlabellisation')[0]}"/></th>
      <th><a href="#" onclick="deletefile(${dossierlabellisationInstance.getAttachments('dossierlabellisation')[0].id},${dossierlabellisationInstance.id},'dossierlabellisation','${context11}'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Dossier de Labellisation</th>
        <th><div id="dossierlabellisation">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th>Dossier de Labellisation</th>
      <th><div id="dossierlabellisation">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>




<div class="control-group">
<g:if test="${businessmodelcanevasInstance!=null}">
  <g:if test="${businessmodelcanevasInstance.getTotalAttachments('business_model_canevas')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Business Model Canevas</th>
        <th><attachments:downloadLink attachment="${businessmodelcanevasInstance.getAttachments('business_model_canevas')[0]}"/></th>
      <th><a href="#" onclick="deletefile(${businessmodelcanevasInstance.getAttachments('business_model_canevas')[0].id},${businessmodelcanevasInstance.id},'business_model_canevas','${context11}'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Business Model Canevas</th>
        <th><div id="business_model_canevas">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th>Business Model Canevas</th>
      <th><div id="business_model_canevas">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>