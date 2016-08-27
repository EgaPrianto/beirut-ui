<!DOCTYPE html>
<html>
<head>
	<title>Page Not Available</title>
<link rel="stylesheet" href="${staticBlistrapPathLocation}/stylesheets/vendor/bootstrap.min.css">
<link rel="stylesheet" href="${staticBlistrapPathLocation}/stylesheets/blistrap.css">
</head>
<style type="text/css">
	body{
		background: #e5e5e5;
	}
	
	.error-title{
		font-size: 5em;
		color: #36B249;
		font-weight: 600;
		font-family: Helvetica, Arial, sans-serif;
		text-transform: uppercase;
		letter-spacing: 5px;
	}

	.detail-error{
		color: #36B249;
	}
	.error-footer{
		width: 100%;
		height: 10em;
		display: block;
		position: absolute;
		z-index: 1000;
		background-color: #e5e5e5;
		background-position: bottom;
		background-repeat: repeat-x;
		background-image: url('${staticXUiTemplatePathLocation}/images/assets_bg_footer.png');
	}
</style>
<body>

	<center>
		<h1 class="error-title">ERROR 404</h1>
		<h4 class="detail-error">PAGE NOT FOUIND</h4>
		<h2>We're sorry, we couldn't find the page you requested.</h2>
		<img class="animated infinite bounce" src="${staticXUiTemplatePathLocation}/images/Background-Lab-transparent.png">		
		<h3>Just Relax and please <strong>Try</strong> again</h3>
		<a href="javascript:history.go(-1)" class="btn btn-primary">Back</a>
	</center>
	<p>&nbsp;</p>
	<div class="error-footer"></div>
</body>
</html>