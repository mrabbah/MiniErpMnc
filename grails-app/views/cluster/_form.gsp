<%@ page import="com.rabbahsoft.mnc.Cluster" %>
<div class="span12 formSep center">
  <div class="span2"><label><g:message code="comiteThematique.code.label" default="Code :" /></label></div>
  <div class="span3"><input type="text" id="code" name="code" class="span3" value="${clusterInstance?.code}" /></div>
  <div class="span1"></div>
  <div class="span2"><label><g:message code="comiteThematique.description.label" default="Description :" /></label></div>
  <div class="span3"><g:textField class="form-control" name="description" value="${clusterInstance?.description}"/></div>
</div>