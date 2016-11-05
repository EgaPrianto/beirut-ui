<div ng-app="x.beirut.candidate-angularApp" ng-controller="candidateSummary.ctrl">
    <!--div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div-->
    <h3>Recruitment Center</h3>
    <div class="col-md-12">
        <div class="btn-group col-md-6 pull-left">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                Display Row <i class="bli bli-caret-down"></i>
            </button>
            <ul class="dropdown-menu" role="menu">
               <li><a ng-click="changeNumPerPage(5)">5</a></li>
               <li><a ng-click="changeNumPerPage(10)">10</a></li>
               <li><a ng-click="changeNumPerPage(25)">25</a></li>
               <li><a ng-click="changeNumPerPage(50)">50</a></li>
               <li><a ng-click="changeNumPerPage(100)">100</a></li>
            </ul>
        </div>
        <div align="col-md-6 pull-right">
            <div class="autocomplete" id="" style="height: 100%" data="test">
                <input autocomplete="off" name="s" type="text" ng-model="searchParam" placeholder="Search Candidate" class="" style="height:33px; width:300px;">
                <button ng-click="searchCandidate()" style="background-color:#068AC9; color:white; margin-left:-36px; height:34px; width:40px;" id="gdn-search-button" class="bli-search search-lup"></button>
						<button type="button" class="btn btn-down" ng-click="advanceSearch = !advanceSearch" style="background-color:#068AC9; color:white;">Advanced Search <span id="box" class="glyphicon glyphicon-chevron-down"></span></button>
					</div>
				</div>
				<div align="col-md-12 text-center" ng-show="advanceSearch" style="margin-left:120px; margin-top:20px;">
					<div class="btn-group pull-left" style="margin-right:20px;">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							Job Type <i class="bli bli-caret-down"></i>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"></a></li>
						</ul>
					</div>
					<div class="btn-group pull-left" style="margin-right:20px;">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							Job Title <i class="bli bli-caret-down"></i>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"></a></li>
						</ul>
					</div>
					<div class="btn-group pull-left" style="margin-right:20px;">
						<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
							Status <i class="bli bli-caret-down"></i>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#"></a></li>
						</ul>
					</div>
					<div class="input-group-2">
					<label for="new-url" class="col-sm-1 control-label">Start Date</label>
						<div class="col-sm-2">
							<p class="input-group">
								<input type="text" class="form-control"
										datetime-picker="dd-MM-yyyy" enable-time="false"
										ng-model="date1"
										is-open="opened1"
										popover="Klik ikon kalender untuk pilih tanggal."
										popover-trigger="mouseenter"
										style="height: 40px;"/>
								<span class="input-group-btn" style="padding-bottom: 10px;">
									<button type="button" class="btn btn-default"
											ng-click="openCalendar($event)">	
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</p>
						</div>
					</div>
					<div class="input-group-2">
					<label for="new-url" class="col-sm-1 control-label">End Date</label>
						<div class="col-sm-2">
							<p class="input-group">
								<input type="text" class="form-control"
										datetime-picker="dd-MM-yyyy" enable-time="false"
										ng-model="date2"
										is-open="opened2"
										popover="Klik ikon kalender untuk pilih tanggal."
										popover-trigger="mouseenter"
										style="height: 40px;"/>
								<span class="input-group-btn" style="padding-bottom: 10px;">
									<button type="button" class="btn btn-default"
											ng-click="openCalendar2($event)">	
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</p>
						</div>
					</div>
        </div>
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
