<div ng-app="x.shipping.logistic-provider-angularApp" ng-controller="logisticProviderCounter.ctrl">
  <div class="loading-wrapper" ng-show="loading">
    <div class="loading-spinner">
      <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
    </div>
  </div>

  <div class="row">
    <div class="col-sm-11 pull-left">
      <a href="${applicationBasePathLocation}/view/logistic-option-summary">Logistic Option List</a> |
      <a href="${applicationBasePathLocation}/view/logistic-product-summary">Logistic Product List</a> |
      <a href="${applicationBasePathLocation}/view/logistic-provider-report-log">Logistic Provider Report Log</a> |
      <a href="${applicationBasePathLocation}/view/logistic-upload-data-status">Logistic Upload Data Status</a> |
      <a href="${applicationBasePathLocation}/view/category-settings">Category Settings</a>
    </div>
    <div class="col-sm-1 pull-right">
      <a href="${applicationBasePathLocation}/j_spring_cas_security_logout">Logout</a>
    </div>
  </div>

  <div class="row">
    <h1 class="col-md-4">Logistic Provider Counter</h1>
    <div class="col-md-8 pull-right" style="margin-top:20px; margin-bottom:20px">
      <div class="col-md-7 col-md-offset-5">
        <p class="input-group">
          <input type="text" class="form-control"
                 datetime-picker="dd-MM-yyyy" enable-time="false"
                 ng-model="date"
                 is-open="opened" readonly
                 popover="Klik ikon kalender untuk pilih tanggal."
                 popover-trigger="mouseenter"
                 style="height: 40px;"/>
          <span class="input-group-btn" style="padding-bottom: 10px;">
            <button type="button" class="btn btn-default"
                    ng-click="openCalendar($event)">
              <i class="fa fa-calendar"></i>
            </button>
            <button type="button" class="btn btn-primary" ng-click="findLogisticProviderCounter()">Search</button>
          </span>
        </p>
      </div>
    </div>
  </div>

  <div class="row">
    <table class="table table-striped col-sm-12">
      <thead>
      <tr class="table-head">
        <th>Date</th>
        <th>Logistic Product Code</th>
        <th>Counter</th>
      </tr>
      </thead>
      <tbody>
      <tr ng-repeat="logisticProvider in logisticProviders">
        <td>{{logisticProvider.date | date:"dd-MM-yyyy" }}</td>
        <td>{{logisticProvider.logisticProductCode}}</td>
        <td>{{logisticProvider.counterOfOrderItem}}</td>
      </tr>
      </tbody>
    </table>

  </div>

  <script src="${applicationBasePathLocation}/resources/js/script/apps/shipping/logistic-provider-app.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/services/shipping/shipping-service.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/controllers/shipping/logistic-provider-controller.js"></script>
</div>
