<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<fmt:setLocale value="en_US" scope="request" />
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Management Console</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="author" content="" />
<link rel="shortcut icon" href="${staticXUiTemplatePathLocation}/images/favicon.ico">

<!-- X-Console CSS -->
<link rel="stylesheet" type="text/css" href="${staticXUiTemplatePathLocation}/css/style.css" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="${staticBlistrapPathLocation}/stylesheets/vendor/bootstrap.min.css">
<!-- Optional theme -->
<link rel="stylesheet" href="${staticBlistrapPathLocation}/stylesheets/vendor/font-awesome.min.css">

<!-- Our custom CSS -->
<link href="${staticBlistrapPathLocation}/stylesheets/blistrap.css"	media="screen" rel="stylesheet" type="text/css" />
<link href="${staticBlistrapPathLocation}/stylesheets/docs.css"	media="screen" rel="stylesheet" type="text/css" />
<link href="${staticBlistrapPathLocation}/js/vendor/swal/sweet-alert.css"    media="screen" rel="stylesheet" type="text/css" />
<!-- Beirut custom CSS -->
<link href="${applicationBasePathLocation}/resources/assets/css/beirutMainSytle.css"	media="screen" rel="stylesheet" type="text/css" />

<!--Vendor Css -->
<link href="${staticBlistrapPathLocation}/js/vendor/ivh.treeview/ivh-treeview.min.css"	media="screen" rel="stylesheet" type="text/css" />
<!-- Vendor: Angular-->
<script src="${staticBlistrapPathLocation}/js/vendor/jquery.min.js"></script>
<script src="${staticBlistrapPathLocation}/js/vendor/bootstrap.min.js"></script>
<script	src="${staticBlistrapPathLocation}/js/vendor/angular.js"></script>
<script	src="${staticBlistrapPathLocation}/js/vendor/angular-resource.js"></script>

<script type="text/javascript">
    var applicationBasePathLocation = '${applicationBasePathLocation}';
</script>

</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/tags/navbar.jsp" />
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<c:if test="${!empty errorMessage}">
						<div class="row alert alert-danger">
							<div class="col-md-10">
								<c:out value="${errorMessage}" />
							</div>
							<div class="col-md-2">
								<button type="button" class="close pull-right" id="closeAlert"
									onclick="closeBar(this.id);">
									<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
								</button>
							</div>
						</div>
					</c:if>
					<decorator:body />
				</div>
			</div>
			<!--/col-->
		</div>
		<!--/row-->
	</div>
	<c:import url="/WEB-INF/tags/footer.jsp" />
  <!-- Vendor: Javascripts -->

  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/ui-bootstrap.tpls.js"></script>
  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/ui-bootstrap.datetimepicker.js"></script>
  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/prism.js"></script>
  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/angular-ui-tinymce.js"></script>
  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/tinymce/tinymce.min.js"></script>
  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/ivh.treeview/ivh-treeview.js"></script>
  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/angular-dragdrop.min.js"></script>
  <script type="text/javascript" src="${staticBlistrapPathLocation}/js/vendor/swal/sweet-alert.min.js"></script>



  <!-- Our custom Javascripts -->
  <script src="${staticBlistrapPathLocation}/js/blistrap.js"></script>
  <script src="${staticBlistrapPathLocation}/js/docs.js"></script>

	<script type="text/javascript">
		function closeBar(id) {
			document.getElementById(id).parentNode.parentNode.remove();
		}
	</script>
</body>
</html>
