<div ng-app="x.beirut.candidate-angularApp" ng-controller="candidateSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>



    <table class="table table-striped" style="margin-top: 0;">
        <thead>
        <tr class="table-head">
            <th>No</th>
            <th>Email</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Phone Number</th>
            <th>Title</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <tr ng-repeat="candidatePosition in candidatePositions">
            <td>1</td>
            <td><a href="#">{{candidatePosition.emailAddress}}</a></td>
            <td>{{candidatePosition.firstName}}</td>
            <td>{{candidatePosition.lastName}}</td>
            <td>{{candidatePosition.phoneNumber}}</td>
            <td>{{candidatePosition.title}}</td>
            <td>{{candidatePosition.status}}</td>
            <td>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <i class="fa fa-cog"></i> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="${applicationBasePathLocation}/view/candidate-position-detail/{{candidatePosition.idCandidate}}/{{candidatePosition.idPosition}}">View</a></li>
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
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/recruitment-center-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/recruitment-center-controller.js"></script>
</div>
