<div ng-app="x.beirut.position-angularApp">

    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>
  <div ng-init="id='${id}'">
    <div ng-controller="positionDescription.ctrl">
    <h3>Jobs Management</h3>
    <h4 style="color:#086CA3">{{detail.value.title}}</h4>
    <br>
    <br>
    <h4 class="title-head">Detil Information </h4>
    <br>
    <label> Job ID : {{detail.value.id}}</label><br>
    <label> Job Type : {{detail.value.jobType}} </label><br>
    <label> Job Division : {{detail.value.jobDivision}} </label>
    <br>
    <h4 class="title-head">Status Information</h4>
    <br>
    <label> Status : {{detail.value.jobStatus}}</label><br>
    <label> Create Date : {{detail.value.createdDate  | date:'yyyy-MM-dd HH:mm:ss'}}</label><br>
    <label> Update Date : {{detail.value.updatedDate  | date:'yyyy-MM-dd HH:mm:ss'}}</label>
    <br>
    <h4 class="title-head">Description</h4>
    <pre>{{response.value.positionDetail}}</pre>
    <br>

    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
    <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>

    </div>
  </div>
</div>
