
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
        Gestion des commités thematiques
      </div>
      <div class="w-box-content cnt_a">
        <g:render template="nav"/>
        <table class="table table-striped table-bordered dTableR">
          <thead>
            <tr>
              <th><span class="glyphicon glyphicon-search" aria-hidden="true"></span></th>
              <th><span class="glyphicon glyphicon-search" aria-hidden="true"></span></th>
              <g:sortableColumn property="code" title="code"/>
              <g:sortableColumn property="description" title="description"/>
            </tr>
          </thead>
          <tbody>
          <g:each var="commite" in="${ComiteThematiqueList}">
            <tr>
              <td><a href="#" onclick="validercandidat2('${commite.id}','${context1}');" ><i class="icon-remove-sign" ></i></td>
              <td><a href="${request.contextPath}/comiteThematique/edit/${commite.id}"><i class="icon-pencil"></i></a></td>
            <g:if test="${session.droits.VISUALISER_UTILISATEUR != null}">
              <td>${commite.code}</td>
            </g:if>
            <g:else>
              <td>${commite.code}</td>
            </g:else>
            <td>${commite.description}</td>
            </tr>         
          </g:each>                                             
          </tbody>
        </table>
        <bs:paginate total="${comiteThematiqueInstanceCount}" />
      </div>
      <span class="countcandidat">Nombre total : ${comiteThematiqueInstanceCount}</span>
    </div>
  </div>
  <script type="text/javascript">

    function validercandidat2(val,val1) {
    if( confirm('Vous etes sur de vouloir supprimer cette commite thematique?') ) 
    {
    
    $.post(val1+"/ComiteThematique/delete_committhematique",
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