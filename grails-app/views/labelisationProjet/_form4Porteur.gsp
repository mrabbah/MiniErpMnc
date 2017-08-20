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
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_fifthstep" novalidate="novalidate" enctype="multipart/form-data" >
  <div class="v-heading">Evaluation CT</div>
  <div class="row-fluid">
    <div class="control-group span12">
      <dl class="dl-horizontal">
        <dt>Décision CT :</dt>
        <dd>${labelisationProjetInstance.decisionEtape6Bp}</dd>
    </div>

    <g:if test="${labelisationProjetInstance.decisionEtape6Bp=="rejete"}">
      <div class="control-group span12">
        <dl class="dl-horizontal">
          <dt>Raisons du rejet :</dt>
          <dd>${labelisationProjetInstance.raisonRejetEtape6Bp}</dd>
      </div>
    </g:if>

   <g:if test="${labelisationProjetInstance.decisionEtape6Bp=="avisFavorable"}">
      <div class="control-group span12">
        <dl class="dl-horizontal">
          <dt>Date de l'audition :</dt>
          <g:if test="${labelisationProjetInstance?.dateAuditionEtape6Bp!=null}">
             <dd>${formatDate(format:'dd/MM/yyyy hh:mm',date:labelisationProjetInstance?.dateAuditionEtape6Bp)}</dd>
              </g:if>
<!--          <dd>${labelisationProjetInstance.dateAuditionEtape6Bp}</dd>-->
          <dt>Lieu de l'audition :</dt>
          <dd>${labelisationProjetInstance.lieuAuditionEtape6Bp}.</dd>
      </div>
    </g:if>
<!--    <g:actionSubmit action="saveEtape4Porteur" class="btn btn-danger" value="Soumettre" />-->
  </div>
</g:form>