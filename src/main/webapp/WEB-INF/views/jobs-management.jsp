<div ng-app="x.beirut.position-angularApp" ng-controller="positionSummary.ctrl">
	<div class="loading-wrapper" ng-show="loading">
		<div class="loading-spinner">
			<img src="${staticBlistrapPathLocation}images/Preloader84.gif">
			</div>
		</div>
		<h3>Jobs Management</h3>
		<div class="col-md-12">
			<div class="btn-group pull-left">
				<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
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
				<div class="autocomplete " id="" style="height: 100%" data="test">
					<input style="height:33px; width:300px;" autocomplete="off" name="s" type="text" ng-model="searchParam" placeholder="Search Job Title" class="">
						<button style="background-color:#068AC9; color:white; margin-left:-35px; height:34px; width:40px;"id="gdn-search-button" class="bli-search search-lup"></button>
						<div class="col-sm-6">
							<a style="color:white; text-decoration:none;" href="/beirut-ui/view/insert-new-position"><button type="button" class="btn btn-primary pull-right" ng-click="popModal()">
									<i class="bli bli-plus"></i> Tambah</button></a>
						</div>
					</div>
				</div>
	
</div>
					<div class="row">
						<table class="table table-striped" style="margin-top: 0;">
							<thead>
								<tr class="table-head">
									<th></th>
									<th>Job Type</th>
									<th>Job Title</th>
									<th>Status</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="position in positions"  class="beirutRows">
									<td><input type="checkbox" ng-model="position.selected" value="{{position.id}}" id="option1" autocomplete="off"></td>
										<td ng-click="getDetail(position)"> {{position.jobType}} </td>
										<td ng-click="getDetail(position)"> {{position.title}}</td>
										<td ng-click="getDetail(position)">
											<span class="label label-outline-success" ng-if = "position.jobStatus == 'OPEN'">{{position.jobStatus}}</span>
											<span class="label label-outline-default" ng-if = "position.jobStatus == 'PENDING'">{{position.jobStatus}}</span>
											<span class="label label-outline-danger" ng-if = "position.jobStatus == 'CLOSE'">{{position.jobStatus}}</span>
										</td>
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
													<i class="fa fa-cog"></i> <span class="caret"></span>
												</button>
												<ul class="dropdown-menu pull-right" role="menu">
													<li><a href="${applicationBasePathLocation}/view/jobs-management-detail/{{position.id}}">View</a></li>
													<li><a href="${applicationBasePathLocation}/view/position-edit/{{position.id}}">Ubah</a></li>
												</ul>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<pagination class="pull-right"
									ng-model="currentPage"
									items-per-page="size"
									total-items="pageSize * size"
									max-size="maxSize"
									force-ellipses="true"
									boundary-links="true">
							</pagination>
							<div class="panel-body col-md-12">
								<h5>Action to checked box</h5>
								<div class="col-md-6  col-sm-8">
									<div class="col-md-4 col-sm-4">
										<select class="form-control" ng-model="selectedStatus" name="new-url" id="new-url" tooltip="mandatory">
											<option>OPEN</option>
											<option>CLOSE</option>
											<option>PENDING</option>
										</select>
									</div>
									<div class="col-md-2 col-sm-2">
										<button type="button" class="btn" ng-click="changeStatus()">
											<span class="glyphicon glyphicon-save"></span>Submit Status
										</button>
									</div>
								</div>
							</div>
							<script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
							<script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
							<script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
							<script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
							<script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>
						</div>
						