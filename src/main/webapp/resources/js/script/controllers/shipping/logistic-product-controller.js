var logisticProductModuleController = angular.module('x.shipping.logistic-product-module.controllers', []);

logisticProductModuleController.controller('logisticProductSummary.ctrl', ['$scope', '$window', '$modal', 'logisticProductService', logisticProductSummaryModuleCtrlFunc]);
logisticProductModuleController.controller('shippingSaveLogisticProduct.ctrl', ['$scope', '$http', '$modal', 'logisticProductService', 'businessPartnerService', 'categorySettingsService', shippingSaveLogisticProductModuleCtrlFunc]);
logisticProductModuleController.controller('logisticUploadDataStatus.ctrl', ['$scope', 'logisticProductService', logisticUploadDataStatusCtrlFunc]);

if (!Array.prototype.remove) {
  Array.prototype.remove = function (val) {
    var i = this.indexOf(val);
    return i > -1 ? this.splice(i, 1) : [];
  };
}

if (!Array.prototype.isExistElement) {
  Array.prototype.isExistElement = function (val) {
    for (var i = this.length - 1; i >= 0; i--) {
      if (this[i] === val)
        return true;
    }
    return false;
  };
}

function logisticProductSummaryModuleCtrlFunc($scope, $window, $modal, logisticProductService){
  $scope.currentPage = 1;
  $scope.size = 10;
  $scope.numPages = $scope.totalRecords / $scope.size;
  $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
  $scope.totalRecords = 0;

  $scope.getPage = function (page) {
    $scope.currentPage = page;
    $scope.getAllLogisticProducts();
  };
  $scope.setPage = function (pageNo) {
    $scope.currentPage = pageNo;
  };
  $scope.pageChanged = function () {
    $scope.getAllLogisticProducts();
    $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
  };

  $scope.getAllLogisticProducts = function(){
    $scope.loading = true;
    logisticProductService.getAllLogisticProducts({
      page : $scope.currentPage - 1,
      size : $scope.size,
      property : 'logisticProductCode',
      direction : 'asc'
    }, function(response){
      if(response.success){
        $scope.logisticProducts = response.content;
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

  $scope.getAllLogisticProducts();

  $scope.deleteLogisticProduct = function(logisticProduct){
    $scope.loading = true;
    logisticProductService.deleteLogisticProduct({
      id : logisticProduct.logisticProductCode
    }, function(response){
      if(response.success){
        swal("Deleted!", "Logistic Product named " + logisticProduct.logisticProductName + " has" +
            " been deleted.", "success");
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      $scope.getAllLogisticProducts();
    }, function(error){
      swal('Error!', error.statusText, 'error');
      $scope.loading = false;
    });
  };

  $scope.openDeletion = function(logicticProduct){
    swal({
      title: "Are you sure?",
      text: "You will not be able to recover this Logistic Product "+logicticProduct.logisticProductName+"!",
      type: "warning",
      showCancelButton: true,
      confirmButtonColor: "#DD6B55",
      confirmButtonText: "Yes, delete it!",
      closeOnConfirm: false },
      function(){
        $scope.deleteLogisticProduct(logicticProduct);
      });
  };

  $scope.activateLogisticProduct = function(logisticProduct){
    $scope.loading = true;
    logisticProductService.activateLogisticProduct({
      logisticProductCode : logisticProduct.logisticProductCode
    }, function(response){
      if(response.success){
        swal("Activated!", "Logistic Product named " + logisticProduct.logisticProductName + " has" +
            " been activated.", "success");
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      $scope.getAllLogisticProducts();
    }, function(error){
      swal('Error!', error.statusText, 'error');
      $scope.loading = false;
    });
  };

  $scope.openActivation = function(logicticProduct){
    swal({
          title: "Are you sure?",
          text: "You are going to activate this Logistic Product "+logicticProduct.logisticProductName+"!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "Yes, activate it!",
          closeOnConfirm: false },
        function(){
          $scope.activateLogisticProduct(logicticProduct);
        });
  };

  $scope.deactivateLogisticProduct = function(logisticProduct){
    $scope.loading = true;
    logisticProductService.deactivateLogisticProduct({
      logisticProductCode : logisticProduct.logisticProductCode
    }, function(response){
      if(response.success){
        swal("Deactivated!", "Logistic Product named " + logisticProduct.logisticProductName + " has" +
            " been deactivated.", "success");
      } else {
        swal("Failed!", response.errorMessage, "error");
      }
      $scope.getAllLogisticProducts();
    }, function(error){
      swal('Error!', error.statusText, 'error');
      $scope.loading = false;
    });
  };

  $scope.openDeactivation = function(logicticProduct){
    swal({
          title: "Are you sure?",
          text: "You are going to deactivate this Logistic Product "+logicticProduct.logisticProductName+"!",
          type: "warning",
          showCancelButton: true,
          confirmButtonColor: "#DD6B55",
          confirmButtonText: "Yes, deactivate it!",
          closeOnConfirm: false },
        function(){
          $scope.deactivateLogisticProduct(logicticProduct);
        });
  };

}

function shippingSaveLogisticProductModuleCtrlFunc($scope, $http, $modal, logisticProductService, businessPartnerService, categorySettingsService){
  $scope.errorData = {};

  // Step handling begin
  $scope.steps = [1, 2];
  $scope.step = 0;

  $scope.isFirstStep = function () {
    return $scope.step === 0;
  };

  $scope.isLastStep = function () {
    return $scope.step === ($scope.steps.length - 1);
  };

  $scope.isCurrentStep = function (step) {
    return $scope.step === step;
  };

  $scope.setCurrentStep = function (step) {
    $scope.step = step;
  };

  $scope.getCurrentStep = function () {
    return $scope.steps[$scope.step];
  };

  $scope.getNextLabel = function () {
    return ($scope.isLastStep()) ? 'Done' : 'Next';
  };

  $scope.handlePrevious = function () {
    if($scope.isFirstStep()){
      $scope.step -= ($scope.isFirstStep()) ? 0 : 1;
      history.back();
    } else {
      $scope.step -= ($scope.isFirstStep()) ? 0 : 1;
    }
  };

  $scope.handleNext = function() {

    if ($scope.isLastStep()) {
      console.log('is Last Step submit form');
      $scope.dismiss();
    } else if($scope.isFirstStep()){
      $scope.saveLogisticProduct();
      $scope.next();
    } else {
      console.log('is Not Last Step');
      $scope.next();
    }
  };

  $scope.next = function() {
    $scope.step += 1;
  }

  // Step handling end


  // Step 1 start -- create logistic product

  $scope.logisticProduct = {
    pickupFlag : true,
    dropshipFlag : false,
    listPaymentRule : ['EARLY_DEPOSIT']
  };
  
  $scope.listAllowedMerchantData = [];
  $scope.listRestrictedMerchantData = [];

  $scope.paymentRule = [
    { value : 'EARLY_DEPOSIT', name : 'Early Deposit', flag : true},
    { value : 'LATE_DEPOSIT', name : 'Late Deposit', flag : false}
  ];
  
  $scope.listCommissionType = [
   {value: 'RB', text: 'RB - Rebate', checked: false}, {value: 'CC', text: 'CC - Commission Consignment', checked: false},
   {value: 'TD', text: 'TD - Trading', checked: false}, {value: 'MP', text: 'MP - Merchant Partner', checked: false},
   {value: 'RC', text: 'RC - Rebate Consignment', checked: false}, {value: 'CM', text: 'CM - Commission', checked: false},
   {value: 'TC', text: 'TC - Trading Consignment', checked: false}
  ];

  $scope.listCategorySetting = [];
  $scope.listCategoryInsert = [];
  $scope.listCategoryDelete = [];
  $scope.categoryCodeSelected = [];
  $scope.categoryCodeSelectedDB = [];
  
  $scope.addPaymentRule = function(flow){
    if($scope.logisticProduct.listPaymentRule.isExistElement(flow.value)){
      $scope.logisticProduct.listPaymentRule.remove(flow.value);
    } else {
      $scope.logisticProduct.listPaymentRule.push(flow.value);
    }

    $scope.listPaymentRuleValidation();
  };

  $scope.togglePickupFlag = function(){
    $scope.logisticProduct.pickupFlag = !$scope.logisticProduct.pickupFlag;
    $scope.shippingTypeValidation();
  };

  $scope.toggleDropshipFlag = function(){
    $scope.logisticProduct.dropshipFlag = !$scope.logisticProduct.dropshipFlag;
    $scope.shippingTypeValidation();
  };

  $scope.logisticProductCodeValidation = function(){
    $scope.errorData.hasEmptyLogisticOptionProductCodeError = $scope.logisticProduct.logisticProductCode == undefined || $scope.logisticProduct.logisticProductCode == '';
    $scope.errorData.logisticOptionProductHasSpacesError = /\s/g.test($scope.logisticProduct.logisticProductCode);
  };

  $scope.logisticProductNameValidation = function(){
    $scope.errorData.hasEmptyLogisticOptionProductNameError = $scope.logisticProduct.logisticProductName == undefined || $scope.logisticProduct.logisticProductName == '';
  };

  $scope.specialHandlingCostValidation = function(){
    $scope.errorData.hasEmptySpecialHandlingCostError = $scope.logisticProduct.specialHandlingCost == undefined;
    $scope.errorData.hasInvalidSpecialHandlingCostError = $scope.logisticProduct.specialHandlingCost < 0;
  };

  $scope.insuranceCostFormulaValidation = function(){
    $scope.errorData.hasEmptyInsuranceCostFormulaError = $scope.logisticProduct.insuranceCostFormula == undefined || $scope.logisticProduct.insuranceCostFormula == '';
  };

  $scope.insuredAmountFormulaValidation = function(){
    $scope.errorData.hasEmptyInsuredAmountFormulaError = $scope.logisticProduct.insuredAmountFormula == undefined || $scope.logisticProduct.insuredAmountFormula == '';
  };

  $scope.normalShippingCostFormulaValidation = function(){
    $scope.errorData.hasEmptyNormalShippingCostFormulaError = $scope.logisticProduct.normalShippingCostFormula == undefined || $scope.logisticProduct.normalShippingCostFormula == '';
  };

  $scope.specialHandlingFormulaValidation = function(){
    $scope.errorData.hasEmptySpecialHandlingFormulaError = $scope.logisticProduct.specialHandlingFormula == undefined || $scope.logisticProduct.specialHandlingFormula == '';
  };

  $scope.maxDangerousLevelValidation = function(){
    $scope.errorData.hasEmptyMaxDangerousLevelError = $scope.logisticProduct.maxDangerousLevel == undefined || $scope.logisticProduct.maxDangerousLevel === '';
    $scope.errorData.hasInvalidMaxDangerousLevelError = $scope.logisticProduct.maxDangerousLevel < 0;
  };

  $scope.minWeightPerPackageInKgValidation = function(){
    $scope.errorData.hasEmptyMinWeightPerPackageInKgError = $scope.logisticProduct.minWeightPerPackageInKg == undefined || $scope.logisticProduct.minWeightPerPackageInKg === '';
    $scope.errorData.hasInvalidMinWeightPerPackageInKgError = $scope.logisticProduct.minWeightPerPackageInKg < 0;
  };

  $scope.priorityValidation = function(){
    $scope.errorData.hasEmptyPriorityError = $scope.logisticProduct.priority == undefined || $scope.logisticProduct.priority === '';
    $scope.errorData.hasInvalidPriorityError = $scope.logisticProduct.priority < 0;
  };

  $scope.maxWeightPerPackageInKgValidation = function(){
    $scope.errorData.hasEmptyMaxWeightPerPackageInKgError = $scope.logisticProduct.maxWeightPerPackageInKg == undefined || $scope.logisticProduct.maxWeightPerPackageInKg === '';
    $scope.errorData.hasInvalidMaxWeightPerPackageInKgError = $scope.logisticProduct.maxWeightPerPackageInKg < 0;
  };

  $scope.maxOrderItemCapacityPerDayValidation = function(){
    $scope.errorData.hasEmptyMaxOrderItemCapacityPerDayError = $scope.logisticProduct.maxOrderItemCapacityPerDay == undefined || $scope.logisticProduct.maxOrderItemCapacityPerDay === '';
    $scope.errorData.hasInvalidMaxOrderItemCapacityPerDayError = $scope.logisticProduct.maxOrderItemCapacityPerDay < 0;
  };

  $scope.listPaymentRuleValidation = function(){
    $scope.errorData.hasEmptyListPaymentRuleError = $scope.logisticProduct.listPaymentRule.length < 1;
  };

  $scope.shippingTypeValidation = function(){
    console.log("validate pickup " + $scope.logisticProduct.pickupFlag);
    console.log("validate dropship " + $scope.logisticProduct.dropshipFlag);
    $scope.errorData.hasEmptyShippingTypeError = !$scope.logisticProduct.pickupFlag && !$scope.logisticProduct.dropshipFlag;
  };

  $scope.saveLogisticProduct = function(){
    $scope.loading = true;
    $scope.logisticProduct.operation = operation;
    console.log($scope.logisticProduct);
    var response = logisticProductService.saveLogisticProducts({
      logisticProduct : $scope.logisticProduct,
      listCategoryInsert: $scope.listCategoryInsert,
      listCategoryDelete: $scope.listCategoryDelete
    }, function(response){
      console.log(response);
      $scope.loading = false;
      return response.success;
    });
    return response.success;
  };

  $scope.getLogisticProductByCode = function(code){
    $scope.loading = true;
    logisticProductService.getLogisticProductByCode({
      logisticProductCode : code
    }, function(response){
      if(response.success){
        $scope.logisticProduct = response.value;
        $scope.initLogisticProduct();
        for(var i=0; i < $scope.paymentRule.length; i++){
        	if($scope.logisticProduct.listPaymentRule.indexOf($scope.paymentRule[i].value) > -1){
        		$scope.paymentRule[i].flag = true;
        	}
        }
        for(var i=0; i < $scope.listCommissionType.length; i++){
            if($scope.logisticProduct.listCommissionType.indexOf($scope.listCommissionType[i].value) > -1){
                $scope.listCommissionType[i].checked = true;
            }
        }
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
  
  $scope.getCategoryByLogisticProductCode = function(code){
    $scope.loading = true;
    logisticProductService.getCategoryByLogisticProductCode({
      logisticProductCode : code
    }, function(response){
      if(response.success){
    	  $scope.listCategorySetting = response.content;
          for(var i=0; i < response.content.length; i++){
        	  $scope.categoryCodeSelected.push(response.content[i].categoryCode);
        	  $scope.categoryCodeSelectedDB.push(response.content[i].categoryCode);
          }
      }
      console.log(response);
      $scope.loading = false;
    }, function(error){
      swal("Error.", error.statusText, "error");
      $scope.loading = false;
    });
  };
  
  $scope.getCategoryByCode = function(categoryCode){
    $scope.loading = true;
    categorySettingsService.getCategoryByCode({
      categoryCode : categoryCode
    }, function(response){
      if(response.success){
    	for(var i=0; i < response.content.length; i++){
    		if(response.content[i].childCount > 0) {
    			response.content[i].child = [{}];
    		}
    		response.content[i].type = "categoryNode";
    	}
		$scope.categoryNodes = response.content;
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

  $scope.initLogisticProduct = function() {
	  if($scope.logisticProduct.listCommissionType == undefined) {
      	$scope.logisticProduct.listCommissionType = [];
      }
      if($scope.logisticProduct.listAllowedMerchantId == undefined) {
      	$scope.logisticProduct.listAllowedMerchantId = [];
      }
      if($scope.logisticProduct.listRestrictedMerchantId == undefined) {
      	$scope.logisticProduct.listRestrictedMerchantId = [];
      }
      if($scope.logisticProduct.listAllowedMerchantData == undefined) {
    	  $scope.logisticProduct.listAllowedMerchantData = [];
	  }
      if($scope.logisticProduct.listRestrictedMerchantData == undefined) {
    	  $scope.logisticProduct.listRestrictedMerchantData = [];
      }
  }
  
  if(typeof logisticProductCode !== undefined && logisticProductCode !== ""){
	  // update
	  $scope.getLogisticProductByCode(logisticProductCode);
	  $scope.getCategoryByLogisticProductCode(logisticProductCode);
  } else {
	  // insert
	  $scope.initLogisticProduct();
	  // initialize formula - hardcoded
	  if($scope.logisticProduct.specialHandlingCost == undefined) {
		  $scope.logisticProduct.specialHandlingCost = 0;
	  }
	  if($scope.logisticProduct.insuranceCostFormula == undefined) {
		  $scope.logisticProduct.insuranceCostFormula = '${(insuredAmount * 0.002)?c}';
	  }
	  if($scope.logisticProduct.insuredAmountFormula == undefined) {
		  $scope.logisticProduct.insuredAmountFormula = '${((productPrice * quantity) + shippingCost)?c}';
	  }
	  if($scope.logisticProduct.normalShippingCostFormula == undefined) {
		  $scope.logisticProduct.normalShippingCostFormula = '${(pricePerMinWeight3pl+((totalShippingWeight-minWeightInKg3pl)*pricePerKg))?c}';
	  }
	  if($scope.logisticProduct.specialHandlingFormula == undefined) {
		  $scope.logisticProduct.specialHandlingFormula = '${((3/2 * shippingCost) + (quantity * ' + $scope.logisticProduct.specialHandlingCost + '))?c}';
	  }
  }

  $scope.getCategoryByCode(null);
  
  if(typeof operation !== undefined){
    $scope.operation = operation;
  }

  // Step 1 end -- create logistic product

  // initialize formula - hardcoded
  if($scope.logisticProduct.specialHandlingCost == undefined) {
	  $scope.logisticProduct.specialHandlingCost = 0;
  }
  if($scope.logisticProduct.insuranceCostFormula == undefined) {
	  $scope.logisticProduct.insuranceCostFormula = '${(insuredAmount * 0.002)?c}';
  }
  if($scope.logisticProduct.insuredAmountFormula == undefined) {
	  $scope.logisticProduct.insuredAmountFormula = '${((productPrice * quantity) + shippingCost)?c}';
  }
  if($scope.logisticProduct.normalShippingCostFormula == undefined) {
	  $scope.logisticProduct.normalShippingCostFormula = '${(pricePerMinWeight3pl+((totalShippingWeight-minWeightInKg3pl)*pricePerKg))?c}';
  }
  if($scope.logisticProduct.specialHandlingFormula == undefined) {
	  $scope.logisticProduct.specialHandlingFormula = '${((3/2 * shippingCost) + (quantity * ' + $scope.logisticProduct.specialHandlingCost + '))?c}';
  }
  
  $scope.specialHandlingCostKeyUp = function() {
	  if($scope.operation === 'insert') {
		  $scope.logisticProduct.specialHandlingFormula = '${((3/2 * shippingCost) + (quantity * ' + $scope.logisticProduct.specialHandlingCost + '))?c}';
	  }
  };
  
  // Step 2 start -- upload detail shipping cost
  $scope.data = {};
  $scope.newDataVersion = true;

  $scope.setNewDataVersionFlag = function(value){
    $scope.newDataVersion = value;
  };

  $scope.openUploadConfirmation = function(){
    $scope.errorData.hasEmptyFileUploadError = false;
    if($scope.data.logisticProductDetailShippingCost === undefined){
      $scope.errorData.hasEmptyFileUploadError = true;
    } else {
      swal({
            title: "Are you sure still want to upload this file?",
            text: "We do recommend you not to upload this file during flash sale.",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, upload it!",
            closeOnConfirm: false
          },
          function () {
            $scope.uploadShipping();
          });
    }
  };

  $scope.uploadShipping = function(){
    $scope.loading = true;
    var url = applicationBasePathLocation + '/api/upload-detail-shipping-cost';

    var formData = new FormData();
    formData.append("logisticProductCode", $scope.logisticProduct.logisticProductCode);
    formData.append("newDataVersion", $scope.newDataVersion);
    formData.append("file", $scope.data.logisticProductDetailShippingCost);

    $http({
      method: 'POST',
      url: url,
      headers: {'Content-Type': undefined},
      data: formData,
      transformRequest: function (data, headersGetterFunction) {
        return data;
      }
    }).success(function (response) {
      console.log(response);
      if(response.success) {
        swal({
            title: "Your file is being uploaded...",
            text: "Please check <a href='" + applicationBasePathLocation + "/view/logistic-upload-data-status'>Logistic Upload Data Status</a> page for its upload status.",
            html: true
        }, function(){
          window.location.replace(applicationBasePathLocation + "/view/logistic-product-summary");
        });
      } else {
        swal("Failed", response.errorCode, "error");
      }
      $scope.loading = false;
    }).error(function(error){
      swal('Error!', error.statusText, 'error');
      $scope.loading = false;
    });
  };
  // Step 2 end -- upload detail shipping cost
  	$scope.toggleCommissionType = function(value) {
  		var idx = $scope.logisticProduct.listCommissionType.indexOf(value);
  	    if (idx > -1) {
  	      $scope.logisticProduct.listCommissionType.splice(idx, 1);
  	    }  else {
  	      $scope.logisticProduct.listCommissionType.push(value);
  	    }
  	};
  
  	$scope.addAllowedMerchantData = function(){
  		$scope.errorData.hasEmptyAllowedMerchantName = false;
  		$scope.errorData.hasAlreadyExistsAllowedMerchantName = false;

  		if($scope.allowedMerchantData == undefined || $scope.allowedMerchantData == ""){
			$scope.errorData.hasEmptyAllowedMerchantName = true;
  		} else if($scope.logisticProduct.listAllowedMerchantId.indexOf($scope.allowedMerchantData.id) != -1){
			$scope.errorData.hasAlreadyExistsAllowedMerchantName = true;
  		} else {
	  		$scope.logisticProduct.listAllowedMerchantData.push($scope.allowedMerchantData);
	  		$scope.logisticProduct.listAllowedMerchantId.push($scope.allowedMerchantData.id);
	  		$scope.allowedMerchantData = "";
	  	}
	};
	
	$scope.deleteAllowedMerchantName = function(idx){
		$scope.logisticProduct.listAllowedMerchantData.splice(idx, 1);
		$scope.logisticProduct.listAllowedMerchantId.splice(idx, 1);
	};
	
  	$scope.addRestrictedMerchantData = function(){
  		$scope.errorData.hasEmptyRestrictedMerchantName = false;
  		$scope.errorData.hasAlreadyExistsRestrictedMerchantName = false;

  		if($scope.restrictedMerchantData == undefined || $scope.restrictedMerchantData == ""){
			$scope.errorData.hasEmptyRestrictedMerchantName = true;
  		} else if($scope.logisticProduct.listRestrictedMerchantId.indexOf($scope.restrictedMerchantData.id) != -1){
			$scope.errorData.hasAlreadyExistsRestrictedMerchantName = true;
  		} else {
	  		$scope.logisticProduct.listRestrictedMerchantData.push($scope.restrictedMerchantData);
	  		$scope.logisticProduct.listRestrictedMerchantId.push($scope.restrictedMerchantData.id);
	  		$scope.restrictedMerchantData = "";
	  	}
	};
	
	$scope.deleteRestrictedMerchantName = function(idx){
		$scope.logisticProduct.listRestrictedMerchantData.splice(idx, 1);
		$scope.logisticProduct.listRestrictedMerchantId.splice(idx, 1);
	};
	
	$scope.searchMerchant = function (search) {
        return $http({
            method: 'GET',
            url: applicationBasePathLocation + '/api/find-merchant-by-merchant-name?merchantName=' + search
        }).then(function ($response) {
            return $response.data;
        });
    };
    
    $scope.addCategoryNode = function (node) {
    	if(node == undefined) {
    		return;
    	}
    	if($scope.categoryCodeSelected.isExistElement(node.categoryCode)) {
    		$scope.errorData.hasAlreadyExistsCategory = true;
    		return;
    	}
    	node.specialHandling = true;
    	$scope.categoryCodeSelected.push(node.categoryCode);
    	$scope.listCategorySetting.push(node);
    	if(!$scope.categoryCodeSelectedDB.isExistElement(node.categoryCode)) {
    		$scope.listCategoryInsert.push(node);
    	}
    	$scope.errorData.hasAlreadyExistsCategory = false;
    };
    
    $scope.deleteCategoryNode = function(idx){
    	var node = $scope.listCategorySetting[idx];
    	if($scope.categoryCodeSelectedDB.isExistElement(node.categoryCode)) {
    		$scope.listCategoryDelete.push(node.categoryCode);
    	}
    	for(var i = 0; i < $scope.listCategoryInsert.length; i++) {
    		if($scope.listCategoryInsert[i].categoryCode == node.categoryCode) {
    			$scope.listCategoryInsert.splice(i, 1);
    		}
    	}
		$scope.categoryCodeSelected.splice(idx, 1);
		$scope.listCategorySetting.splice(idx, 1);
	};
	
	$scope.categoryTreeviewDblClick = function(event) {
		var node = angular.fromJson(event.target.dataset.node);
		this.addCategoryNode(node);
	};
	
	$scope.categoryTreeviewClearAll = function() {
		while($scope.listCategorySetting.length > 0) {
			$scope.deleteCategoryNode(0);
		}
		$scope.errorData.hasAlreadyExistsCategory = false;
	};
	
	$scope.categoryTreeviewClick = function(node, tree) {
	    if(node.childCount > 0 && !node.__ivhTreeviewExpanded && node.child[0].categoryCode == undefined) {
	    	$scope.loading = true;
	    	categorySettingsService.getCategoryByCode({
	          categoryCode : node.id
	        }, function(response){
	          if(response.success){
	        	for(var i=0; i < response.content.length; i++){
	        		if(response.content[i].childCount > 0) {
	        			response.content[i].child = [{}];
	        		}
	        		response.content[i].type = "categoryNode";
	        	}
	        	node.child = response.content;
	          } else {
	            swal("Failed!", response.errorMessage, "error");
	          }
	          console.log(response);
	          $scope.loading = false;
	        }, function(error){
	          swal("Error.", error.statusText, "error");
	          $scope.loading = false;
	        });
	    }
	};
}

function logisticUploadDataStatusCtrlFunc($scope, logisticProductService){
  $scope.currentPage = 1;
  $scope.size = 10;
  $scope.numPages = $scope.totalRecords / $scope.size;
  $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
  $scope.totalRecords = 0;

  $scope.getPage = function (page) {
    $scope.currentPage = page;
    $scope.getAllLogisticUploadDataStatus();
  };
  $scope.setPage = function (pageNo) {
    $scope.currentPage = pageNo;
  };
  $scope.pageChanged = function () {
    $scope.getAllLogisticUploadDataStatus();
    $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
  };

  $scope.getAllLogisticUploadDataStatus = function(){
    $scope.loading = true;
    logisticProductService.getAllLogisticUploadDataStatus({
      page : $scope.currentPage - 1,
      size : $scope.size,
      property : 'uploadDate',
      direction : 'desc'
    }, function(response){
      if(response.success){
        $scope.logisticUploadDataStatus = response.content;
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

  $scope.getAllLogisticUploadDataStatus();
}

