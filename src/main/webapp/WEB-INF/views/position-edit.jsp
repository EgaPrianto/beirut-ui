<div ng-app="x.beirut.position.option-angularApp" ng-init="id='${id}'">
    <div ng-controller="positionEdit.ctrl">
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
            <input type="text"
                   class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched"
                   style="width:300px" ng-model="title" value="{{title}}" name="title"
                   placeholder="Job Title"
                   id="Job Title" required="">
            <br>
            <label> Job Type </label>
            <input type="text"
                   class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched"
                   style="width:300px" ng-model="jobType" value="{{jobType}}" name="jobType"
                   placeholder="Job Type" id="Job Type"
                   required="">
            <br>
            <label> Job Division </label>
            <input type="text"
                   class="form-control ng-pristine ng-invalid ng-invalid-required ng-touched"
                   style="width:300px" ng-model="jobDivision" value="{{jobDivision}}"
                   name="jobDivision" placeholder="Job Division"
                   id="Job Division" required="">
            <br>

            <h4 class="title-head">Status Information</h4>
            <br>
            <div class="btn-group pull-left">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <span id="StatusPosition">Status</span> <i class="bli bli-caret-down"></i>
                </button>
                <ul class="dropdown-menu" role="menu">
                    <li><a ng-click="changeStatus('OPEN')">OPEN</a></li>
                    <li><a ng-click="changeStatus('PENDING')">PENDING</a></li>
                    <li><a ng-click="changeStatus('CLOSE')">CLOSE</a></li>
                </ul>
            </div>
            <br>
            <br>

            <h4 class="title-head">Description</h4>
            <br>
            <label> Upload your file here </label>
            <input id="Data" type="file" multiple
                   onchange="angular.element(this).scope().onFileSelect(this)">
            <br>
            <button type="submit" style="background-color:#086CA3" class="btn btn-success"
                    ng-click="submitEditPosition('${applicationBasePathLocation}/view/jobs-management/${id}')">Submit
            </button>
        </form>

        <br>
        <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
        <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
        <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-option-app.js"></script>
        <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
        <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-option-controller.js"></script>
    </div>
</div>
