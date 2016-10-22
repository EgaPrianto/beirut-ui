var shippingSaveLogisticOptionModuleController = angular.module('x.shipping.logistic-option-module.controllers', []);

shippingSaveLogisticOptionModuleController.controller('logisticOptionSummary.ctrl', ['$scope', '$window', '$modal', 'logisticOptionService', logisticOptionSummaryCtrlFunc]);
shippingSaveLogisticOptionModuleController.controller('shippingSaveLogisticOption.ctrl', ['$scope', '$window', '$modal', 'logisticOptionService', 'logisticProductService', shippingSaveLogisticOptionModuleCtrlFunc]);

if (!Array.prototype.remove) {
  Array.prototype.remove = function (val) {
    var i = this.indexOf(val);
    return i > -1 ? this.splice(i, 1) : [];
  };
}

function logisticOptionSummaryCtrlFunc($scope, $window, $modal, logisticOptionService) {
  $scope.currentPage = 1;
  $scope.size = 10;
  $scope.numPages = $scope.totalRecords / $scope.size;
  $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
  $scope.totalRecords = 0;

  $scope.getAllLogisticOptions = function(){
    $scope.loading = true;
    logisticOptionService.getAllLogisticOptions({
      page: $scope.currentPage - 1,
      size: $scope.size,
      property: 'logisticProductCode',
      direction: 'ASC'
    },function(response){
      if(response.success) {
        $scope.logisticOptions = response.content;
        $scope.totalRecords = response.pageMetaData.totalRecords;
        $scope.size = response.pageMetaData.pageSize;
        $scope.currentPage = response.pageMetaData.pageNumber + 1;
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      console.log(response);
      $scope.loading = false;
    }, function(error){
      swal('Error!', error.statusText, 'error');
      $scope.loading = false;
    });
  };

  $scope.getAllLogisticOptions();

  $scope.getPage = function (page) {
    $scope.currentPage = page;
    $scope.getAllLogisticOptions();
  };
  $scope.setPage = function (pageNo) {
    $scope.currentPage = pageNo;
  };
  $scope.pageChanged = function () {
    $scope.getAllLogisticOptions();
    $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
  };

  $scope.deleteLogisticOption = function(logisticOption){
    $scope.loading = true;
    logisticOptionService.deleteLogisticOption({
      id : logisticOption.logisticOptionCode
    }, function(response){
      if(response.success){
        swal("Deleted!", "Logistic Option named " + logisticOption.logisticOptionName + " has" +
            " been deleted.", "success");
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      $scope.getAllLogisticOptions();
    }, function(error){
      swal("Error.", error.statusText, "error");
      $scope.loading = false;
    });
  };

  $scope.openDeletion = function(logisticOption){
    swal({
          title: "Are you sure?",
          text: "You will not be able to recover this Logistic Option "+logisticOption.logisticOptionName+"!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "Yes, delete it!",
          closeOnConfirm: false },
        function(){
          $scope.deleteLogisticOption(logisticOption);
        });
  };

  $scope.activateLogisticOption = function(logisticOption){
    $scope.loading = true;
    logisticOptionService.activateLogisticOption({
      logisticOptionCode : logisticOption.logisticOptionCode
    }, function(response){
      if(response.success){
        swal("Activated!", "Logistic Option named " + logisticOption.logisticOptionName + " has" +
            " been activated.", "success");
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      $scope.getAllLogisticOptions();
    }, function(error){
      swal("Error.", error.statusText, "error");
      $scope.loading = false;
    });
  };

  $scope.openActivation = function(logisticOption){
    swal({
          title: "Are you sure?",
          text: "You are going to activate this Logistic Option "+logisticOption.logisticOptionName+"!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "Yes, activate it!",
          closeOnConfirm: false },
        function(){
          $scope.activateLogisticOption(logisticOption);
        });
  };

  $scope.deactivateLogisticOption = function(logisticOption){
    $scope.loading = true;
    logisticOptionService.deactivateLogisticOption({
      logisticOptionCode : logisticOption.logisticOptionCode
    }, function(response){
      if(response.success){
        swal("Deactivated!", "Logistic Option named " + logisticOption.logisticOptionName + " has" +
            " been deactivated.", "success");
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      $scope.getAllLogisticOptions();
    }, function(error){
      swal("Error.", error.statusText, "error");
      $scope.loading = false;
    });
  };

  $scope.openDeactivation = function(logisticOption){
    swal({
          title: "Are you sure?",
          text: "You are going to deactivate this Logistic Option "+logisticOption.logisticOptionName+"!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "Yes, deactivate it!",
          closeOnConfirm: false },
        function(){
          $scope.deactivateLogisticOption(logisticOption);
        });
  };
}

function shippingSaveLogisticOptionModuleCtrlFunc($scope, $window, $modal, logisticOptionService, logisticProductService){

  $scope.errorData = [];
  $scope.logisticOption = {
    logisticProductList : [],
    defaultLogisticOption : false
  };
  $scope.logisticProducts = ['Lolcat Shirt', 'Cheezeburger Shirt', 'Buckit Shirt'];
  $scope.logisticProductList = [];

  $scope.logisticProductListInit = function(){
    $scope.logisticProductList = [];
    angular.forEach($scope.logisticOption.logisticProductList, function(logisticProductList) {
      angular.forEach($scope.logisticProducts, function(logisticProduct) {
        if(logisticProductList == logisticProduct.logisticProductCode) {
          $scope.logisticProductList.push(logisticProduct);
          $scope.logisticProducts.remove(logisticProduct);
        }
      });
    });
  };

  $scope.getAllLogisticProducts = function(){
    logisticProductService.getAllLogisticProducts({
      page:0,
      size:100000,
      property:'logisticProductCode',
      direction: 'ASC'
    }, function(response){
      console.log(response);
      $scope.logisticProducts =  response.content;
      $scope.logisticProductListInit();
    });

  };

  $scope.getAllLogisticProducts();


  // drag and drop start
  $scope.hideMe = function() {
    return $scope.logisticProductList.length > 0;
  };

  $scope.dropOver = false;

  $scope.highlightRow = function(){
    $scope.dropOver = true;
  };
  // drag and drop end

  $scope.logisticOptionCodeValidation = function(){
    $scope.errorData.hasEmptyLogisticOptionCodeError = $scope.logisticOption.logisticOptionCode == undefined || $scope.logisticOption.logisticOptionCode == '';
    $scope.errorData.logisticOptionCodeHasSpacesError = /\s/g.test($scope.logisticOption.logisticOptionCode);
  };

  $scope.logisticOptionNameValidation = function(){
    $scope.errorData.hasEmptyLogisticOptionNameError = $scope.logisticOption.logisticOptionName == undefined || $scope.logisticOption.logisticOptionName == '';
  };

  $scope.logisticOptionDescriptionValidation = function(){
    $scope.errorData.hasEmptyLogisticOptionDescriptionError = $scope.logisticOption.logisticOptionDescription == undefined || $scope.logisticOption.logisticOptionDescription == '';
  };

  $scope.productListValidation = function(){
    $scope.errorData.hasEmptyLogisticProductListError = $scope.logisticOption.logisticProductList == undefined || $scope.logisticOption.logisticProductList.length < 1;
  };

  $scope.sequenceValidation = function(){
    $scope.errorData.hasEmptySequenceError = $scope.logisticOption.sequence == undefined;
    $scope.errorData.hasInvalidSequenceError = $scope.logisticOption.sequence < 1;
  };

  $scope.setDefaultLogisticOption = function(value){
    $scope.logisticOption.defaultLogisticOption = value;
  };

  $scope.setLogisticProductList = function(){
    $scope.logisticOption.logisticProductList = [];
    angular.forEach($scope.logisticProductList, function(logisticProduct) {
      $scope.logisticOption.logisticProductList.push(logisticProduct.logisticProductCode);
    });
    console.log($scope.logisticOption.logisticProductList);
  };

  $scope.validate = function(){

    $scope.setLogisticProductList();

    $scope.logisticOptionCodeValidation();
    $scope.logisticOptionNameValidation();
    $scope.logisticOptionDescriptionValidation();
    $scope.productListValidation();
    $scope.sequenceValidation();

    if(!$scope.errorData.hasEmptyLogisticOptionCodeError &&
        !$scope.errorData.logisticOptionCodeHasSpacesError &&
        !$scope.errorData.hasEmptyLogisticOptionNameError &&
        !$scope.errorData.hasEmptyLogisticOptionDescriptionError &&
        !$scope.errorData.hasEmptyLogisticProductListError &&
        !$scope.errorData.hasEmptySequenceError &&
        !$scope.errorData.hasInvalidSequenceError){
      $scope.save();
    }

  };

  $scope.save = function(){
    $scope.loading = true;
    $scope.logisticOption.operation = $scope.operation;
    console.log($scope.logisticOption);
    logisticOptionService.saveLogisticOption({
      logisticOption : $scope.logisticOption
    }, function(response){
      console.log(response);
      if(response.success){
        swal("Success!", response.errorMessage, "success");
        window.location.replace(applicationBasePathLocation + "/view/logistic-option-summary");
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      $scope.loading = false;
    }, function(error){
      swal('Error!', error.statusText, 'error');
      $scope.loading = false;
    });
  };


  // update section

  $scope.getLogisticOptionByCode = function(code){
    $scope.loading = true;
    console.log(code);
    logisticOptionService.getLogisticOptionByCode({
      logisticOptionCode : code
    }, function(response){
      if(response.success){
        $scope.logisticOption = response.value;
        $scope.logisticProductListInit();
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      console.log(response);
      $scope.loading = false;
    }, function(error){
      swal("Error.", error.statusText, "error");
      $scope.loading = false;
    });
  };

  if(typeof logisticOptionCode !== undefined && logisticOptionCode !== ""){
    console.log(logisticOptionCode);
    $scope.getLogisticOptionByCode(logisticOptionCode);
  }

  if(typeof operation !== undefined){
    $scope.operation = operation;
  }

}
