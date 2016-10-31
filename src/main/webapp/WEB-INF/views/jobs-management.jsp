<div ng-app="x.beirut.position-angularApp" ng-controller="positionSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>

    <a href="${applicationBasePathLocation}/view/create-new-position"> Create New Position </a><br><br>

    <table class="table table-striped" style="margin-top: 0;">
        <thead>
        <tr class="table-head">
            <th>No</th>
            <th>Id</th>
            <th>Title</th>
            <th>Job Type</th>
            <th>Job Division</th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="position in positions">
            <td>1</td>
            <td><a href="#">{{position.id}}</a></td>
            <td>{{position.title}}</td>
            <td>{{position.jobType}}</td>
            <td>{{position.jobDivision}}</td>
            <td>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-cog"></i> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="${applicationBasePathLocation}/view/position-detail/{{position.id}}">View</a></li>
                        <li><a href="#">Ubah</a></li>
                        <li><a href="#">Hapus</a></li>
                    </ul>
                </div>
            </td>
        </tr>
        </tbody>
    </table>

    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
    <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>
</div>
