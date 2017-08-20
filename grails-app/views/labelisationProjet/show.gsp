
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
  <g:if test="${flash.message}">
    <div class="alert alert-success" id="notification">
      <a class="close" data-dismiss="alert">×</a>
${flash.message}
    </div>
  </g:if>
  <div class="not_sortable">
    <div class="w-box">
      <div class="w-box-header">
        Labélisation du projet
      </div>
      <div class="w-box-content cnt_a">
        <div class="row-fluid">
          <div class="span12">
            <div class="vcard">
              <ul>
                <li class="v-heading">
                  Informations sur le projet
                </li>
                <li>
                  <span class="item-key">Interlocuteur</span>
                  <div class="vcard-item">${fieldValue(bean: labelisationProjetInstance, field: "interlocuteur")}</div>
                </li>
                <li>
                  <span class="item-key">Nom du projet </span>
                  <div class="vcard-item">${fieldValue(bean: labelisationProjetInstance, field: "nomProjet")}</div>
                </li>
                <li>
                  <span class="item-key">Date de début du projet</span>
                  <div class="vcard-item"><g:formatDate date="${labelisationProjetInstance.dateDebut}" format="dd/MM/yyyy" /></div>
                </li>
                <li>
                  <span class="item-key">Date de fin du projet</span>
                  <div class="vcard-item"><g:formatDate date="${labelisationProjetInstance.dateFin}" format="dd/MM/yyyy" /></div>
                </li>
                <li>
                  <span class="item-key">Etape courante</span>
                  <div class="vcard-item">${labelisationProjetInstance.etape.libelle}</div>
                </li>
                <li>
                  <span class="item-key">Résumé en français :</span>
                  <div class="vcard-item">${fieldValue(bean: labelisationProjetInstance, field: "resumeFrancais")}</div>
                </li>
                <li>
                  <span class="item-key">Résumé en anglais :</span>
                  <div class="vcard-item">${fieldValue(bean: labelisationProjetInstance, field: "resumeAnglais")}</div>
                </li>
                <li class="v-heading">
                  Présentation :
                </li>
                <li>
                <g:if test="${labelisationProjetInstance.getTotalAttachments('presentationetape5')!=0}">
                  <div class="control-group">
                    <table class="table table-striped table-bordered table-condensed">
                      <tr>
                        <th>Icon</th>
                        <th>Nom du fichier</th>
                        <th>Taille</th>
                        <th>Date de création</th>
                      </tr>
                      <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('presentationetape5')) }">
                        <tr id="${labelisationProjetInstance.getAttachments('presentationetape5')[i].id}">
                          <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('presentationetape5')[i]}"/></td>
                        <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('presentationetape5')[i]}"/></td>
                        <td>${labelisationProjetInstance.getAttachments('presentationetape5')[i].niceLength}</td>
                        <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${labelisationProjetInstance.getAttachments('presentationetape5')[i].dateCreated}"/></td>
                        </tr>
                      </g:each>
                    </table>
                  </div>
                </g:if>
                </li>
                <li class="v-heading">
                  Fiche technique :
                </li>
                <li>
                <g:if test="${labelisationProjetInstance.getTotalAttachments('ficheTechnique')!=0}">
                  <div class="control-group">
                    <table class="table table-striped table-bordered table-condensed">
                      <tr>
                        <th>Icon</th>
                        <th>Nom du fichier</th>
                        <th>Taille</th>
                        <th>Date de création</th>
                      </tr>
                      <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('ficheTechnique')) }">
                        <tr id="${labelisationProjetInstance.getAttachments('ficheTechnique')[i].id}">
                          <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('ficheTechnique')[i]}"/></td>
                        <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('ficheTechnique')[i]}"/></td>
                        <td>${labelisationProjetInstance.getAttachments('ficheTechnique')[i].niceLength}</td>
                        <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${labelisationProjetInstance.getAttachments('ficheTechnique')[i].dateCreated}"/></td>
                        </tr>
                      </g:each>
                    </table>
                  </div>
                </g:if>
                </li>
                <li class="v-heading">
                  Grilles d'analyses :
                </li>
                <li>
                <g:if test="${labelisationProjetInstance.getTotalAttachments('grilleAnalyse')!=0}">
                  <div class="control-group">
                    <table class="table table-striped table-bordered table-condensed">
                      <tr>
                        <th>Icon</th>
                        <th>Nom du fichier</th>
                        <th>Taille</th>
                        <th>Date de création</th>
                      </tr>
                      <g:each var="i" in="${ (0..<labelisationProjetInstance.getTotalAttachments('grilleAnalyse')) }">
                        <tr id="${labelisationProjetInstance.getAttachments('grilleAnalyse')[i].id}">
                          <td><attachments:icon attachment="${labelisationProjetInstance.getAttachments('grilleAnalyse')[i]}"/></td> 
                        <td><attachments:downloadLink attachment="${labelisationProjetInstance.getAttachments('grilleAnalyse')[i]}"/></td>
                        <td>${labelisationProjetInstance.getAttachments('grilleAnalyse')[i].niceLength}</td>
                        <td><g:formatDate format="yyyy-MM-dd HH:mm" date="${labelisationProjetInstance.getAttachments('grilleAnalyse')[i].dateCreated}"/></td>
                        </tr>
                      </g:each>
                    </table>
                  </div>
                </g:if>
                </li>
                <li>
                <g:link controller="LabelisationProjet" action="downloadZip" id="${labelisationProjetInstance.id}" class="btn btn-danger">Télecharger le Zip</g:link>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>
