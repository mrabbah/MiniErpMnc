
<%@ page import="com.rabbahsoft.securite.Utilisateur" %>
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
   <g:set var="context1" value="${request.contextPath}" />
  <div class="not_sortable">
    <div class="w-box">
      <div class="w-box-header">
        Gestion des utilisateurs
      </div>
      <div class="w-box-content cnt_a">
        <g:render template="nav"/>
        <table class="table table-striped table-bordered dTableR">
          <thead>
            <tr>
              <th><span class="glyphicon glyphicon-search" aria-hidden="true"></span></th>
              <th><span class="glyphicon glyphicon-search" aria-hidden="true"></span></th>
              <g:sortableColumn property="login" title="login"/>
              <th>Profil</th>
              <th>Nom</th>
              <th>Prénom</th>
              <th>GSM</th>
              <th>Email</th>
<!--              <th>Activé</th>-->
            </tr>
          </thead>
          <tbody>
          <g:each var="user" in="${utilisateurInstanceList}">
            <tr>
              <td><a href="#" onclick="validercandidat1('${user.id}','${context1}');" ><i class="icon-remove-sign" ></i></td>
              <td><a href="${request.contextPath}/utilisateur/edit/${user.id}"><i class="icon-pencil"></i></a></td>
<!--              <td class="value"><input type="checkbox" name="idcandidat[]" id="${user.id}" value="${user.id}"  />${user.id}</td>-->
            <g:if test="${session.droits.VISUALISER_UTILISATEUR != null}">
              <td>${user.login}</td>
            </g:if>
            <g:else>
              <td>${user.login}</td>
            </g:else>
            <td>${user.profil.description}</td>
            <td>${user.nom}</td>
            <td>${user.prenom}</td>
            <td>${user.gsm}</td>
            <td>${user.email}</td>
<!--            <g:if test="${user.active}">
              <td><span class="label label-success">Oui</span></td>
</g:if>
<g:else>
              <td><span class="label label-info">NON</span></td>   
</g:else>-->
            </tr>         
          </g:each>                                             
          </tbody>
        </table>
        <bs:paginate total="${utilisateurInstanceCount}" />
      </div>
      <span class="countcandidat">Nombre total : ${utilisateurInstanceCount}</span>
    </div>
  </div>
  <script type="text/javascript">
    
    function validercandidat1(val,val1) {
    if( confirm('Vous etes sur de vouloir supprimer cet utilisateur ?') ) 
    {
    
    $.post(val1+"/Utilisateur/delete_user",
    {
    id: val

    },
    function(data,status){
        location.reload();
    });
    }
    }
  </script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jquery.js"></script>
</body>

</html>