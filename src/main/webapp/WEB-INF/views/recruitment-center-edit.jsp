<!--div ng-app="x.beirut.position-angularApp" ng-controller="positionSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div-->

<h2 class="title-head">Ubah Status Kandidat</h2>
<div class="panel panel-default">
	<div class="panel-body">
		<div class="form-horizontal">
			<div class="form-group">
				<label for="new-url" class="col-sm-2 control-label" tooltip="mandatory">Status<span class="red">*</span></label>
				<div class="col-sm-6">
					<select class="form-control" name="new-url" id="new-url" tooltip="mandatory">
						<option>APPLY</option>
						<option>CALL CANDIDATE</option>
						<option>PSIKOTES</option>
						<option>TECHNICAL TEST</option>
						<option>USER</option>
						<option>HRD</option>
						<option>ON HOLD</option>
						<option>HEAD</option>
						<option>CEO</option>
						<option>MEDICAL</option>
						<option>OFFERING</option>
						<option>DECLINED</option>
						<option>JOIN</option>
						<option>WITHDRAWL</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	<div class="panel-footer">
		<div class="pull-right">
			<button type="submit" class="btn btn-primary" value="submit" ng-click="alertMe('success')">Submit</button>
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
</div>