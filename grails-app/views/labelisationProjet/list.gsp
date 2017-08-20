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
        <div class="w-box-header">
          Labélisation des projets
        </div>
        <div class="w-box-content cnt_a">
          <table class="table table-striped table-bordered dTableR" id="dt_a">
            <thead>
              <tr>
                <th>${message(code: 'labelisationProjet.interlocuteur.label', default: 'Interlocuteur')}</th>
                <th>${message(code: 'labelisationProjet.fonction.label', default: 'Fonction')}</th>
                <th>${message(code: 'labelisationProjet.nomProjet.label', default: 'Nom Projet')}</th>
                <th>${message(code: 'labelisationProjet.nomCompletProjet.label', default: 'Nom Complet Projet')}</th>
                <th>${message(code: 'labelisationProjet.website.label', default: 'Website')}</th>
                <th></th>
            </tr>
            </thead>
            <tbody role="alert" aria-live="polite" aria-relevant="all">
            <g:each in="${labelisationProjetInstanceList}" status="i" var="labelisationProjetInstance">
              <g:if test="${params.encours=='true'}">
                <g:if test="${labelisationProjetInstance.etape.code!='labelise' && labelisationProjetInstance.etape.code!='refuse'}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                  <td><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "interlocuteur")}</g:link></td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "fonction")}1</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "nomCompletProjet")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "website")}</td>
                  <td><g:link action="show" id="${fieldValue(bean: labelisationProjetInstance, field: "id")}"><i class="icon-eye-open"></i></g:link></td>
                  </tr>
                </g:if>
              </g:if>
              <g:if test="${params.rejete=='true'}">
                <g:if test="${labelisationProjetInstance.etape.code=='refuse'}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                  <td><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "interlocuteur")}</g:link></td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "fonction")}2</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "nomCompletProjet")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "website")}</td>
                  <td><g:link action="show" id="${fieldValue(bean: labelisationProjetInstance, field: "id")}"><i class="icon-eye-open"></i></g:link></td>
                  </tr>
                </g:if>
              </g:if>
              <g:if test="${params.labelise=='true'}">
                <g:if test="${labelisationProjetInstance.etape.code=='labelise'}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                  <td><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "interlocuteur")}</g:link></td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "fonction")}3</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "nomCompletProjet")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "website")}</td>
                  <td><g:link action="show" id="${fieldValue(bean: labelisationProjetInstance, field: "id")}"><i class="icon-eye-open"></i></g:link></td>
                  </tr>
                </g:if>
              </g:if>
              <g:if test="${params.global=='true'}">
                  <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                  <td><g:link action="synthese" id="${labelisationProjetInstance.id}">${fieldValue(bean: labelisationProjetInstance, field: "interlocuteur")}</g:link></td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "fonction")}3</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "nomCompletProjet")}</td>
                  <td>${fieldValue(bean: labelisationProjetInstance, field: "website")}</td>
                  <td><g:link action="show" id="${fieldValue(bean: labelisationProjetInstance, field: "id")}"><i class="icon-eye-open"></i></g:link></td>
                  </tr>
              </g:if>
            </g:each>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </body>

</html>