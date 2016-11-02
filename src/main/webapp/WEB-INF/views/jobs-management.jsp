<div ng-app="x.beirut.position-angularApp" ng-controller="positionSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>
    <h3>Jobs Management</h3>
	<br>
	<br>
	<div class="autocomplete " id="" style="height: 100%" data="test">
      <input style="height:33px; width:300px;" autocomplete="off" name="s" type="text" ng-model="searchParam" placeholder="Search Job Title" class="">
      <button style="background-color:#068AC9; color:white; margin-left:-35px; height:34px; width:40px;"id="gdn-search-button" class="bli-search search-lup"></button>

	  <div class="col-sm-6">
          <a style="color:white; text-decoration:none;" href="/beirut-ui/view/insert-new-position"><button type="button" class="btn btn-primary pull-right" ng-click="popModal()">
          <i class="bli bli-plus"></i> Tambah</button></a>
      </div>

    </div>

	<div class="row">
                <div class="col-sm-6">
                  <div class="btn-group pull-left">
                     <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        Display Row <i class="bli bli-caret-down"></i>
                     </button>
                     <ul class="dropdown-menu" role="menu">
                        <li><a href="#">25</a></li>
                        <li><a href="#">50</a></li>
                        <li><a href="#">100</a></li>
                     </ul>
                  </div>
                </div>

    </div>

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
                            <tr ng-repeat="position in positions">
								<td><input type="checkbox" name="options" id="option1" autocomplete="off"></td>
                                <td> {{position.jobType}} </td>
                                <td> {{position.title}}</td>
              							    <td>
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
                                          <li><a href="/beirut-ui/view/jobs-management-detail/{{position.id}}">View</a></li>
                                          <li><a href="/beirut-ui/view/position-edit/{{position.id}}">Ubah</a></li>
                                       </ul>
                                    </div>
                                </td>
                            </tr>
                 </tbody>
              </table>
			  <div class="col-sm-6">
				<button type="button" class="btn btn-primary pull-right" ng-click="popModal()">
				<span class="glyphicon glyphicon-remove"></span>Hapus</button>
			  </div>
    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
	  <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>
</div>
