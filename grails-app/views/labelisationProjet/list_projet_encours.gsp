<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="datatable" content="DATATABLE" />  
    <meta name="commun" content="COMMUN" />  
    <meta name="form" content="FORM" />  
    <meta name="extendedform" content="EXTENDEDFORM" />  
    <meta name="layout" content="main"/>
  </head>
  <body>

    <div class="not_sortable">
      <div class="w-box">
<!--        <div class="w-box-header" >
          Labellisation des projets 
        </div>-->
        <div class="w-box-content cnt_a">
          <g:render template="nav"/>
          <table class="table table-striped table-bordered dTableR" id="">
            <thead>
              <tr>
                <g:if test="${params.global=='true'}">
                 <th></th>
                 </g:if>
<!--                <th>${message(code: 'labelisationProjet.interlocuteur.label', default: 'Nom Projet')}</th>-->
                <g:sortableColumn property="nomProjet" title="Projet"/>
                <g:sortableColumn property="porteurProjet" title="Porteur"/>
                <g:sortableColumn property="dateSoumissionProjet" title="Date de Soumission"/>
                <g:sortableColumn property="etatProjet" title="Statut"/>
                <g:sortableColumn property="etapeProjet" title="Stade avancement"/>
<!--                <th>${message(code: 'labelisationProjet.etape.label', default: 'Stade avancement')}</th>-->
                <th>${message(code: 'labelisationProjet.website.label', default: 'Détails')}</th>
                <th bgcolor="#4c9689">${message(code: 'labelisationProjet.website.label', default: 'Dossier Projet(zip)')}</th>
            </tr>
            </thead>
            <tbody role="alert" aria-live="polite" aria-relevant="all">
            <g:each in="${labelisationProjetInstanceList}" status="i" var="labelisationProjetInstance">
        
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                   <td style="color:#aa0e19"><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</g:link></td>
                 <td>${fieldValue(bean: labelisationProjetInstance, field: "porteurProjet")}</td> 
<!--                 <td>${fieldValue(bean: labelisationProjetInstance, field: "dateSoumissionProjet")}</td>-->
                 <td>${fieldValue(bean: labelisationProjetInstance, field: "raisonNonConformiteEtape10")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etatProjet")} de labellisation</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etape.libelle")}</td>
                  <td> ${raw(labelisationProjetInstance?.commentaire)}</td>
                 <td style="color:#aa0e19"><g:link action="downloadSampleZip1" id="${labelisationProjetInstance.id}">Télécharger le zip rejete</g:link></td>
                  </tr>
             
              
            </g:each>
            </tbody>
          </table>
        </div>

      </div>
    </div>
    <script type="text/javascript">
    
    
      function deleteprojet(val) {
    if( confirm('Vous etes sur de vouloir supprimer ce ?') ) 
    {
    $.post("/MiniErpMnc/LabelisationProjet/delete_projet",
    {
    id: val

    },
    function(data,status){
    alert("Data: " + data + "\nStatus: " + status);
        location.reload();
    });
    }
    }
    
    
    
    
  </script>
   <script src="js/delete_projet.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jquery.js"></script>
  </body>

</html>