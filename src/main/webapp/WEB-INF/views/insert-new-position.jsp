<div ng-app="x.beirut.position.option-angularApp" ng-init="positionNew=${positionNew}" ng-controller="positionAddNew.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>
    berhasil bind dari view : <br/>
    ${positionNew}
    <br/>
    berhasil bind : <br/>
    {{positionNew}}

    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
    <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-option-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-option-controller.js"></script>
</div>
