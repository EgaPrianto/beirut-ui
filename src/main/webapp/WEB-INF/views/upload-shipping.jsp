<div ng-app="x.shipping.upload-shipping-angularApp" ng-controller="uploadShipping.ctrl">
  <div class="loading-wrapper" ng-show="loading">
    <div class="loading-spinner">
      <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
    </div>
  </div>

  <div class="row">
    <div class="col-sm-3">
      <a href="${applicationBasePathLocation}/view/summary">Logistic Option List</a>
    </div>
    <div class="col-sm-1 col-sm-offset-8"><a
            href="${applicationBasePathLocation}/j_spring_cas_security_logout">Logout</a></div>
  </div>

  <div class="row">
    <h1>Upload Shipping Table</h1>
  </div>

  <div class="row">
    <form class="form-horizontal col-sm-10 col-sm-offset-2">
      <div class="form-group">
        <div class="col-sm-12" style="padding: 0px;">
          <div class="col-sm-12">
                        <span class="validation-error pull-right"
                              ng-show="errorData.hasEmptyAdjustmentNameError">
                            Required field cannot be empty </span> <span
                  class="validation-error pull-right"
                  ng-show="errorData.hasExistAdjustmentNameError">
                            Logistic Option ID is not available </span>
          </div>
        </div>
        <label class="col-sm-2 control-label">
          Shipping Table<span class="red">* </span>
          <i class="bli bli-info-1"
             popover="Logistic ID yang akan dibuat harus unik."
             popover-trigger="mouseenter"></i>
        </label>

        <div class="col-sm-3">
          <input required type="file"
                 ng-model="logisticOption.logisticOptionId"
                 custom-onblur="logisticOptionIdValidation()">
          <p class="help-block">Halo apa kabar mari kira pulang</p>
        </div>

        <div class="col-sm-2">
            <button type="button" ng-click="upload()" class="btn btn-primary">Upload</button>
        </div>

      </div>
    </form>
  </div>

  <script src="${applicationBasePathLocation}/resources/js/script/apps/shipping/upload-shipping-app.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/services/shipping/shipping-service.js"></script>
  <script src="${applicationBasePathLocation}/resources/js/script/controllers/shipping/upload-shipping-controller.js"></script>
</div>
