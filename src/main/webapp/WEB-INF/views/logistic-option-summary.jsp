<div ng-app="x.shipping.logistic-option-angularApp" ng-controller="logisticOptionSummary.ctrl">
  <div class="loading-wrapper" ng-show="loading">
    <div class="loading-spinner">
      <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
    </div>
  </div>

  <div class="row">
    <div class="col-sm-11 pull-left">
      <a href="${applicationBasePathLocation}/view/logistic-product-summary">Logistic Product List</a> |
      <a href="${applicationBasePathLocation}/view/logistic-provider-counter">Logistic Provider Counter</a> |
      <a href="${applicationBasePathLocation}/view/logistic-provider-report-log">Logistic Provider Report Log</a> |
      <a href="${applicationBasePathLocation}/view/logistic-upload-data-status">Logistic Upload Data Status</a> |
      <a href="${applicationBasePathLocation}/view/category-settings">Category Settings</a>
    </div>
    <div class="col-sm-1 pull-right">
      <a href="${applicationBasePathLocation}/j_spring_cas_security_logout">Logout</a>
    </div>
  </div>

  <div class="row">
    <h1 class="col-md-4">Logistic Options List</h1>
    <div class="col-md-8 pull-right" style="margin-top:20px; margin-bottom:20px">
      <div class="col-md-7 col-md-offset-5">
        <a href="create-logistic-option" class="btn btn-primary pull-right">Create Logistic
          Option</a>
      </div>
    </div>
  </div>

  <div class="row">
    <table class="table table-striped col-sm-12">
      <thead>
      <tr class="table-head">
        <th>Logistic Option Code</th>
        <th>Logistic Option Name</th>
        <th>Sequence</th>
        <th width="40%">Logistic Products</th>
        <th>Info</th>
        <th>Status</th>
      </tr>
      </thead>
      <tbody>
      <tr ng-repeat="logisticOption in logisticOptions">
        <td>{{logisticOption.logisticOptionCode}}</td>
        <td>{{logisticOption.logisticOptionName}}</td>
        <td>{{logisticOption.sequence}}</td>
        <td>
          <span ng-repeat="logisticProduct in logisticOption.logisticProductList">
            {{logisticProduct}},
          </span>
        </td>
        <td><span ng-show="logisticOption.defaultLogisticOption">DEFAULT LOGISTIC OPTION</span></td>
        <td>
          <span>
              <button class="btn btn-success btn-sm" ng-show="logisticOption.active"
                       ng-click="openDeactivation(logisticOption)">ACTIVE</button>
              <button class="btn btn-danger btn-sm" ng-hide="logisticOption.active"
                      ng-click="openActivation(logisticOption)">INACTIVE</button>
          </span>
        </td>
        <td>
          <div class="btn-group">
            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-cog"></i> <span class="caret"></span>
            </button>
            <ul class="dropdown-menu pull-right" role="menu">
              <li>
                <a href="${applicationBasePathLocation}/view/logistic-option-detail/{{logisticOption.logisticOptionCode}}">View Detail</a>
              </li>
              <li>
                <a href="${applicationBasePathLocation}/view/update-logistic-option/{{logisticOption.logisticOptionCode}}">Edit</a>
              </li>
              <li><a href="#" ng-click="openDeletion(logisticOption)">Delete</a></li>
            </ul>
          </div>
        </td>
      </tr>
      </tbody>
    </table>
    <pagination total-items="totalRecords" ng-change="pageChanged()"
                items-per-page="size" ng-model="currentPage" max-size="10"
                class="pagination-sm" boundary-links="true" rotate="false"
                num-pages="numPages"></pagination>

  </div>

  <script src="${applicationBasePathLocation}/resources/js/script/apps/shipping/logistic-option-summary-app.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/services/shipping/shipping-service.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/controllers/shipping/logistic-option-controller.js"></script>
</div>
