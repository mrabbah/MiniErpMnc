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
<g:set var="context11" value="${request.contextPath}" />
    <div class="not_sortable">
      <div class="w-box">
<!--        <div class="w-box-header" >
          Labellisation des projets 
        </div>-->
<g:hiddenField name="context1" id="context1" value="${request.contextPath}" />
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
                <g:sortableColumn property="etapeProjet" title="Etape"/>
<!--                <th>${message(code: 'labelisationProjet.etape.label', default: 'Stade avancement')}</th>-->
                <th>${message(code: 'labelisationProjet.website.label', default: 'Avancement')}</th>
                <th bgcolor="#4c9689">${message(code: 'labelisationProjet.website.label', default: 'Zip Projet')}</th>
            </tr>
            </thead>
            <tbody role="alert" aria-live="polite" aria-relevant="all">
            <g:each in="${labelisationProjetInstanceList}" status="i" var="labelisationProjetInstance">
              <g:if test="${params.encours=='true'}">
                <g:if test="${labelisationProjetInstance.etape.code!='labelise' && labelisationProjetInstance.etape.code!='refuse'}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                   <td style="color:#aa0e19"><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</g:link></td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "porteurProjet")}</td>
<!--                  <td>${fieldValue(bean: labelisationProjetInstance, field: "dateSoumissionProjet")}</td>-->
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "raisonNonConformiteEtape10")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etatProjet")} de labellisation</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etape.libelle")}</td>
                  <td> ${raw(labelisationProjetInstance?.commentaire)}</td>
<!--                  <td><g:link action="show" id="${fieldValue(bean: labelisationProjetInstance, field: "id")}"><i class="icon-eye-open"></i></g:link></td>-->
<!--                   <td style="color:#aa0e19"><g:link action="downloadKitLabelisation" id="${labelisationProjetInstance.id}">Kit de labellisation</g:link></td>-->
                <td style="color:#aa0e19"><g:link action="downloadSampleZip1" id="${labelisationProjetInstance.id}">Télécharger le zip</g:link></td>  
                </tr>
                </g:if>
              </g:if>
              <g:if test="${params.sort!=null && params.order!=null}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                   <td style="color:#aa0e19"><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</g:link></td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "porteurProjet")}</td>
<!--                  <td>${fieldValue(bean: labelisationProjetInstance, field: "dateSoumissionProjet")}</td>-->
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "raisonNonConformiteEtape10")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etatProjet")} de labellisation</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etape.libelle")}</td>
                  <td > ${raw(labelisationProjetInstance?.commentaire)}</td>
<!--                  <td><g:link action="show" id="${fieldValue(bean: labelisationProjetInstance, field: "id")}"><i class="icon-eye-open"></i></g:link></td>-->
                   <td style="color:#aa0e19"><g:link action="downloadSampleZip1" id="${labelisationProjetInstance.id}">Télécharger le zip</g:link></td>
                  </tr>
              </g:if>
              <g:if test="${params.rejete=='true'}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                   <td style="color:#aa0e19"><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</g:link></td>
                 <td>${fieldValue(bean: labelisationProjetInstance, field: "porteurProjet")}</td> 
<!--                 <td>${fieldValue(bean: labelisationProjetInstance, field: "dateSoumissionProjet")}</td>-->
                 <td>${fieldValue(bean: labelisationProjetInstance, field: "raisonNonConformiteEtape10")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etatProjet")} de labellisation</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etape.libelle")}</td>
                  <td > ${raw(labelisationProjetInstance?.commentaire)}</td>
                 <td style="color:#aa0e19"><g:link action="downloadSampleZip1" id="${labelisationProjetInstance.id}">Télécharger le zip</g:link></td>
                  </tr>
              </g:if>
              <g:if test="${params.labelise=='true'}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                  <td style="color:#aa0e19"><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</g:link></td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "porteurProjet")}</td>
<!--                  <td>${fieldValue(bean: labelisationProjetInstance, field: "dateSoumissionProjet")}</td>-->
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "raisonNonConformiteEtape10")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etatProjet")} de labellisation</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etape.libelle")}</td>
                  <td > ${raw(labelisationProjetInstance?.commentaire)}</td>
<!--                  <td><g:link action="show" id="${fieldValue(bean: labelisationProjetInstance, field: "id")}"><i class="icon-eye-open"></i></g:link></td>-->
                   <td style="color:#aa0e19"><g:link action="downloadSampleZip1" id="${labelisationProjetInstance.id}">Télécharger le zip</g:link></td>
                  </tr>
              </g:if>
              <g:if test="${params.global=='true' && labelisationProjetInstance!=null}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                    <td><a href="#" id="${labelisationProjetInstance.id}" class="projet"><i class="icon-remove-sign" ></i></td>
                  <td style="color:#aa0e19"><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</g:link></td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "porteurProjet")}</td>
<!--                  <td>${fieldValue(bean: labelisationProjetInstance, field: "dateSoumissionProjet")}</td>-->
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "raisonNonConformiteEtape10")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etatProjet")} de labellisation</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "etape.libelle")}</td>
                  <td> ${raw(labelisationProjetInstance?.commentaire)} </td>
<!--                  <td><g:link action="show" id="${fieldValue(bean: labelisationProjetInstance, field: "id")}"><i class="icon-eye-open"></i></g:link></td>-->
                   <td style="color:#aa0e19"><g:link action="downloadSampleZip1" id="${labelisationProjetInstance.id}">Télécharger le zip</g:link></td>
                  </tr>
              </g:if>
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