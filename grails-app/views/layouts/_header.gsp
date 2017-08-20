<%@ page import="com.rabbahsoft.securite.Utilisateur" %>
<header>
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container-fluid">
              <g:if test="${session.profil=='porteur'}">
                <a class="brand" href="${request.contextPath}/labelisationProjet/list_projet?encours=true&head=vrai"><i class="icon-home icon-white"></i>Labellisez votre projet </a>
                </g:if>
               <g:if test="${session.profil=='BP'}">
                <a class="brand" href="${request.contextPath}/labelisationProjet/list_projet?global=true"><i class="icon-home icon-white"></i> </a>
                </g:if>
                <ul class="nav user_menu pull-right">
<!--                    <g:if test="${session.profil!="porteur"}">
                    <li class="hidden-phone hidden-tablet">
                        <div class="nb_boxes clearfix">
                            <a data-toggle="modal" data-backdrop="static" href="#myMail" class="label ttip_b" title="Nouveaux messages">25 <i class="splashy-mail_light"></i></a>
                            <a data-toggle="modal" data-backdrop="static" href="#myTasks" class="label ttip_b" title="Liste des tâches">10 <i class="splashy-calendar_week"></i></a>
                        </div>
                    </li>
                    </g:if>-->
                  
                  <g:if test="${session.profil=='porteur'}">
                <li class="dropdown">
                        <g:link action="downloadAlbum" >Télécharger le Kit </g:link>
<!--                        <g:link action="downloadLettreConfidentialite1bp" >Télécharger la lettre confidetialite </g:link>-->
<!--                        <g:link action="downloadfichetechniquepresentationdetaille" id="${params.id}">Télécharger la fiche+presentation+grilleanalyse </g:link>-->
<!--                        <g:link action="downloadgrilleanalyse" id="${params.id}">Télécharger la grille analyse </g:link>-->
                    </li>
                </g:if>
                  
                  
                  
                    <li class="divider-vertical hidden-phone hidden-tablet"></li>
                  <g:if test="${session.user!=null}">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">${session.user.nom} ${session.user.prenom} <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="${request.contextPath}/utilisateur/edit/${session.user.id}">Mon profil</a></li>
                            <li class="divider"></li>
                            <li><a href="${request.contextPath}/securite/logout">Log Out</a></li>
                        </ul>
                    </li>
                </g:if>
                </ul>
                <g:if test="${session.profil!="porteur"}">
<!--                <ul class="nav" id="mobile-nav">
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-wrench icon-white"></i> Paramétrage <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="${params.controller=="utilisateur" ? "active" : ""}"><a href="${request.contextPath}/utilisateur/">Gestion des utilisateurs</a></li>
                            <li class="${params.controller=="profil" ? "active" : ""}"><a href="${request.contextPath}/profil/">Gestion des profils</a></li>                      
                            <li class="${params.controller=="comiteThematique" ? "active" : ""}"><a href="${request.contextPath}/comiteThematique/">Gestion des comités thématiques</a></li>                      
                            <li class="${params.controller=="cluster" ? "active" : ""}"><a href="${request.contextPath}/cluster/">Gestion des clusters</a></li>                      
                        </ul>
                    </li>-->
<!--                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-list-alt icon-white"></i> Labélisation des formations <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li class="${params.controller=="formation" && params.encours=="true" ? "active" : ""}"><a href="${request.contextPath}/formation/index?encours=true">Formations en cours</a></li>
                            <li class="${params.controller=="formation" && params.labelise=="true" ? "active" : ""}"><a href="${request.contextPath}/formation/index?labelise=true">Formations labellisés</a></li>
                            <li class="${params.controller=="formation" && params.rejete=="true" ? "active" : ""}"><a href="${request.contextPath}/formation/index?rejete=true">Formations rejetés</a></li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-list-alt icon-white"></i> Labéllisation des projets<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                                    <li class="${params.controller=="labelisationProjet" && params.encours=="true" ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list?encours=true">Projets en cours</a></li>
                                    <li class="${params.controller=="labelisationProjet" && params.labelise=="true" ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list?labelise=true">Projets labellisés</a></li>
                                    <li class="${params.controller=="labelisationProjet" && params.rejete=="true" ? "active" : ""}"><a href="${request.contextPath}/labelisationProjet/list?rejete=true">Projets rejetés</a></li>
                        </ul>
                    </li>-->
<!--                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#"><i class="icon-th icon-white"></i> Tableau de bord <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Statistiques projets R&D</a></li>
                            <li><a href="#">Statistiques Formations</a></li>
                        </ul>
                    </li>                -->
<!--                </ul>-->
                </g:if>
            </div>
        </div>
    </div>
    <div class="modal hide fade" id="myMail" style="width: 700px">
        <div class="modal-header">
            <button class="close" data-dismiss="modal">×</button>
            <h3>Notifications</h3>
        </div>
        <div class="modal-body">
            <!--<div class="alert alert-info">Ahmed ezzahri vient de réctifier les coordonnées d'un partenaire.</div>-->
            <table class="table table-condensed table-striped" data-provides="rowlink">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Envoyé</th>
                        <th>Partenaire</th>                  
                        <th>Message</th>                  
                        <th></th>                  
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{message.dateMessage}</td>
                        <td>{message.utilisateur.nom}</td>
                        <td>{message.tache.contact}</td>
                        <td>Données binaires</td>
                        <td><a href="${request.contextPath}/tache/edit/20" class="btn btn-invert"><i class="splashy-bullet_blue_arrow"></i></a></td>
                    </tr>         
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="${request.contextPath}/tache/" class="btn">Voir toute la liste</a>
        </div>
    </div>
    <div class="modal hide fade" id="myTasks">
        <div class="modal-header">
            <button class="close" data-dismiss="modal">×</button>
            <h3>Nouvelles tâches</h3>
        </div>
        <div class="modal-body">
            <div class="alert alert-info">Vous devriez effectuez les missions suivantes.</div>
            <table class="table table-condensed table-striped" data-provides="rowlink">
                <thead>
                    <tr>
                        <th>id</th>
                        <th>Résumé</th>
                        <th>Partenaire</th>
                        <th>Date début</th>
                        <th>Priorité</th>
                        <th>Status</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{tache.id}</td>
                        <td>{tache.description}</td>
                        <td>{tache.contact}</td>
                        <td>{tache.dateDebutPrevue}</td>
                        <td class="tac"><span class="label label-warning">{tache.priorite}</span></td>
                        <td class="tac"><span class="label label-success">{tache.priorite}</span></td>
                        <td>{tache.status}</td>
                        <td><a href="${request.contextPath}/tache/edit/25" class="btn btn-invert"><i class="splashy-bullet_blue_arrow"></i></a></td>
                    </tr>         
                </tbody>
            </table>
        </div>
        <div class="modal-footer">
            <a href="${request.contextPath}/tache/" class="btn">Voir toute la liste</a>
        </div>
    </div>
</header>