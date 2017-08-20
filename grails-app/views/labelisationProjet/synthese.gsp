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
<g:set var="poste" value="${session.profil}"/>
    <div class="container">
        <div class="w-box-header">
          <h2>Synthèse projet</h2>
        </div>
        <div class="w-box-content cnt_a">
          <table class="table table-striped table-bordered dTableR"  style="width:400px">
            <thead>
              <tr>
                <th style="width:300px">Etape</th>
                <th style="width:100px">Avancement</th>
            </tr>
            </thead>
            <tbody>
<!--                  access porteur-->
    <g:if test="${poste=='porteur'}">
      <tr> 
      <th>Infos projet</th>
                  <g:if test="${(labelisationProjetInstance.etapePorteur==1 || labelisationProjetInstance.etapePorteur >1) && (labelisationProjetInstance.etapeBp==2 || labelisationProjetInstance.etapeBp>2)}">
                <th>validé </th>
                  </g:if>
                  <g:else>
                  <th></th>
                  </g:else>
      </tr> 
      <tr> 
      <th>Recevabilité</th> 
                    <g:if test="${(labelisationProjetInstance.etapePorteur==2 || labelisationProjetInstance.etapePorteur >2) && (labelisationProjetInstance.etapeBp==3 || labelisationProjetInstance.etapeBp>3)}">
                <th>validé </th>
                  </g:if>
                  <g:elseif test="${(labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==2)}">
<!--                  <th>en cours </th>-->
                  <th>Projet recevable </th>
                  </g:elseif>
                  <g:elseif test="${(labelisationProjetInstance.etatProjet=='rejet')}">
<!--                  <th>rejet</th>-->
                  <th>non recevable</th>
                  </g:elseif>
                <g:else>
                <th></th>
               </g:else>
      </tr> 
      <tr> 
      <th>Pitch CT</th> 
                   <g:if test="${(labelisationProjetInstance.etapePorteur==3 || labelisationProjetInstance.etapePorteur >3) && (labelisationProjetInstance.etapeBp==4 || labelisationProjetInstance.etapeBp>4)}">
                <th>validé</th>
                  </g:if>
                  <g:elseif test="${(labelisationProjetInstance.etatProjet=='rejet')}">
                  <th>rejet</th>
                  </g:elseif>
                  <g:elseif test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3)}">
                  <th>en cours </th>
                  </g:elseif>
                <g:else>
                <th></th>
               </g:else>
      </tr> 
      <tr> 
      <th>Evaluation CT</th> 
                   <g:if test="${(labelisationProjetInstance.etapePorteur==4 || labelisationProjetInstance.etapePorteur >4) && (labelisationProjetInstance.etapeBp==7 || labelisationProjetInstance.etapeBp>7)}">
                <th>validé</th>
                  </g:if>
                 
               <g:elseif test="${(labelisationProjetInstance.etapePorteur==4 && labelisationProjetInstance.etapeBp==7)}">
                  <th>en cours</th>
                  </g:elseif>
                  <g:elseif test="${(labelisationProjetInstance.etatProjet=='rejet')}">
                  <th>rejet</th>
                  </g:elseif>
                <g:else>
                <th></th>
               </g:else>
      </tr> 
      <tr> 
      <th>Labellisation Commex</th> 
                   <g:if test="${(labelisationProjetInstance.etapePorteur==5 || labelisationProjetInstance.etapePorteur >5) && (labelisationProjetInstance.etapeBp==8 || labelisationProjetInstance.etapeBp>8)}">
                <th>validé</th>
                  </g:if>
                  <g:elseif test="${(labelisationProjetInstance.etapePorteur==4 && labelisationProjetInstance.etapeBp==8)}">
                  <th>en cours</th>
                  </g:elseif>
                  <g:elseif test="${(labelisationProjetInstance.etatProjet=='rejet')}">
                  <th>rejet</th>
                  </g:elseif>
                <g:else>
                <th></th>
               </g:else>
      </tr> 
     
   </g:if>
<!--            access bp-->
      <g:if test="${poste=='BP'}">
        <tr> 
      <th>Infos projet </th>
                  <g:if test="${(labelisationProjetInstance.etapePorteur==1 || labelisationProjetInstance.etapePorteur >1) && (labelisationProjetInstance.etapeBp==2 || labelisationProjetInstance.etapeBp>2)}">
<!--                <th>Soumis le ${labelisationProjetInstance.infoprojet}</th>-->
                
               <th>Soumis le ${labelisationProjetInstance.raisonNonConformiteEtape10}</th>
                  </g:if>
                  <g:else>
                  <th></th>
                  </g:else>
      </tr> 
      <tr> 
      <th>Recevabilité</th> 
                  <g:if test="${(labelisationProjetInstance.etapePorteur==2 || labelisationProjetInstance.etapePorteur >2) && (labelisationProjetInstance.etapeBp==3 || labelisationProjetInstance.etapeBp>3)}">
                <th>validé</th>
                  </g:if>
                  <g:elseif test="${(labelisationProjetInstance.etatProjet=='rejet'&& labelisationProjetInstance.etapePorteur==2)}">
                  <th>non recevable</th>
                  </g:elseif>
                  <g:elseif test="${(labelisationProjetInstance.etapePorteur==2 && labelisationProjetInstance.etapeBp==2)}">

                  <th>Accepté le  ${labelisationProjetInstance.recevabilite.format('dd/MM/yyyy HH:mm')}</th>
                  </g:elseif>
                <g:else>
                <th></th>
               </g:else>
      </tr> 
      <tr> 
      <th>Pitch CT</th> 
                  <g:if test="${(labelisationProjetInstance.etapePorteur==3 || labelisationProjetInstance.etapePorteur >3) && (labelisationProjetInstance.etapeBp==4 || labelisationProjetInstance.etapeBp>4)}">
                <th>validé</th>
                  </g:if>
                  <g:elseif test="${(labelisationProjetInstance.etatProjet=='rejet' && labelisationProjetInstance.etapePorteur==3)}">
                  <th>rejete</th>
                  </g:elseif>
                  <g:elseif test="${(labelisationProjetInstance.etapePorteur==3 && labelisationProjetInstance.etapeBp==3)}">
                  <th>en cours </th>
                  </g:elseif>
                <g:else>
                <th></th>
               </g:else>
      </tr> 
      <tr> 
      <th>Accusé de réception</th> 
                  <g:if test="${(labelisationProjetInstance.etapePorteur==3 || labelisationProjetInstance.etapePorteur >3) && (labelisationProjetInstance.etapeBp==5 || labelisationProjetInstance.etapeBp>5)}">
                <th>validé</th>
                  </g:if>
                  <g:else>
                  <th></th>
                  </g:else>
      </tr> 
      <tr> 
      <th>Appel à Compétences</th> 
                  <g:if test="${(labelisationProjetInstance.etapePorteur==3 || labelisationProjetInstance.etapePorteur >3) && (labelisationProjetInstance.etapeBp==6 || labelisationProjetInstance.etapeBp>6)}">
                <th>validé</th>
                  </g:if>
                  <g:else>
                  <th></th>
                  </g:else>
      </tr> 
      <tr> 
      <th>Résultats d'évaluation</th> 
                  <g:if test="${(labelisationProjetInstance.etapePorteur==3 || labelisationProjetInstance.etapePorteur >3) && (labelisationProjetInstance.etapeBp==7 || labelisationProjetInstance.etapeBp>7)}">
                <th>validé</th>
                  </g:if>
                  <g:else>
                  <th></th>
                  </g:else>
      </tr> 
      <tr> 
      <th>Validation VGA(Grille analyse consolidée)</th> 
                  <g:if test="${(labelisationProjetInstance.etapePorteur==4 || labelisationProjetInstance.etapePorteur >4) && (labelisationProjetInstance.etapeBp==7 || labelisationProjetInstance.etapeBp>7)}">
                <th>validé</th>
                  </g:if>
                  <g:else>
                  <th></th>
                  </g:else>
      </tr> 
      <tr> 
      <th>Décision Comex</th> 
                  <g:if test="${(labelisationProjetInstance.etapePorteur==5 || labelisationProjetInstance.etapePorteur >5) && (labelisationProjetInstance.etapeBp==8 || labelisationProjetInstance.etapeBp>8)}">
                <th>validé</th>
                  </g:if>
                  <g:else>
                  <th></th>
                  </g:else>
      </tr> 
     </g:if>

                   
            </tbody>
          </table>
        </div>
      <div class="well">
<!--          <g:link action="telechargerdocs" id="${labelisationProjetInstance.id}"><input type="button" value="Telecharger Docs" style="color:red;"/></g:link>-->
          <g:if test="${((labelisationProjetInstance.etapePorteur==5 && labelisationProjetInstance.etapeBp==8)|| (labelisationProjetInstance.etatProjet=='rejet') || (labelisationProjetInstance.etatProjet=='redirection'))}">
          <g:link action="create" id="${labelisationProjetInstance.id}"><input type="button" value="Visualiser le Workflow" style="color:red;"/></g:link>
        </g:if>
                  <g:else>
                   <g:link action="create" id="${labelisationProjetInstance.id}"><input type="button" value="Continuer process" style="color:red;"/></g:link>
                  </g:else>
      </div>
        
    </div>
  </body>

</html>