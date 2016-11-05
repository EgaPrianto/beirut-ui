<div ng-app="x.beirut.candidate-angularApp" >
	<div ng-init="idCandidate='${idCandidate}';idPosition = '${idPosition}'">
		<div ng-controller="candidateDetail.ctrl">
			<div class="loading-wrapper" ng-show="loading">
				<div class="loading-spinner">
					<img src="${staticBlistrapPathLocation}images/Preloader84.gif">
				</div>
			</div>
		<h2 class="title-head">Detail Kandidat</h2>
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="form-horizontal">
					<fieldset>
						<legend>Data Kandidat</legend>
						<div class="form-group">
							<label for="nama" class="col-md-2 control-label">Nama Lengkap:</label>
							<div class="col-md-6">
							{{candidate.firstName}} {{candidate.lastName}}
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">Email Address:</label>
							<div class="col-sm-6">
							{{candidate.emailAddress}}
							</div>
						</div>
						<div class="form-group">
							<label for="nohp" class="col-sm-2 control-label">Phone Number:</label>
							<div class="col-sm-6">
							{{candidate.phoneNumber}}
							</div>
						</div>
						<div class="form-group">
							<label for="nohp" class="col-sm-2 control-label">CV:</label>
							<div class="col-sm-6">
							<a class="btn btn-primary" href="${applicationBasePathLocation}/file/candidate-detail/${idCandidate}">
							<span class="col-sm-2 glyphicon glyphicon-download"></span>Download CV
							</a>
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>Posisi</legend>
						<div class="form-group">
							<label for="applied-date" class="col-sm-2 control-label">Applied Date</label>
							<div class="col-sm-6">
							{{position.createdDate | date:'yyyy-MM-dd HH:mm:ss'}}
							</div>
						</div>
						<div class="form-group">
							<label for="job-type" class="col-sm-2 control-label">Job Type</label>
							<div class="col-sm-6">
								{{position.jobType}}
							</div>
						</div>
						<div class="form-group">
							<label for="job-division" class="col-sm-2 control-label">Job Division</label>
							<div class="col-sm-6">
								{{position.jobDivision}}
							</div>
						</div>
						<div class="form-group">
							<label for="job-title" class="col-sm-2 control-label">Job Title</label>
							<div class="col-sm-6">
								{{position.title}}
							</div>
						</div>
					</fieldset>
					<fieldset>
						<legend>History Status</legend>
						<table class="table table-striped" style="margin-top: 0;">
							<thead>
								<th>Created Date</th>
								<th>Created By</th>
								<th>Updated Date</th>
								<th>Updated By</th>
								<th>Status</th>
							</thead>
							<tbody>
								<tr ng-repeat = "statusLog in statusLogs" class="beirutRows">
										<td>{{statusLog.createdDate | date:'yyyy-MM-dd HH:mm:ss'}}</td>
										<td>{{statusLog.createdBy}}</td>
										<td>{{statusLog.updatedDate | date:'yyyy-MM-dd HH:mm:ss'}}</td>
										<td>{{statusLog.updatedBy}}</td>
										<td><span class="label label-outline-success">{{statusLog.status}}</span></td>
								</tr>
							</tbody>
						</table>
					</fieldset>
				</div>
			</div>
		</div>
			<script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
			<script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
			<script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/recruitment-center-app.js"></script>
			<script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
			<script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/recruitment-center-controller.js"></script>
		</div>
	</div>
</div>
