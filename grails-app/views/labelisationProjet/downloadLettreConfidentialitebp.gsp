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

      <div>
<!--        <div class="w-box-header" >
          Labellisation des projets 
        </div>-->
        <div>
          
          <ul>

                  
                <li >
                        <g:link action="downloadLettreConfidentialite1bp" >Télécharger la lettre confidetialite </g:link>
                        </br>
                        <g:link action="downloadfichetechniquepresentationdetaille" id="${params.id}">Télécharger la fiche+presentation+grilleanalyse </g:link>
                        </br>
                        <g:link action="downloadgrilleanalyse" id="${params.id}">Télécharger la grille analyse </g:link>
                    </li>
               
                
                </ul>
          
          
          
        </div>

      </div>
    
   <script src="js/delete_projet.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jquery.js"></script>
  </body>

</html>