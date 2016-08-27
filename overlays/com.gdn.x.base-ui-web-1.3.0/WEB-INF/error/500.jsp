<!DOCTYPE html>
<html>
<head>
	<title>Page Internal Server Error</title>
<link rel="stylesheet" href="${staticBlistrapPathLocation}/stylesheets/vendor/bootstrap.min.css">
<link rel="stylesheet" href="${staticBlistrapPathLocation}/stylesheets/blistrap.css">
</head>
<style type="text/css">
	body{
		background: #e5e5e5;
	}

	.error-title{
		font-size: 5em;
		color: #FF5400;
		font-weight: 600;
		font-family: Helvetica, Arial, sans-serif;
		text-transform: uppercase;
		letter-spacing: 5px;
	}

	.detail-error{
		color: #FF5400;
	}

	.floating{
	    -webkit-animation-name: Floatingx;
	    -webkit-animation-duration: 2s;
	    -webkit-animation-iteration-count: infinite;
	    -webkit-animation-timing-function: ease-in-out;
	    -moz-animation-name: Floating;
	    -moz-animation-duration: 2s;
	    -moz-animation-iteration-count: infinite;
	    -moz-animation-timing-function: ease-in-out;
	    margin-left: 30px;
	    margin-top: 5px;

	}

	@-webkit-keyframes Floatingx{
	    from {-webkit-transform:translate(0, 0px);}
	    65% {-webkit-transform:translate(0, 15px);}
	    to {-webkit-transform: translate(0, -0px);    }    
	}
	    
	@-moz-keyframes Floating{
	    from {-moz-transform:translate(0, 0px);}
	    65% {-moz-transform:translate(0, 15px);}
	    to {-moz-transform: translate(0, -0px);}    
	}

	.scaling{
	    -webkit-animation-name: scalex;
	    -webkit-animation-duration:2s;
	    -webkit-animation-iteration-count:infinite;
	    -webkit-animation-timing-function:ease-in-out;
	    -moz-animation-name: scale;
	    -moz-animation-duration:2s;
	    -moz-animation-iteration-count:infinite;
	    -moz-animation-timing-function:ease-in-out;
	}
	    
	    @-webkit-keyframes scalex{
	        from {-webkit-transform: scale(0.9);}
	        65% {-webkit-transform: scale(1.0);}
	        to {-webkit-transform: scale(0.9);}    
	    }
	        
	    @-moz-keyframes scale{
	        from {-moz-transform: scale(0.9);}
	        65% {-moz-transform: scale(1.0);}
	        to {-moz-transform: scale(0.9);}    
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
		<h1 class="error-title">ERROR 500</h1>
		<h4 class="detail-error">INTERNAL SERVER ERROR</h4>
		<h2>Something must be not good after what you've done.</h2>
		<img class="floating" width="200px" src="${staticXUiTemplatePathLocation}/images/logo-sad.png">		
		<h3>Just Relax and please <strong>Try</strong> again</h3>
		<a href="javascript:history.go(-1)" class="btn btn-primary">Back</a>
	</center>
	<p>&nbsp;</p>
	<div class="error-footer"></div>
</body>
</html>