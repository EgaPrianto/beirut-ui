<div ng-app="x.beirut.candidate-angularApp" ng-controller="candidateSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>
    {{candidatePositions}}
    <h1>MASUK</h1>
    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
	  <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/recruitment-center-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/recruitment-center-controller.js"></script>
</div>
