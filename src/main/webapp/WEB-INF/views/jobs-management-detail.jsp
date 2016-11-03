
<div ng-app="x.beirut.position-angularApp">
  <div ng-init="id='${id}'">
    <div ng-controller="positionDetail.ctrl">

    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>
    ID = ${id}
{{response}}
    <h3>Jobs Management</h3>
    <h4 style="color:#086CA3"> Job Title </h4>
    <br>
    <br>
    <h4 class="title-head">Detil Information</h4>
    <br>
    <label> Job ID : </label>
    <label> Job Type : </label>
    <label> Job Division : </label>
    <br>
    <h4 class="title-head">Status Information</h4>
    <br>
    <label> Status : </label>
    <label> Create Date : </label>
    <label> Update Date : </label>
    <br>
    <h4 class="title-head">Description</h4>
    <br>

    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
    <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>

    </div>
  </div>
</div>
