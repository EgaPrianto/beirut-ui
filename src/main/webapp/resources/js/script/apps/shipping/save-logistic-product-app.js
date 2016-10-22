var app = angular.module('x.shipping.save-logistic-product-angularApp', [
  'x.shipping.logistic-product-module.controllers',
  'x.shipping-module.services',
  'x.eventListener-module.directives',
  'x.inputValidator-module.directives',
  'x.droppableListener-module.directives',
  'blistrap',
  'ui.bootstrap'])
  .config(function(ivhTreeviewOptionsProvider) {
	  ivhTreeviewOptionsProvider.set({
		  idAttribute: 'categoryCode',
		  labelAttribute: 'name',
		  childrenAttribute: 'child',
		  useCheckboxes : false,
		  twistieCollapsedTpl : '<i class="bli bli-caret-right"></i>',
		  twistieExpandedTpl : '<i class="bli bli-caret-down"></i>',
		  twistieLeafTpl : '<i class="bli bli-dot"></i>'
	  });
  });