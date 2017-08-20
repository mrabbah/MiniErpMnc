<g:form name="myForm" url="[action:'list_projet_1']">
  <fieldset>
    <div class="v-heading">Recherche Projet</div>
    <div class="row-fluid">
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="nom Projet" default="nom Projet :" /></label>
        </div>
        <div class="span4">
          <input type="text" class="span10" id="nomprojet" name="nomprojet" value="">
        </div>
        
      </div>
      <div class="control-group span12">
        <div class="span2">
          <label><g:message code="nom porteur" default="nom du porteur" /></label>
        </div>
        <div class="span4">
          <input type="text" class="span10" id="nomporteur" name="nomporteur" value="">
        </div>
        
      </div> 

       <div class="control-group span12">
        <div class="span2">
          <label><g:message code="date soumission" default="Date soumission De:" /></label>
        </div>
        <div class="span4">
        <div class="dateTimeAudition input-append date span11">
              <input data-format="dd/MM/yyyy hh:mm:ss" type="text" class="span9" name="datesoumissionini" id="datesoumissionini" value="${formatDate(format:'dd/MM/yyyy hh:mm:ss',date:labelisationProjetInstance?.dateAuditionEtape6Bp)}" readonly="readonly" />
              <span class="add-on">
                <i class="splashy-calendar_day"></i>
              </span>
            </div>
        </div>
         <div class="span2">
          <label><g:message code="date soumission" default="Date soumission A:" /></label>
        </div>
        <div class="span4">
        <div class="dateTimeAudition input-append date span11">
              <input data-format="dd/MM/yyyy hh:mm:ss" type="text" class="span9" name="datesoumissionfinal" id="datesoumissionfinal" value="${formatDate(format:'dd/MM/yyyy hh:mm:ss',date:labelisationProjetInstance?.dateAuditionEtape6Bp)}" readonly="readonly" />
              <span class="add-on">
                <i class="splashy-calendar_day"></i>
              </span>
            </div>
        </div>
        
      </div>
      
      </div>
      
<input type="submit" value="Rechercher" /> 
<!--      <g:actionSubmit action="list_projet_1" class="btn btn-danger" value="Soumettre" />-->
    </div>
  </fieldset>
</g:form>