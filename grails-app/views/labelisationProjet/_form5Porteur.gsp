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
<g:form url="[resource:labelisationProjetInstance]" class="form-horizontal form_fifthstep5" novalidate="novalidate" enctype="multipart/form-data" >
  <div class="v-heading">Labellisation Commex</div>
  <div class="row-fluid">
    <div class="control-group span12">
      <dl class="dl-horizontal">
        <dt>Décision CT:</dt>
        <dd>${labelisationProjetInstance.decisionEtape7Bp}</dd>
    </div>


<!--    <g:actionSubmit action="saveEtape6porteur" class="btn btn-danger" value="Soumettre" />-->
  </div>
</g:form>