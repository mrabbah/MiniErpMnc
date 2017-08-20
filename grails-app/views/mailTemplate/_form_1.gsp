<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<div class="row-fluid">
  <div class="control-group">
<!--    <div class="span2"><label for="code" class="control-label"><g:message code="mailTemplate.code.label" default="Code" /><span class="required-indicator">* :</span></label></div>-->
    <div class="span1"><label for="code" class="control-label"><g:message code="mailTemplate.code.label" default="Code" />:</label></div>
    <div class="span11"><g:textField class="form-control" name="code" readonly value="${mailTemplateInstance?.code}"  /></div>		
  </div>

<div class="control-group">
  <div class="span2"><label for="description" class="control-label"><g:message code="mailTemplate.description.label" default="Description" />:</label></div>
  <div class="span8"><g:textArea class="form-control" cols="120" rows="10" name="description" value="${mailTemplateInstance?.description}" rows="5" style="width: 98% !important;" /></div>						
</div>

<div class="control-group">
  <div class="span2"><label for="template" class="control-label"><g:message code="mailTemplate.template.label" default="Template" />:<span class="f_req">*</span></label></div>
  <div class="span8">
    <textarea name="template" id="template" class="form-control" cols="120" rows="10" required style="width: 98% !important;">${mailTemplateInstance?.template}</textarea>
  </div>
</div>
</div>


