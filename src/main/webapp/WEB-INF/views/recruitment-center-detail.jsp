<div ng-app="x.beirut.candidate-angularApp" >

	<div ng-init="idCandidate='${idCandidate}';idPosition = '${idPosition}'">
		<div ng-controller="candidateDetail.ctrl"><div class="loading-wrapper" ng-show="loading">
			<div class="loading-spinner">
				<img src="${staticBlistrapPathLocation}images/Preloader84.gif">
			</div>
		</div>
			idCand = ${idCandidate}
			idPos = ${idPosition}
			{{candidate}}
			{{position}}
			{{statusLogs}}
        <a class="btn btn-primary" href="${applicationBasePathLocation}/file/candidate-detail/${idCandidate}">
          <span class="col-sm-2 glyphicon glyphicon-download"></span>Download CV
        </a>
			<script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
		  <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
		  <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/recruitment-center-app.js"></script>
		  <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
		  <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/recruitment-center-controller.js"></script>

		</div>
	</div>
</div>
