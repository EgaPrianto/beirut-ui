<div ng-app="x.beirut.position-angularApp">

    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>
  <div ng-init="id='${id}'">
    <div ng-controller="positionDescription.ctrl">

    <h2 class="title-head">Detail Posisi</h2>
    <div class="panel panel-default">
         <div class="panel-body">
	             <div class="form-horizontal">
		                  <fieldset>
                          <legend>Data Posisi</legend>
		                            <div class="form-group">
			                                   <label for="job-id" class="col-md-2 control-label">Job ID:</label>
			                                          <div class="col-md-6">
			                                                   {{detail.value.id}}
			                                          </div>
		                           </div>
                               <div class="form-group">
                                         <label for="job-type" class="col-md-2 control-label">Job Type:</label>
                                                <div class="col-md-6">
                                                        {{detail.value.jobType}}
                                                </div>
                              </div>
                              <div class="form-group">
                                        <label for="job-division" class="col-md-2 control-label">Job Division:</label>
                                                <div class="col-md-6">
                                                        {{detail.value.jobDivision}}
                                                </div>
                              </div>
                    </fieldset>
                    <fieldset>
                          <legend>Informasi Status</legend>
                                <div class="form-group">
                                        <label for="status" class="col-md-2 control-label">Status:</label>
                                                <div class="col-md-6">
                                                        <span class="label label-outline-success" ng-if = "detail.value.jobStatus == 'OPEN'">{{detail.value.jobStatus}}</span>
                        <span class="label label-outline-default" ng-if = "detail.value.jobStatus == 'PENDING'">{{detail.value.jobStatus}}</span>
      									<span class="label label-outline-danger" ng-if = "detail.value.jobStatus == 'CLOSE'">{{detail.value.jobStatus}}</span>
                                                </div>
                                </div>
                                <div class="form-group">
                                        <label for="created-date" class="col-md-2 control-label">Created Date:</label>
                                                <div class="col-md-6">
                                                        {{detail.value.createdDate  | date:'yyyy-MM-dd HH:mm:ss'}}
                                                </div>
                                </div>
                                <div class="form-group">
                                        <label for="updated-date" class="col-md-2 control-label">Updated Date:</label>
                                                <div class="col-md-6">
                                                        {{detail.value.updatedDate  | date:'yyyy-MM-dd HH:mm:ss'}}
                                                </div>
                                </div>
                    </fieldset>
                    <fieldset>
                            <legend>Description</legend>
                                  <div class="form-group">
                                          <label for="description" class="col-md-2 control-label">Description:</label>
                                                  <div class="col-md-8">
                                                          <pre>{{response.value.positionDetail}}</pre>
                                                  </div>
                                  </div>
                   </fieldset>
              </div>
          </div>
      </div>
    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
    <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>

    </div>
  </div>
</div>
