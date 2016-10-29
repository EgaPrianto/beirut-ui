<div ng-app="x.beirut.position-angularApp" ng-controller="positionSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>
<<<<<<< HEAD
    {{candidatePositions}}
    <h1>MASUK</h1>
    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
	  <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/recruitment-center-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/recruitment-center-controller.js"></script>
=======
    
	<h3 class="title-head">Recruitment Center</h3>

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
        </div></div>
    <p>&nbsp;</p>
    <div class="row">
        <table class="table table-striped" style="margin-top: 0;">
            <thead>
            <tr class="table-head">
                <th></th>
                <th>Nama</th>
                <th>Applied Date</th>
                <th>Job Type</th>
                <th>Job Division</th>
				<th>Job Title</th>
				<th>Status</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><input type="checkbox" name="options" id="option" autocomplete="off"></td>
                <td><a href="#"></a></td>
                <td></td>
                <td></td>
				<td></td>
				<td></td>
				<td></td>
                <td>
                    <div class="btn-group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-cog"></i> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu pull-right" role="menu">
                            <li><a href="/beirut-ui/view/recruitment-center-detail">View</a></li>
                            <li><a href="/beirut-ui/view/recruitment-center-edit">Ubah</a></li>
                        </ul>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="col-sm-6">
            <button type="button" class="btn btn-primary pull-right" href="recruitment-center-delete.jsp">
                <span class="glyphicon glyphicon-remove"></span> Hapus
			</button>
			<button type="submit" class="btn btn-primary">Next</button>
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
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/recuirement-center-controller.js"></script>
>>>>>>> af33bbf524d07fb546504ef9666f8c5a4389e8f1
</div>
