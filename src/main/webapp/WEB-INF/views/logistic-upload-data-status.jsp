<div ng-app="x.shipping.logistic-product-angularApp" ng-controller="logisticUploadDataStatus.ctrl">
  <div class="loading-wrapper" ng-show="loading">
    <div class="loading-spinner">
      <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
    </div>
  </div>

  <div class="row">
    <div class="col-sm-11 pull-left">
      <a href="${applicationBasePathLocation}/view/logistic-option-summary">Logistic Option List</a> |
      <a href="${applicationBasePathLocation}/view/logistic-product-summary">Logistic Product List</a> |
      <a href="${applicationBasePathLocation}/view/logistic-provider-counter">Logistic Provider Counter</a> |
      <a href="${applicationBasePathLocation}/view/logistic-provider-report-log">Logistic Provider Report Log</a> |
      <a href="${applicationBasePathLocation}/view/category-settings">Category Settings</a>
    </div>
    <div class="col-sm-1 pull-right">
      <a href="${applicationBasePathLocation}/j_spring_cas_security_logout">Logout</a>
    </div>
  </div>

  <div class="row">
    <h1 class="col-md-12">Logistic Upload Data Status</h1>
  </div>

  <div class="row">
    <table class="table table-striped col-sm-12">
      <thead>
      <tr class="table-head">
        <th>Logistic Product Code</th>
        <th>Username</th>
        <th>Filename</th>
        <th>Status</th>
        <th>Upload Date</th>
        <th>Upload Completed Date</th>
        <th>Processing Time</th>
      </tr>
      </thead>
      <tbody>
      <tr ng-repeat="data in logisticUploadDataStatus">
        <td>{{data.logisticProductCode}}</td>
        <td>{{data.username}}</td>
        <td>{{data.filename}}</td>
        <td>{{data.status}}</td>
        <td>{{data.uploadDate | date:"MM/dd/yyyy 'at' h:mma" }}</td>
        <td>{{data.uploadCompletedDate | date:"MM/dd/yyyy 'at' h:mma" }}</td>
        <td>{{data.processingTime}} ms</td>
      </tr>
      </tbody>
    </table>
    <!--
    <pagination total-items="totalRecords" ng-change="pageChanged()"
                items-per-page="size" ng-model="currentPage" max-size="10"
                class="pagination-sm" boundary-links="true" rotate="false"
                num-pages="numPages"></pagination>
  	 -->
  </div>

  <script src="${applicationBasePathLocation}/resources/js/script/apps/shipping/logistic-product-summary-app.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/services/shipping/shipping-service.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/controllers/shipping/logistic-product-controller.js"></script>
</div>
