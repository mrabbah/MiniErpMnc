<%@ page import="com.rabbahsoft.mnc.Document" %>
<script>
  function deletefile(idfile,id,x,val1){
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
<!--<div class="control-group">
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
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th>Fiche technique</th>
      <th><div id="fichetechnique">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>-->

<div class="control-group">
  <g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
<g:if test="${grilleAnalyseInstance!=null}">
  <g:if test="${grilleAnalyseInstance.getTotalAttachments('grilleAnalyse')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Grille d'analyse</th>
        <th><attachments:downloadLink attachment="${grilleAnalyseInstance.getAttachments('grilleAnalyse')[0]}"/></th>
      <th><a href="#" onclick="deletefile(${grilleAnalyseInstance.getAttachments('grilleAnalyse')[0].id},${grilleAnalyseInstance.id},'grilleAnalyse','${context11}'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Grille d'analyse</th>
        <th><div id="grilleAnalyse">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th>Grille d'analyse</th>
      <th><div id="grilleAnalyse">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>




<div class="control-group">
<g:if test="${lettreconfidentialiteInstance!=null}">
  <g:if test="${lettreconfidentialiteInstance.getTotalAttachments('lettreConfidentialite')!=0}">
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Lettre Confidentialité</th>
        <th><attachments:downloadLink attachment="${lettreconfidentialiteInstance.getAttachments('lettreConfidentialite')[0]}"/></th>
      <th><a href="#" onclick="deletefile(${lettreconfidentialiteInstance.getAttachments('lettreConfidentialite')[0].id},${lettreconfidentialiteInstance.id},'lettreConfidentialite','${context11}'); return false;"><i class="icon-trash"></i></a></th>
      </tr>
    </table>
  </g:if>
  <g:else>
    <table class="table table-striped table-bordered table-condensed">
      <tr>
        <th>Lettre Confidentialité</th>
        <th><div id="lettreConfidentialite">Upload</div></th>
      </tr>
    </table>
  </g:else>
</g:if>
<g:else>
  <table class="table table-striped table-bordered table-condensed">
    <tr>
      <th>Lettre Confidentialité</th>
      <th><div id="lettreConfidentialite">Upload</div></th>
    </tr>
  </table>
</g:else>
</div>