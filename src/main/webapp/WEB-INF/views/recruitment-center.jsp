<div ng-app="x.beirut.candidate-angularApp" ng-controller="candidateSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>
    <h3>Recruitment Center</h3>
    <div class="col-sm-6">
        <div class="btn-group pull-left">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                Display Row <i class="bli bli-caret-down"></i>
            </button>
            <ul class="dropdown-menu" role="menu">
                <li><a href="#">25</a></li>
                <li><a href="#">50</a></li>
                <li><a href="#">100</a></li>
            </ul>
        </div>
        <div align="right">
            <div class="autocomplete" id="" style="height: 100%" data="test">
                <input autocomplete="off" name="s" type="text" ng-model="searchParam" placeholder="Search Candidate" class="" style="height:33px; width:300px;">
                <button style="background-color:#068AC9; color:white; margin-left:-36px; height:34px; width:40px;"id="gdn-search-button" class="bli-search search-lup"></button>
            </div>
        </div>
    </div>
    <p>&nbsp;</p>
    <div class="row">
        <table class="table table-striped" style="margin-top: 0;">
            <thead>
            <tr class="table-head">
                <th></th>
                <th>Nama</th>
                <th>Tanggal Pendaftaran</th>
                <th>Tipe Pekerjaan</th>
                <th>Divisi Pekerjaan</th>
                <th>Judul Pekerjaan</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat = "candidatePosition in candidatePositions" class="beirutRows">
                <td><input type="checkbox" ng-model="candidatePosition.selected" name="options" id="option" autocomplete="off"></td>
                <td ng-click="getDetail(candidatePosition)">{{candidatePosition.firstName}} {{candidatePosition.lastName}}</td>
                <td ng-click="getDetail(candidatePosition)">{{candidatePosition.createdDate | date:'yyyy-MM-dd HH:mm:ss'}}</td>
                <td ng-click="getDetail(candidatePosition)">{{candidatePosition.jobType}}</td>
                <td ng-click="getDetail(candidatePosition)">{{candidatePosition.jobDivision}}</td>
                <td ng-click="getDetail(candidatePosition)">{{candidatePosition.title}}</td>
                <td ng-click="getDetail(candidatePosition)"><span class="label label-outline-success">{{candidatePosition.status}}</span></td>
                <td ng-click="getDetail(candidatePosition)">
                    Klik untuk melihat detil.
                </td>
            </tr>
            </tbody>
        </table>
      <pagination class="pull-right"
        ng-model="currentPage"
        items-per-page="size"
        total-items="pageSize * size"
        max-size="maxSize"
        boundary-links="true">
      </pagination>
      <div class="panel-body col-md-12">
      <h5>Action to checked box</h5>
        <div class="col-md-6  col-sm-8">
          <div class="col-md-4 col-sm-4">
          <select class="form-control" ng-model="selectedStatus" name="new-url" id="new-url" tooltip="mandatory">
						<option>APPLY</option>
						<option>CALL_CANDIDATE</option>
						<option>PSIKOTES</option>
						<option>TECHNICAL_TEST</option>
						<option>USER</option>
						<option>HRD</option>
						<option>ON_HOLD</option>
						<option>HEAD</option>
						<option>CEO</option>
						<option>MEDICAL</option>
						<option>OFFERING</option>
						<option>DECLINED</option>
						<option>JOIN</option>
						<option>WITHDRAWL</option>
          </select>
          </div>
          <div class="col-md-2 col-sm-2">
          <button type="button" class="btn" ng-click="changeStatus()">
            <span class="glyphicon glyphicon-save"></span>Submit Status
          </button>
          </div>
        </div>
      </div>
    </div>
    <!--
    <script src="${applicationBasePathLocation}/resources/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="${applicationBasePathLocation}/resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="${applicationBasePathLocation}/resources/bower_components/angular/angular.js"></script>
  	<script src="${applicationBasePathLocation}/resources/bower_components/angular-route/angular-route.js"></script>
    <script src="${applicationBasePathLocation}/resources/bower_components/angular-resource/angular-resource.js"></script>-->
    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
    <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/recruitment-center-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/recruitment-center-controller.js"></script>
</div>
