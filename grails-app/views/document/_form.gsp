<%@ page import="com.rabbahsoft.mnc.Document" %>
<script>
  function deletefile(idfile,id,val1){
    $.post(val1+"/Document/deletefile",
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
<g:set var="lettreconfidentialiteInstance" value="${Document.findByCode("lettreConfidentialite")}" />
<g:set var="context11" value="${request.contextPath}" />
<div class="control-group">
<g:if test="${ficheTechniqueInstance!=null}">
  <g:if test="${ficheTechniqueInstance.getTotalAttachments('ficheTechnique')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th width="15">Fiche technique</th>
        <th width="40"><attachments:downloadLink attachment="${ficheTechniqueInstance.getAttachments('ficheTechnique')[0]}"/></th>
      <th width="15"><a href="#" onclick="deletefile(${ficheTechniqueInstance.getAttachments('ficheTechnique')[0].id},${ficheTechniqueInstance.id},'ficheTechnique','${context11}'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th width="15">Fiche technique</th>
        <th width="40"><div id="fichetechnique">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th width="15">Fiche technique</th>
      <th width="40"><div id="fichetechnique">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>

<div class="control-group">
<g:if test="${grilleAnalyseInstance!=null}">
  <g:if test="${grilleAnalyseInstance.getTotalAttachments('grilleAnalyse')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th width="15">Grille d'analyse</th>
        <th width="40"><attachments:downloadLink attachment="${grilleAnalyseInstance.getAttachments('grilleAnalyse')[0]}"/></th>
      <th width="15"><a href="#" onclick="deletefile(${grilleAnalyseInstance.getAttachments('grilleAnalyse')[0].id},${grilleAnalyseInstance.id},'grilleAnalyse','${context11}'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th width="15">Grille d'analyse</th>
        <th width="40"><div id="grilleAnalyse">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th width="15">Grille d'analyse</th>
      <th width="40"><div id="grilleAnalyse">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>




<div class="control-group">
<g:if test="${lettreconfidentialiteInstance!=null}">
  <g:if test="${lettreconfidentialiteInstance.getTotalAttachments('lettreConfidentialite')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th width="15">Lettre Confidentialité</th>
        <th width="40"><attachments:downloadLink attachment="${lettreconfidentialiteInstance.getAttachments('lettreConfidentialite')[0]}"/></th>
      <th width="15"><a href="#" onclick="deletefile(${lettreconfidentialiteInstance.getAttachments('lettreConfidentialite')[0].id},${lettreconfidentialiteInstance.id},'lettreConfidentialite','${context11}'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th width="15">Lettre Confidentialité</th>
        <th width="40"><div id="lettreConfidentialite">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th width="15">Lettre Confidentialité</th>
      <th width="40"><div id="lettreConfidentialite">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>