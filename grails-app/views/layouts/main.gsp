<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><g:layoutTitle default="MINI ERP MNC"/></title>

    <!-- Bootstrap framework -->
    <link rel="stylesheet" href="${request.contextPath}/bootstrap/css/bootstrap.css" />
    <link rel="stylesheet" href="${request.contextPath}/bootstrap/css/bootstrap-responsive.css" />
  <g:if test="${ pageProperty(name:'meta.chat') }">
    <!-- jQuery UI theme-->
    <link rel="stylesheet" href="${request.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
  </g:if>
  <!-- breadcrumbs-->
  <link rel="stylesheet" href="${request.contextPath}/lib/jBreadcrumbs/css/BreadCrumb.css" />
  <!-- tooltips-->
  <link rel="stylesheet" href="${request.contextPath}/lib/qtip2/jquery.qtip.min.css" />
  <!-- notifications -->
  <link rel="stylesheet" href="${request.contextPath}/lib/sticky/sticky.css" />    
  <!-- code prettify -->
  <link rel="stylesheet" href="${request.contextPath}/lib/google-code-prettify/prettify.css" />    
  <!-- upload -->
  <link rel="stylesheet" href="${request.contextPath}/lib/upload/css/uploadfile.css" />
  <!-- notifications -->
  <link rel="stylesheet" href="${request.contextPath}/lib/sticky/sticky.css" />    
  <!-- splashy icons -->
  <link rel="stylesheet" href="${request.contextPath}/img/splashy/splashy.css" />
  <!-- datepicker -->
  <link rel="stylesheet" href="${request.contextPath}/lib/datepicker/datepicker.css" />
  <link rel="stylesheet" href="${request.contextPath}/lib/datepicker/bootstrap-datetimepicker.min.css" />
  <!-- tag handler -->
  <link rel="stylesheet" href="${request.contextPath}/lib/tag_handler/css/jquery.taghandler.css" />
  <!-- nice form elements -->
  <link rel="stylesheet" href="${request.contextPath}/lib/uniform/Aristo/uniform.aristo.css" />
  <!-- multiselect -->
  <link rel="stylesheet" href="${request.contextPath}/lib/multi-select/css/multi-select.css" />
  <!-- enhanced select -->
  <link rel="stylesheet" href="${request.contextPath}/lib/chosen/chosen.css" />
  <!-- upload -->
  <link rel="stylesheet" href="${request.contextPath}/lib/plupload/js/jquery.plupload.queue/css/plupload-gebo.css" />
  <!-- colorbox -->
  <link rel="stylesheet" href="${request.contextPath}/lib/colorbox/colorbox.css" />  
  <!-- stepy -->
  <link rel="stylesheet" href="${request.contextPath}/lib/stepy/css/jquery.stepy.css" />  
  <!-- colorpicker -->
  <link rel="stylesheet" href="${request.contextPath}/lib/colorpicker/css/colorpicker.css" />	
  <!-- toggle buttons -->
  <link rel="stylesheet" href="${request.contextPath}/lib/toggle_buttons/bootstrap-toggle-buttons.css" />
  <!-- datatables -->
  <link rel="stylesheet" href="${request.contextPath}/lib/datatables/extras/TableTools/media/css/TableTools.css">
  <g:if test="${ pageProperty(name:'meta.chat') }">
    <!-- CLEditor -->
    <link rel="stylesheet" href="${request.contextPath}/lib/CLEditor/jquery.cleditor.css" />
  </g:if>
  <!-- gebo color theme-->
  <link rel="stylesheet" href="${request.contextPath}/css/tamarillo.css" id="link_theme" />
  <!-- main styles -->
  <link rel="stylesheet" href="${request.contextPath}/css/style.css" />

  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=PT+Sans" />

  <!-- Favicon -->
  <link rel="shortcut icon" href="${request.contextPath}/favicon.ico" />

  <!--[if lte IE 8]>
      <link rel="stylesheet" href="${request.contextPath}/css/ie.css" />
      <script src="${request.contextPath}/js/ie/html5.js"></script>
                  <script src="${request.contextPath}/js/ie/respond.min.js"></script>
  <![endif]-->
  <script>
      //* hide all elements & show preloader
      document.documentElement.className += 'js';
  </script>
  <r:layoutResources />
</head>
<body>
  <div id="loading_layer" style="display:none"><img src="${request.contextPath}/img/ajax_loader.gif" alt="" /></div>
<g:render template="/layouts/styles" />
<div id="maincontainer" class="clearfix">

  <!-- header -->
  <g:render template="/layouts/header"/>

  <!-- main content -->
  <g:render template="/layouts/content"/>

  <!-- sidebar -->
  <g:render template="/layouts/sidebar"/>        

  <g:if test="${ pageProperty(name:'meta.commun') }">
    <script src="${request.contextPath}/js/jquery.min.js"></script>
    <script src="${request.contextPath}/js/jquery-migrate.min.js"></script>
    <!-- smart resize event -->
    <script src="${request.contextPath}/js/jquery.debouncedresize.min.js"></script>
    <!-- hidden elements width/height -->
    <script src="${request.contextPath}/js/jquery.actual.min.js"></script>
    <!-- js cookie plugin -->
    <script src="${request.contextPath}/js/jquery_cookie.min.js"></script>
    <!-- main bootstrap js -->
    <script src="${request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    <!-- bootstrap plugins -->
    <script src="${request.contextPath}/js/bootstrap.plugins.min.js"></script>
    <!-- tooltips -->
    <script src="${request.contextPath}/lib/qtip2/jquery.qtip.min.js"></script>
    <!-- jBreadcrumbs -->
    <script src="${request.contextPath}/lib/jBreadcrumbs/js/jquery.jBreadCrumb.1.1.min.js"></script>
    <!-- sticky messages -->
    <script src="${request.contextPath}/lib/sticky/sticky.min.js"></script>        
    <!-- fix for ios orientation change -->
    <script src="${request.contextPath}/js/ios-orientationchange-fix.js"></script>
    <!-- scrollbar -->
    <script src="${request.contextPath}/lib/antiscroll/antiscroll.js"></script>
    <script src="${request.contextPath}/lib/antiscroll/jquery-mousewheel.js"></script>
    <!-- lightbox -->
    <script src="${request.contextPath}/lib/colorbox/jquery.colorbox.min.js"></script>
    <!-- mobile nav -->
    <script src="${request.contextPath}/js/selectNav.js"></script>
    <!-- common functions -->
    <script src="${request.contextPath}/js/gebo_common.js"></script>
  </g:if>

  <g:if test="${ pageProperty(name:'meta.datatable') }">
    <!-- datatable -->
    <script src="${request.contextPath}/lib/datatables/jquery.dataTables.min.js"></script>
    <script src="${request.contextPath}/lib/datatables/extras/Scroller/media/js/dataTables.scroller.min.js"></script>
    <!-- datatable table tools -->
    <script src="${request.contextPath}/lib/datatables/extras/TableTools/media/js/TableTools.min.js"></script>
    <script src="${request.contextPath}/lib/datatables/extras/TableTools/media/js/ZeroClipboard.js"></script>
    <!-- datatables bootstrap integration -->
    <script src="${request.contextPath}/lib/datatables/jquery.dataTables.bootstrap.min.js"></script>
    <!-- datatable functions -->
    <script src="${request.contextPath}/js/gebo_datatables.js"></script>
      </g:if>

  <g:if test="${ pageProperty(name:'meta.form') }">
    <!-- autosize textareas -->
    <script src="${request.contextPath}/js/forms/jquery.autosize.min.js"></script>
    <!-- enhanced select -->
    <script src="${request.contextPath}/lib/chosen/chosen.jquery.min.js"></script>
  </g:if>
  <g:if test="${pageProperty(name:'meta.extendedform') }">
    <!-- globalize for jQuery UI-->
    <script src="${request.contextPath}/lib/jquery-ui/external/globalize.js"></script>
    <!-- touch events for jquery ui-->
    <script src="${request.contextPath}/js/forms/jquery.ui.touch-punch.min.js"></script>
    <!-- masked inputs -->
    <script src="${request.contextPath}/js/forms/jquery.inputmask.min.js"></script>
    <!-- textarea limiter/counter -->
    <script src="${request.contextPath}/js/forms/jquery.counter.min.js"></script>
    <!-- datepicker -->
    <script src="${request.contextPath}/lib/datepicker/bootstrap-datepicker.min.js"></script>
    <script src="${request.contextPath}/lib/datepicker/bootstrap-datetimepicker.min.js"></script>
    <!-- timepicker -->
    <script src="${request.contextPath}/lib/datepicker/bootstrap-timepicker.min.js"></script>
    <!-- tag handler -->
    <script src="${request.contextPath}/lib/tag_handler/jquery.taghandler.min.js"></script>
    <!-- tags input -->
    <link rel="stylesheet" href="${request.contextPath}/lib/tagsinput/app.css" />  

    <!-- styled form elements -->
    <script src="${request.contextPath}/lib/uniform/jquery.uniform.min.js"></script>
    <!-- animated progressbars -->
    <script src="${request.contextPath}/js/forms/jquery.progressbar.anim.js"></script>
    <!-- multiselect -->
    <script src="${request.contextPath}/lib/multi-select/js/jquery.multi-select.js"></script>
    <script src="${request.contextPath}/lib/multi-select/js/jquery.quicksearch.js"></script>
    <!-- TinyMce WYSIWG editor -->
    <script src="${request.contextPath}/lib/tiny_mce/jquery.tinymce.js"></script>
    <script src="${request.contextPath}/lib/tiny_mce/tiny_mce.js"></script>
    <!-- plupload and all it's runtimes and the jQuery queue widget (attachments) -->
    <script type="text/javascript" src="${request.contextPath}/lib/plupload/js/plupload.full.js"></script>
    <script type="text/javascript" src="${request.contextPath}/lib/plupload/js/jquery.plupload.queue/jquery.plupload.queue.full.js"></script>
    <!-- colorpicker -->
    <script src="${request.contextPath}/lib/colorpicker/bootstrap-colorpicker.js"></script>
    <!-- password strength checker -->
    <script src="${request.contextPath}/lib/complexify/jquery.complexify.min.js"></script>
    <!-- toggle buttons -->
    <script src="${request.contextPath}/lib/toggle_buttons/jquery.toggle.buttons.js"></script>            
    <script src="${request.contextPath}/js/forms/jquery.spinners.min.js"></script>            
    <!-- form functions -->
    <script src="${request.contextPath}/js/gebo_forms.js"></script>
    <script src="${request.contextPath}/js/valideretape1.js"></script>
    <!-- form functions -->
     <script src="${request.contextPath}/lib/upload/js/jquery.uploadfile.js"></script>
    <script src="${request.contextPath}/lib/validation/jquery.validate.js"></script>
    <script src="${request.contextPath}/lib/validation/additional-methods.js"></script>
    <script src="${request.contextPath}/js/gebo_validation.js"></script>
    <script src="${request.contextPath}/js/delete_muti_utilisateur.js"></script>
  </g:if>

  <g:if test="${ pageProperty(name:'meta.edituser') }">
    <!-- user profile functions -->
    <script src="${request.contextPath}/js/gebo_user_profile.js"></script> 
  </g:if>


  <g:if test="${ pageProperty(name:'meta.chat') }">
    <!-- CLEditor -->
    <script src="${request.contextPath}/lib/CLEditor/jquery.cleditor.js"></script>
    <script src="${request.contextPath}/lib/CLEditor/jquery.cleditor.icon.min.js"></script>
    <!-- date library -->
    <script src="${request.contextPath}/lib/moment_js/moment.min.js"></script>
    <!-- chat functions -->
    <script src="${request.contextPath}/js/gebo_chat.js"></script>
  </g:if>
  <script src="${request.contextPath}/js/tacheedit.js"></script>
  <script src="${request.contextPath}/js/application.js"></script>           
</div>
<script>
            $(document).ready(function() {
//* show all elements & remove preloader
setTimeout('$("html").removeClass("js")',1000);    
});
</script> 
<r:layoutResources /> 
</body>
</html>

