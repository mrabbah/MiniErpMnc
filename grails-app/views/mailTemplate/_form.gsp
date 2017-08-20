<%@ page import="com.rabbahsoft.mnc.MailTemplate" %>
<div class="row-fluid">
  <div class="control-group">
<!--    <div class="span2"><label for="code" class="control-label"><g:message code="mailTemplate.code.label" default="Code" /><span class="required-indicator">* :</span></label></div>-->
    <div class="span2"><label for="code" class="control-label"><g:message code="mailTemplate.code.label" default="Code" /><span class="f_req">*</span></label></div>
    <div class="span9"><g:textField class="form-control" name="code" required value="${mailTemplateInstance?.code}"  /></div>		
  </div>

<div class="control-group">
  <div class="span2"><label for="description" class="control-label"><g:message code="mailTemplate.description.label" default="Description" />:</label></div>
  <div class="span8"><g:textArea class="form-control" cols="60" rows="3" name="description" value="${mailTemplateInstance?.description}" rows="5" style="width: 98% !important;" /></div>						
</div>

<div class="control-group">
  <div class="span2"><label for="template" class="control-label"><g:message code="mailTemplate.template.label" default="Template" />:<span class="f_req">*</span></label></div>
  <div class="span8">
<!--    <textarea name="template" id="template" class="tinycme" cols="30" rows="10" required >${mailTemplateInstance?.template}</textarea>  -->
    <textarea name="template" id="template" class="form-control" cols="60" rows="10" required style="width: 98% !important;">${mailTemplateInstance?.template}</textarea>
  </div>
</div>
</div>


