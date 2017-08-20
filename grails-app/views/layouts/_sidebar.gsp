<a href="javascript:void(0)" class="sidebar_switch on_switch ttip_r" title="Hide Sidebar">Sidebar switch</a>

<div class="sidebar">
  <div class="antiScroll">
    <div class="antiscroll-inner">
      <div class="antiscroll-content">
        <div class="sidebar_inner">
          <div id="side_accordion" class="accordion" style="color:#4d394b">
            <g:if test="${session.profil=="porteur"}">
               <div class="accordion-group">
              </div>
              <g:if test="${session.profil=="porteur"}">
              <div class="accordion-group">
<!--                <div class="accordion-heading">
                  <a href="#collapseTen" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                    <i class="icon-list-alt"></i> Labellisation des projets
                  </a>
                </div>-->
                <div class="${params.controller=='labelisationProjet' ? 'accordion-body collapse in' : 'accordion-body collapse'}" id="collapseTen">
                  <div class="accordion-inner">
<!--                    <ul class="nav nav-list">
                      <g:if test="${session.profil=="porteur"}">
                      <li class="${params.controller=="labelisationProjet" && params.rejete==null && params.encours==null && params.labelise==null ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/create">Nouveau projet</a></li>
                      </g:if>
                      
                      <li class="${params.controller=="labelisationProjet" && params.encours=="true" ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list_projet?encours=true">Mes projets en cours</a></li>
                      <li class="${params.controller=="labelisationProjet" && params.labelise=="true" ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list_projet?labelise=true">Mes projets labellisés</a></li>
                      <li class="${params.controller=="labelisationProjet" && params.rejete=="true" ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list_projet?rejete=true">Mes projets rejetés</a></li>
                    </ul>-->
                    
                    <ul class="nav nav-list">

                      <g:if test="${session.profil=="porteur"}">
                      <li class="${params.controller=="labelisationProjet" && params.rejete==null && params.encours==null && params.labelise==null && params.redireger==null && params.action=="create"? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/create">Nouveau projet </a></li>
                      <li>
                      </li>
                      </g:if>
                    <li class="divider">|</li>
                      <li class="${params.controller=="labelisationProjet" && (params.encours=="true" || params.action=="list_projet") ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list_projet?encours=true">Mes projets en cours</a></li>
                      <li class="${params.controller=="labelisationProjet" && (params.labelise=="true" || params.action=="list_projet_labelise") ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list_projet_labelise?labelise=true">Mes projets labellisés</a></li>
                      <li class="${params.controller=="labelisationProjet" && (params.rejete=="true" || params.action=="list_projet_rejete")? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list_projet_rejete?rejete=true">Mes projets rejetés</a></li>
                   
<!--                      ajouter pour les projets reaudition ou redirection-->

                 <li class="${params.controller=="labelisationProjet" && (params.reauditionne=="true" || params.action=="list_projet_reauditionne")? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list_projet_reauditionne?reauditionne=true">Mes projets réauditionnés</a></li>                      
                 <li class="${params.controller=="labelisationProjet" && (params.redireger=="true" || params.action=="list_projet_redireger")? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list_projet_redireger?redireger=true">Mes projets redirigés</a></li>                       

                      </ul>
                    
                    
                    
                  </div>
                </div>
              </div>
                
              
              
               </g:if>

            </g:if>
            <g:else>
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a href="#collapseTwo" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                    <i class="icon-wrench"></i> Paramétrage
                  </a>
                </div>
                <div class="${params.controller=='utilisateur' || params.controller=='comiteThematique' || params.controller=='profil' || params.controller=='cluster' || params.controller=='mailTemplate' || params.controller=='document' ? 'accordion-body collapse in' : 'accordion-body collapse'}" id="collapseTwo">
                  <div class="accordion-inner">
                    <ul class="nav nav-list">
                      <li class="${params.controller == 'utilisateur' ? "active" : ""}"><a href="${request.contextPath}/utilisateur/">Gestion des utilisateurs</a></li>
                      <li class="${params.controller == 'profil' ? "active" : ""}"><a href="${request.contextPath}/profil/">Gestion des profils</a></li>                          
                      <li class="${params.controller == 'comiteThematique' ? "active" : ""}"><a href="${request.contextPath}/comiteThematique/">Gestion des comités thématiques</a></li>                          
<!--                      <li class="${params.controller == 'cluster' ? "active" : ""}"><a href="${request.contextPath}/cluster/">Gestion des Clusters</a></li>                          -->
                      <li class="${params.controller == 'mailTemplate' ? "active" : ""}"><a href="${request.contextPath}/mailTemplate/">Gestion des templates</a></li>                          
<!--                      <li class="${params.controller == 'document' && params.action == 'index'? "active" : ""}"><a href="${request.contextPath}/document/">Gestion des documents</a></li> -->
                      <li class="${params.controller == 'document' && params.action == 'index'? "active" : ""}"><a href="${request.contextPath}/document/Kitdocument">Gestion des documents</a>
                       <ul>
                       <li><a href="${request.contextPath}/document/Kitporteur">Kit Porteur de Projet</a></li> 
                       <li><a href="${request.contextPath}/document/Kitevaluateur">Kit évaluateur</a></li> 
                       </ul>
                      </li> 
                    </ul>
                  </div>
                </div>
              </div>
              <div class="accordion-group">
                <div class="accordion-body collapse" id="collapseFour">
                  <div class="accordion-inner">
                    <ul class="nav nav-list">
                      <li><a href="#">Statistiques</a></li>
                      <li><a href="#">Vue calendrier</a></li>
                    </ul>
                  </div>
                </div>
              </div>  
             
              
              
            </g:else>
<!--            <g:if test="${session.profil=="porteur"}">
              <div class="accordion-group">
                <div class="accordion-heading">
                  <a href="#collapseTwo" data-parent="#side_accordion" data-toggle="collapse" class="accordion-toggle">
                    <i class="icon-wrench"></i> Télécharger Kit Labellisation
                  </a>
                </div>
                <div class="${params.controller=='utilisateur' || params.controller=='comiteThematique' || params.controller=='profil' || params.controller=='cluster' || params.controller=='mailTemplate' || params.controller=='document' ? 'accordion-body collapse in' : 'accordion-body collapse'}" id="collapseTwo">
                  <div class="accordion-inner">
                    <ul class="nav nav-list">
                      <g:if test="${session.grilleanalyse!=null && session.grilleanalyse!='null' && session.grilleanalyse!=''}">
                      <li ><a href="${session.grilleanalyse}">Grille d'évaluation</a></li>
                      </g:if>
                      <g:else>
                        <li ><a href="#">Grille d'évaluation vide</a></li>
                        </g:else> 
<g:if test="${session.fichetechnique!=null && session.fichetechnique!='null' && session.fichetechnique!=''}">
                      <li ><a href="${session.fichetechnique}">Fiche Technique</a></li>                          
                      </g:if>
                      <g:else>  
                      <li ><a href="#">Fiche Technique vide</a></li> 
                      </g:else>
                    </ul>
                  </div>
                </div>
              </div>
                                  </g:if>-->

            
            
          </div>

          <div class="push"></div>
        </div>
      </div>
      
<!--      ajouter recement-->
      <div id="footer" style="position: absolute;left: 0;bottom: 50px;">
       <a href="#"><g:img dir="images" file="mnc_220.jpg" width="300%" height="200"/></a>
    </div>  
 <!--      fin ajouter recement-->     
      
    </div>
  </div>
</div>