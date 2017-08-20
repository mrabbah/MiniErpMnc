<%@ page import="com.rabbahsoft.mnc.LabelisationProjet" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="datatable" content="DATATABLE" />  
    <meta name="commun" content="COMMUN" />  
    <meta name="form" content="FORM" />  
    <meta name="extendedform" content="EXTENDEDFORM" />  
    <meta name="layout" content="main"/>
  <g:javascript src="jquery.js" />
<g:javascript src="jquery-ui.min.js" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Load jQuery UI Main JS  -->
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <g:javascript src="gebo_validation.js" />
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
        Projet : ${labelisationProjetInstance.nomProjet}
      </div>
      <div class="w-box-content cnt_a">
        <g:if test="${session.profil=='porteur'}">
          <div class="tabbable tabbable-bordered">
            <ul class="nav nav-tabs">
              <g:if test="${etapePorteur==0 || etapePorteur==1 || etapePorteur >1}">
                <li class="${etapePorteur==0 || etapePorteur==1 ? "active" : ""}"><a href="#tab_br1" data-toggle="tab"><span class="label label-success">1-Infos Projet </span></a></li>
              </g:if>
              <g:if test="${((etapePorteur==2 || etapePorteur >2) && labelisationProjetInstance.etatProjet!='rejete')}">
                <li class="${etapePorteur==2 ? "active" : ""}"><a href="#tab_br2" data-toggle="tab"><span class="label label-success">2-Recevabilité </span></a></li>
              </g:if>
              <g:if test="${etapePorteur==3 || etapePorteur >3}">
                <li class="${etapePorteur==3 ? "active" : ""}"><a href="#tab_br3" data-toggle="tab"><span class="label label-success">3-Pitch CT </span></a></li>
              </g:if>
              <g:if test="${etapePorteur==4 || etapePorteur >4}">
                <li class="${etapePorteur==4 ? "active" : ""}"><a href="#tab_br4" data-toggle="tab"><span class="label label-success">4-Evaluation CT </span></a></li>
              </g:if>
              <g:if test="${etapePorteur==5 || etapePorteur >5}">
                <li class="${etapePorteur==5 || etapePorteur==6 ? "active" : ""}"><a href="#tab_br5" data-toggle="tab"><span class="label label-success">5-Labellisation COMEX </span></a></li>
              </g:if>
<!--              <g:if test="${etapePorteur==6 || etapePorteur >6}">
                <li class="${etapePorteur==6 ? "active" : ""}"><a href="#tab_br6" data-toggle="tab"><span class="label label-success">6-Administration</span></a></li>
              </g:if>-->
               <g:if test="${etapePorteur==10 || etapePorteur >10}">
                <li class="${etapePorteur==10 || etapePorteur==100? "active" : ""}"><a href="#tab_br6" data-toggle="tab"><span class="label label-success">6-Administration</span></a></li>
              </g:if>
            </ul>
            <div class="tab-content">
              <g:if test="${etapePorteur==0 || etapePorteur==1 || etapePorteur >1}">
                <div class="${etapePorteur==0 || etapePorteur==1 ? "tab-pane active" : "tab-pane"}" id="tab_br1">
                  <g:render template="form1Porteur"/>
                </div>
              </g:if>
              <g:if test="${etapePorteur==2 || etapePorteur >2 }">
                <div class="${etapePorteur==2 ? "tab-pane active" : "tab-pane"}" id="tab_br2">
                  <g:render template="form2Porteur"/>  
                </div>
              </g:if>
              <g:if test="${etapePorteur==3 || etapePorteur >3 }">
                <div class="${etapePorteur==3 ? "tab-pane active" : "tab-pane"}" id="tab_br3">
                  <g:render template="form3Porteur"/>  
                </div>
              </g:if>
              <g:if test="${etapePorteur==4 || etapePorteur >4 }">
                <div class="${etapePorteur==4 ? "tab-pane active" : "tab-pane"}" id="tab_br4">
                  <g:render template="form4Porteur"/>  
                </div>
              </g:if>
              <g:if test="${etapePorteur==5 || etapePorteur >5 }">
                <div class="${etapePorteur==5 || etapePorteur==6 ? "tab-pane active" : "tab-pane"}" id="tab_br5">
                  <g:render template="form5Porteur"/>  
                </div>
              </g:if>
            </div>
          </div>
        </g:if>
        <g:else>
          <div class="tabbable tabbable-bordered">
            <ul class="nav nav-tabs">
              <g:if test="${etapeBp==1 || etapeBp >1}">
                <li class="${etapeBp==1 ? "active" : ""}"><a href="#tab_br1" data-toggle="tab"><span class="label label-success">1-Infos Projet</span></a></li>
              </g:if>
              <g:if test="${etapeBp==2 || etapeBp >2}">
                <li class="${etapeBp==2 ? "active" : ""}"><a href="#tab_br2" data-toggle="tab"><span class="label label-success">2-Recevabilité </span></a></li>
              </g:if>
              <g:if test="${etapeBp==3 || etapeBp >3}">
                <li class="${etapeBp==3 ? "active" : ""}" ><a href="#tab_br3" data-toggle="tab"><span class="label label-success">3-Pitch CT </span></a></li>
              </g:if>
              <g:if test="${etapeBp==4 || etapeBp >4}">
                <li class="${etapeBp==4 ? "active" : ""}"><a href="#tab_br4" data-toggle="tab"><span class="label label-success">4-Accusé de réception </span></a></li>
              </g:if>
              <g:if test="${etapeBp==5 || etapeBp >5}">
                <li class="${etapeBp==5 ? "active" : ""}"><a href="#tab_br5" data-toggle="tab"><span class="label label-success">5-Appel à compétences </span></a></li>
              </g:if>
              <g:if test="${etapeBp==6 || etapeBp >6}">
                <li class="${etapeBp==6 ? "active" : ""}"><a href="#tab_br6" data-toggle="tab"><span class="label label-success">6-Résultat d'évaluation </span></a></li>
              </g:if>
              <g:if test="${etapeBp==7 || etapeBp >7}">
                <li class="${etapeBp==7 ? "active" : ""}"><a href="#tab_br7" data-toggle="tab"><span class="label label-success">7-Réunion VGAC </span></a></li>
              </g:if>
              <g:if test="${etapeBp==8 || etapeBp >8}">
                <li class="${etapeBp==8 ? "active" : ""}"><a href="#tab_br8" data-toggle="tab"><span class="label label-success">8-Décision COMEX </span></a></li>
              </g:if>
            </ul>
            <div class="tab-content">
              <g:if test="${etapeBp==1 || etapeBp >1}">
                <div class="${etapeBp==1 ? "tab-pane active" : "tab-pane"}" id="tab_br1">
                  <g:render template="form1Porteur"/>
                </div>
              </g:if>
              <g:if test="${etapeBp==2 || etapeBp >2}">
                <div class="${labelisationProjetInstance.etape.code!="refuse" && labelisationProjetInstance.etape.code!="labelise" && etapeBp==2 ? "tab-pane active" : "tab-pane"}" id="tab_br2">
                  <g:render template="form1Bp"/>
                </div>
              </g:if>
              <g:if test="${etapeBp==3 || etapeBp >3}">
                <div class="${labelisationProjetInstance.etape.code!="refuse" && labelisationProjetInstance.etape.code!="labelise" && etapeBp==3 ? "tab-pane active" : "tab-pane"}" id="tab_br3">
                  <g:render template="form2Bp"/>  
                </div>
              </g:if>
              <g:if test="${etapeBp==4 || etapeBp >4}">
                <div class="${etapeBp==4 ? "tab-pane active" : "tab-pane"}" id="tab_br4">
                  <g:render template="form3Bp"/>  
                </div>
              </g:if>
              <g:if test="${etapeBp==5 || etapeBp >5}">
                <div class="${etapeBp==5 ? "tab-pane active" : "tab-pane"}" id="tab_br5">
                  <g:render template="form4Bp"/>  
                </div>
              </g:if>
              <g:if test="${etapeBp==6 || etapeBp >6}">
                <div class="${etapeBp==6 ? "tab-pane active" : "tab-pane"}" id="tab_br6">
                  <g:render template="form5Bp"/>  
                </div>
              </g:if>
              <g:if test="${etapeBp==7 || etapeBp >7}">
                <div class="${etapeBp==7 ? "tab-pane active" : "tab-pane"}" id="tab_br7">
                  <g:render template="form6Bp"/>  
                </div>
              </g:if>
              <g:if test="${etapeBp==8 || etapeBp >8}">
                <div class="${etapeBp==8 || etapeBp==12? "tab-pane active" : "tab-pane"}" id="tab_br8">
                  <g:render template="form7Bp"/>  
                </div>
              </g:if>
            </div>
          </div>
        </g:else>
      </div>
    </div>
  </div>
</body>

</html>
