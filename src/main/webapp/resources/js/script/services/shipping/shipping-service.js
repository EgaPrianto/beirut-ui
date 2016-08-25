var shippingModuleService = angular.module('x.shipping-module.services', ['ngResource']);

shippingModuleService.factory('logisticOptionService', ['$resource', logisticOptionServiceFunc]);
shippingModuleService.factory('logisticProductService', ['$resource', logisticProductServiceFunc]);
shippingModuleService.factory('logisticProviderService', ['$resource', logisticProviderFunc]);
shippingModuleService.factory('businessPartnerService', ['$resource', businessPartnerServiceFunc]);
shippingModuleService.factory('categorySettingsService', ['$resource', categorySettingsServiceFunc]);

function categorySettingsServiceFunc($resource){
	var url = applicationBasePathLocation + '/api/:command';
	return $resource(url, {}, {
		getCategoryByCode: {method: 'GET', params: {command: 'get-child-category-by-category-code'}, data: {categoryCode:'@categoryCode'}},
		getCategorySettings: {method: 'GET', params: {command: 'get-category-settings'}},
		saveCategorySettings: {method: 'POST', params : {command : 'save-category-settings'}}
	});
}

function businessPartnerServiceFunc($resource){
	var url = applicationBasePathLocation + '/api/:command';
	return $resource(url, {}, {
		getMerchantByMerchantName: {method: 'GET', params: {command: 'find-merchant-by-merchant-name'}, data: {merchantName:'@merchantName'}}
	});
}

function logisticOptionServiceFunc($resource) {
  var url = applicationBasePathLocation + '/api/:command';
  return $resource(url, {}, {
    getAllLogisticOptions: {method: 'GET', params: {command: 'get-all-logistic-options'}, data: {page:'@page', size:'@size', property:'@property', direction:'@direction'}},
    saveLogisticOption: {method: 'POST', params: {command: 'save-logistic-option'}, data: {logisticOption:'@logisticOption'}},
    getLogisticOptionByCode: {method: 'GET', params: {command: 'get-logistic-option'}, data: {logisticOptionCode:'@logisticOptionCode'}},
    deleteLogisticOption: {method: 'POST', params: {command: 'delete-logistic-option'}, data: {id: '@id'}},
    activateLogisticOption: {method: 'POST', params: {command: 'activate-logistic-option'}, data: {logisticOptionCode: '@logisticOptionCode'}},
    deactivateLogisticOption: {method: 'POST', params: {command: 'deactivate-logistic-option'}, data: {logisticOptionCode: '@logisticOptionCode'}}
  });
}

function logisticProductServiceFunc($resource) {
  var url = applicationBasePathLocation + '/api/:command';
  return $resource(url, {}, {
    getAllLogisticProducts: {method: 'GET', params : {command : 'get-all-logistic-products'}, data: {page:'@page', size:'@size', property:'@property', direction:'@direction'}},
    saveLogisticProducts: {method: 'POST', params : {command : 'save-logistic-product'}, data: {logisticProduct:'@logisticProduct'}},
    getLogisticProductByCode: {method: 'GET', params: {command: 'get-logistic-product'}, data: {logisticProductCode:'@logisticProductCode'}},
    deleteLogisticProduct: {method: 'POST', params: {command: 'delete-logistic-product'}, data: {id: '@id'}},
    activateLogisticProduct: {method: 'POST', params: {command: 'activate-logistic-product'}, data: {logisticProductCode: '@logisticProductCode'}},
    deactivateLogisticProduct: {method: 'POST', params: {command: 'deactivate-logistic-product'}, data: {logisticProductCode: '@logisticProductCode'}},
    getAllLogisticUploadDataStatus: {method: 'GET', params: {command: 'get-all-logistic-upload-data-status'}, data: {page:'@page', size:'@size', property:'@property', direction:'@direction'}},
    getCategoryByLogisticProductCode: {method: 'GET', params: {command: 'get-category-by-logistic-product-code'}, data: {logisticProductCode: '@logisticProductCode'}}
  });
}

function logisticProviderFunc($resource) {
  var url = applicationBasePathLocation + '/api/:command';
  return $resource(url, {}, {
    getAllLogisticProviderCountersByDate: {method: 'POST', params : {command : 'find-logistic-provider-counter'}, data: {date:'@date'}},
    getLogisticProviderReportLog: {method: 'GET', params : {command : 'find-logistic-provider-report-log'}, data: {page:'@page', size:'@size', property:'@property', direction:'@direction'}}
  });
}
