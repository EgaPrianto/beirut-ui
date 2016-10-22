var categorySettingsController = angular.module('x.shipping.category-settings-module.controllers', []);

categorySettingsController.controller('shippingSaveLogisticProduct.ctrl', ['$scope', '$http', '$modal', 'categorySettingsService', categorySettingsModuleCtrlFunc]);

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

function categorySettingsModuleCtrlFunc($scope, $http, $modal, categorySettingsService){
  $scope.errorData = {};
  $scope.listCategorySetting = [];
  $scope.listCategoryInsert = [];
  $scope.listCategoryDelete = [];
  $scope.categoryCodeSelected = [];
  $scope.categoryCodeSelectedDB = [];
  
  $scope.saveSettings = function(){
    $scope.loading = true;
    console.log($scope.logisticProduct);
    var response = categorySettingsService.saveCategorySettings({
      listCategoryInsert: $scope.listCategoryInsert,
      listCategoryDelete: $scope.listCategoryDelete
    }, function(response){
      console.log(response);
      $scope.loading = false;
      if(response.success){
    	  swal("Success!", response.errorMessage, "success");
      } else {
    	  swal("Failed!", response.errorMessage, "error");
      }
    });
    return response.success;
  };
  
  $scope.getCategorySettings = function(){
    $scope.loading = true;
    categorySettingsService.getCategorySettings(function(response){
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

  	$scope.getCategoryByCode(null);
  	$scope.getCategorySettings();
  
    $scope.addCategoryNode = function (node) {
    	if(node == undefined) {
    		return;
    	}
    	if($scope.categoryCodeSelected.isExistElement(node.categoryCode)) {
    		$scope.errorData.hasAlreadyExistsCategory = true;
    		return;
    	}
    	node.directFlight = true;
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