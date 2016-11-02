
<div ng-app="x.beirut.position.option-angularApp" ng-controller="positionCreateNew.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>

<form>
<h3>Jobs Management</h3>
<h4 style="color:#086CA3"> Insert New Position </h4>
<br>
<br>
<h4 class="title-head">Detil Information</h4>
<br>
<label> Job Title : </label>
<input type="text" class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched" style="width:300px" ng-model="title" name="insertNewPosition" placeholder="Job Title" id="Job Title" required="">
<br>
<label> Job Type </label>
<input type="text" class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched" style="width:300px" ng-model="jobType" name="insertNewPosition" placeholder="Job Type" id="Job Type" required="">
<br>
<label> Job Division </label>
<input type="text" class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched" style="width:300px" ng-model="jobDivision" name="insertNewPosition" placeholder="Job Division" id="Job Division" required="">
<br>

<br>

<h4 class="title-head">Description</h4>
<br>
<label> Upload your file here </label>
<input type="file" name="file"></input>
<br>
<button type="submit" style="background-color:#086CA3" class="btn btn-success" ng-click="submitPosition()">Submit</button>
</form>

<br>
<script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
<script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
<script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-option-app.js"></script>
<script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
<script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-option-controller.js"></script>

</div>
