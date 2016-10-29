
<div ng-app="x.beirut.position-angularApp" ng-controller="positionSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>

<form>
<h3>Jobs Management</h3>
<h4 style="color:#086CA3"> Edit Position </h4>
<br>
<br>
<h4 class="title-head">Detil Information</h4>
<br>
<label> Job Title : </label>
<input type="text" class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched" style="width:300px" ng-model="city" name="city" placeholder="Job Title" id="Job Title" required="">
<br>
<label> Job Type </label>
<input type="text" class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched" style="width:300px" ng-model="city" name="city" placeholder="Job Type" id="Job Type" required="">
<br>
<label> Job Division </label>
<input type="text" class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched" style="width:300px" ng-model="city" name="city" placeholder="Job Division" id="Job Division" required="">
<br>

<h4 class="title-head">Status Information</h4>
<br>
<label> Status </label>
<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
         Status <i class="bli bli-caret-down"></i>
</button>
<br>
<br>

<h4 class="title-head">Description</h4>
<br>
<label> Upload your file here </label>
<input type="file" name="file"></input>
<br>
<button type="submit" style="background-color:#086CA3" class="btn btn-success" ng-click="alertMe('success')">Submit</button>
</form>

<br>
<script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
<script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
<script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
<script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
<script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>

</div>
