<div ng-app="x.shipping.logistic-provider-angularApp" ng-controller="logisticProviderReportLog.ctrl">
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
      <a href="${applicationBasePathLocation}/view/logistic-upload-data-status">Logistic Upload Data Status</a> |
      <a href="${applicationBasePathLocation}/view/category-settings">Category Settings</a>
    </div>
    <div class="col-sm-1 pull-right">
      <a href="${applicationBasePathLocation}/j_spring_cas_security_logout">Logout</a>
    </div>
  </div>

  <div class="row">
    <h1 class="col-md-12">Logistic Provider Report Log</h1>
  </div>

  <div class="row">
    <table class="table table-striped col-sm-12">
      <thead>
      <tr class="table-head">
        <th>Logon Id</th>
        <th>SKU</th>
        <th>Dangerous Level</th>
        <th>Total Weight</th>
        <th>Logistic Option Code</th>
        <th>Payment Rule</th>
        <th>Dropship</th>
        <th>Postal Code Destination</th>
        <th>City Destination</th>
        <th>Origin Id</th>
        <th>Direct Flight</th>
      </tr>
      </thead>
      <tbody>
      <tr ng-repeat="log in logisticProviderReportLog">
        <td>{{log.logonId}}</td>
        <td>{{log.skuCode}}</td>
        <td>{{log.dangerousLevel}}</td>
        <td>{{log.totalWeight}}</td>
        <td>{{log.logisticOptionCode}}</td>
        <td>{{log.paymentRule}}</td>
        <td>{{log.dropship}}</td>
        <td>{{log.postalCodeDestination}}</td>
        <td>{{log.cityDestination}}</td>
        <td>{{log.originId}}</td>
        <td>{{log.directFlight}}</td>
      </tr>
      </tbody>
    </table>
    <!--<pagination total-items="totalRecords" ng-change="pageChanged()"
                items-per-page="size" ng-model="currentPage" max-size="10"
                class="pagination-sm" boundary-links="true" rotate="false"
                num-pages="numPages"></pagination>  -->
  </div>

  <script src="${applicationBasePathLocation}/resources/js/script/apps/shipping/logistic-provider-app.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/services/shipping/shipping-service.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/controllers/shipping/logistic-provider-controller.js"></script>
</div>
