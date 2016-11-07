<div ng-app="x.beirut.position-angularApp">
    <div ng-init="id='${id}';">
        <div ng-controller="positionDetail.ctrl">
            <div class="loading-wrapper" ng-show="loading">
                <div class="loading-spinner">
                    <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
                </div>
            </div>

            Id : {{id}} <br><br>

            Response : <br>
            {{response}}

            <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
            <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
            <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
            <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
            <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>
        </div>
    </div>



</div>
