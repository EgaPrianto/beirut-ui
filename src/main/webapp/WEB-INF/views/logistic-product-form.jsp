<div ng-app="x.shipping.save-logistic-product-angularApp"
     ng-controller="shippingSaveLogisticProduct.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-3">
                <a href="${applicationBasePathLocation}/view/logistic-product-summary">Logistic Product List</a>
        </div>
        <div class="col-sm-1 col-sm-offset-8">
            <a href="${applicationBasePathLocation}/j_spring_cas_security_logout">Logout</a>
        </div>
    </div>

    <div class="row">
        <h1>Create Logistic Product</h1>
    </div>

    <div class="panel-body">
        <div class="slide-frame">

            <div ng-show="getCurrentStep() == '1'" class="wave">
                <div class="row">
                    <form class="form-horizontal col-sm-10 col-sm-offset-1">
                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyLogisticOptionProductCodeError">
                                        Required field cannot be empty.</span>
                                    <span class="validation-error pull-right"
                                        ng-show="errorData.logisticOptionProductHasSpacesError">
                                        Logistic Product Code must not contain any spaces.</span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Logistic Product Code<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Logistic ID yang akan dibuat harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <input required ng-disabled="operation!=='insert'"
                                       ng-model="logisticProduct.logisticProductCode"
                                       class="form-control"
                                       custom-onblur="logisticProductCodeValidation()">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyLogisticOptionProductNameError">
                                        Required field cannot be empty </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Logistic Product Name<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <input required ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.logisticProductName" class="form-control"
                                       custom-onblur="logisticProductNameValidation()">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptySpecialHandlingCostError">
                                        Required field cannot be empty </span>
                                    <span class="validation-error pull-right"
                                        ng-show="errorData.hasInvalidSpecialHandlingCostError">
                                        Special Handling Cost must be 0 or greater </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Special Handling Cost<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <input required ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.specialHandlingCost" class="form-control"
                                       custom-onblur="specialHandlingCostValidation()" only-digits
                                       blur-to-currency amount="logisticProduct.specialHandlingCost"
                                       ng-keyup="specialHandlingCostKeyUp()"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyInsuranceCostFormulaError">
                                        Required field cannot be empty </span>
                                    <span class="validation-error pull-right"
                                        ng-show="errorData.hasExistAdjustmentNameError">
                                        Logistic Option ID is not available </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Insurance Cost Formula<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <input required name="adjustmentName" ng-readonly="operation==='insert'" ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.insuranceCostFormula" class="form-control"
                                       custom-onblur="insuranceCostFormulaValidation()"/>
                            </div>

                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyInsuredAmountFormulaError">
                                        Required field cannot be empty </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Insured Amount Formula<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <input required ng-readonly="operation==='insert'" ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.insuredAmountFormula" class="form-control"
                                       custom-onblur="insuredAmountFormulaValidation()">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyNormalShippingCostFormulaError">
                                        Required field cannot be empty </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Normal Shipping Cost Formula<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <input required ng-readonly="operation==='insert'" ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.normalShippingCostFormula" class="form-control"
                                       custom-onblur="normalShippingCostFormulaValidation()">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptySpecialHandlingFormulaError">
                                        Required field cannot be empty </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Special Handling Formula<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <input required ng-readonly="operation==='insert'" ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.specialHandlingFormula" class="form-control"
                                       custom-onblur="specialHandlingFormulaValidation()">
                            </div>
                        </div>

                        <div class="form-group col-sm-6">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyMaxDangerousLevelError">
                                        Required field cannot be empty </span>
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasInvalidMaxDangerousLevelError">
                                        Max Dangerous Level must be 0 or greater </span>
                                </div>
                            </div>
                            <label class="col-sm-4 control-label">
                                Max Dangerous Level<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-8">
                                <input required ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.maxDangerousLevel" class="form-control"
                                       custom-onblur="maxDangerousLevelValidation()" type="number" min="0">
                            </div>
                        </div>

                        <div class="form-group col-sm-6">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyMinWeightPerPackageInKgError">
                                        Required field cannot be empty </span>
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasInvalidMinWeightPerPackageInKgError">
                                        Min Weight Per Package must be 0 or greater </span>
                                </div>
                            </div>
                            <label class="col-sm-4 control-label">
                                Min Weight Per Package<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-8">
                                <input required name="adjustmentName" ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.minWeightPerPackageInKg" class="form-control"
                                       custom-onblur="minWeightPerPackageInKgValidation()" type="number" min="0">
                            </div>
                        </div>

                        <div class="form-group col-sm-6">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyPriorityError">
                                        Required field cannot be empty </span>
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasInvalidPriorityError">
                                        Priority must be 0 or greater </span>
                                </div>
                            </div>
                            <label class="col-sm-4 control-label">
                                Priority<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-8">
                                <input required ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.priority" class="form-control"
                                       custom-onblur="priorityValidation()" type="number" min="0">
                            </div>
                        </div>

                        <div class="form-group col-sm-6">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyMaxWeightPerPackageInKgError">
                                        Required field cannot be empty </span>
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasInvalidMaxWeightPerPackageInKgError">
                                        Max Weight Per Package must be 0 or greater </span>
                                </div>
                            </div>
                            <label class="col-sm-4 control-label">
                                Max Weight Per Package<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-8">
                                <input required ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.maxWeightPerPackageInKg" class="form-control"
                                       custom-onblur="maxWeightPerPackageInKgValidation()" type="number" min="0">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyMaxOrderItemCapacityPerDayError">
                                        Required field cannot be empty </span>
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasInvalidMaxOrderItemCapacityPerDayError">
                                        Max Order Item Capacity Per Day must be 0 or greater </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Max Order Item Capacity Per Day<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <input required ng-disabled="operation==='view'"
                                       ng-model="logisticProduct.maxOrderItemCapacityPerDay" class="form-control"
                                       custom-onblur="maxOrderItemCapacityPerDayValidation()" type="number" min="0">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-6">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyListPaymentRuleError">
                                        Required field cannot be empty </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Payment Rule<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <div ng-show="operation!='view'"  class="btn-group" data-toggle="buttons"
                                     ng-repeat="flow in paymentRule">
                                    <label class="btn btn-default"
                                           ng-class="{'active':flow.flag}"
                                           ng-click="addPaymentRule(flow)"
                                           ng-hide="operation==='view'">
                                        <input type="checkbox" ng-bind="flow.flag"> {{flow.name}}
                                    </label>
                                </div>
                                <ul ng-show="operation==='view'" style="padding-left: 15px;">
                                	<li ng-repeat="flow in paymentRule" ng-if="flow.flag">{{flow.name}}</li>
                                </ul>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-6">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyShippingTypeError">
                                        Required field cannot be empty </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Shipping Type<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-10">
                                <div class="btn-group" ng-hide="operation==='view'">
                                    <label class="btn btn-default" ng-click="togglePickupFlag()" ng-class="{'active':logisticProduct.pickupFlag}">
                                        Pickup
                                    </label>
                                    <label class="btn btn-default" ng-click="toggleDropshipFlag()" ng-class="{'active':logisticProduct.dropshipFlag}">
                                        Dropship
                                    </label>
                                </div>
                                <ul ng-show="operation==='view'" style="padding-left: 15px;">
                                    <li ng-if="logisticProduct.pickupFlag">Pickup</li>
                                    <li ng-if="logisticProduct.dropshipFlag">Dropship</li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                Commission Type
                                <i class="bli bli-info-1"
                                   popover="Jenis commission type yang bisa menggunakan logistic ini."
                                   popover-trigger="mouseenter"></i>
                            </label>
                            <div class="col-sm-10">
                            	<div class="col-sm-5" ng-repeat="item in listCommissionType.slice(0, listCommissionType.length / 2)">
									<div class="checkbox">
									  	<label><input type="checkbox" ng-model="item.checked" ng-disabled="operation==='view'" ng-click="toggleCommissionType(item.value)" value="{{item.value}}">{{item.text}}</label>
									</div>
								</div>
								<div class="col-sm-5" ng-repeat="item in listCommissionType.slice(listCommissionType.length / 2, listCommissionType.length)">
									<div class="checkbox">
									  	<label><input type="checkbox" ng-model="item.checked" ng-disabled="operation==='view'" ng-click="toggleCommissionType(item.value)" value="{{item.value}}">{{item.text}}</label>
									</div>
								</div>
			              	</div>
					 	</div>
                        
                        <div class="form-group">
                        	<div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyAllowedMerchantName">
                                        Merchant Name field cannot be empty
                                     </span>
                                     <span class="validation-error pull-right"
                                          ng-show="errorData.hasAlreadyExistsAllowedMerchantName">
                                        Merchant Name already exists in list
                                     </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Allowed Merchant Name
                                <i class="bli bli-info-1"
                                   popover="Merchant Name yang bisa menggunakan logistic ini."
                                   popover-trigger="mouseenter"></i>
                            </label>
                            <div class="col-sm-10">
                        		<div class="list-group" id="list1">
					                <div class="input-group" ng-hide="operation==='view'">
					                	<input type="text" ng-model="allowedMerchantData"
                                               typeahead="item as item.name for item in searchMerchant($viewValue) | limitTo:5"
                                               typeahead-editable="false" class="form-control"
                                               placeholder="Find a Merchant">
					                  	<span class="input-group-btn">
				                   			<button type="button" ng-click="addAllowedMerchantData()" class="btn btn-primary btn-sm" style="width: 70px">Add</button>
					                   	</span>
					                </div>
					                <span ng-show="operation==='view' && logisticProduct.listAllowedMerchantData.length == 0">-</span>
					                <div style="min-height: 45px; max-height: 200px; overflow-y: auto; margin-bottom: 0;" ng-hide="logisticProduct.listAllowedMerchantData.length == 0">
						                <table class="table">
	                                        <thead>
	                                        <th>Merchant Name</th>
	                                        <th>Merchant ID</th>
	                                        </thead>
	                                        <tbody>
	                                        <tr ng-repeat="merchant in logisticProduct.listAllowedMerchantData">
	                                            <td><span ng-class="{'font-color-red': merchant.name == 'Not found!'}">{{merchant.name}}</span></td>
	                                            <td>{{merchant.id}}</td>
	                                            <td ng-hide="operation==='view'">
	                                                <button type="button" class="close" aria-label="Close" ng-disabled="pageType == 'detail'"
	                                                        ng-click="deleteAllowedMerchantName($index)">
	                                                    <span aria-hidden="true">&times;</span>
	                                                </button>
	                                            </td>
	                                        </tr>
	                                        </tbody>
	                                    </table>
                                    </div>
				              	</div>
			              	</div>
					 	</div>
					 	
					 	<div class="form-group">
                        	<div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyRestrictedMerchantName">
                                        Merchant Name field cannot be empty
                                     </span>
                                     <span class="validation-error pull-right"
                                          ng-show="errorData.hasAlreadyExistsRestrictedMerchantName">
                                        Merchant Name already exists in list
                                     </span>
                                </div>
                            </div>
                            <label class="col-sm-2 control-label">
                                Restricted Merchant Name
                                <i class="bli bli-info-1"
                                   popover="Merchant Name yang tidak bisa menggunakan logistic ini."
                                   popover-trigger="mouseenter"></i>
                            </label>
                            <div class="col-sm-10">
                        		<div class="list-group" id="list1">
					                <div class="input-group" ng-hide="operation==='view'">
					                	<input type="text" ng-model="restrictedMerchantData"
                                               typeahead="item as item.name for item in searchMerchant($viewValue) | limitTo:5"
                                               typeahead-editable="false" class="form-control"
                                               placeholder="Find a Merchant">
					                  	<span class="input-group-btn">
				                   			<button type="button" ng-click="addRestrictedMerchantData()" class="btn btn-primary btn-sm" style="width: 70px">Add</button>
					                   	</span>
					                </div>
					                <span ng-show="operation==='view' && logisticProduct.listRestrictedMerchantData.length == 0">-</span>
					                <div style="min-height: 45px; max-height: 200px; overflow-y: auto; margin-bottom: 0;" ng-hide="logisticProduct.listRestrictedMerchantData.length == 0">
						                <table class="table">
	                                        <thead>
	                                        <th>Merchant Name</th>
	                                        <th>Merchant ID</th>
	                                        </thead>
	                                        <tbody>
	                                        <tr ng-repeat="merchant in logisticProduct.listRestrictedMerchantData">
	                                            <td><span ng-class="{'font-color-red': merchant.name == 'Not found!'}">{{merchant.name}}</span></td>
	                                            <td>{{merchant.id}}</td>
	                                            <td ng-hide="operation==='view'">
	                                                <button type="button" class="close" aria-label="Close" ng-disabled="pageType == 'detail'"
	                                                        ng-click="deleteRestrictedMerchantName($index)">
	                                                    <span aria-hidden="true">&times;</span>
	                                                </button>
	                                            </td>
	                                        </tr>
	                                        </tbody>
	                                    </table>
                                    </div>
				              	</div>
			              	</div>
					 	</div>
					 	
					 	<div class="form-group">
                            <label class="col-sm-2 control-label">
                                Special Handling per Category
                                <i class="bli bli-info-1"
                                   popover="Pengaturan Special Handling per kategori."
                                   popover-trigger="mouseenter"></i>
                            </label>
			              	<div class="col-sm-5" ng-hide="operation==='view'">
	                            <div class="row">
						 			Search category : <input type="text" ng-model="categorySearch"/>
					 			</div>
					 			<div class="row">
					 				<div style="overflow-y: auto; overflow-x: hidden; height:250px;">
								  		<div ivh-treeview="categoryNodes"
							  				ivh-treeview-click-handler="categoryTreeviewClick"
							  				ivh-treeview-filter="categorySearch"
										  	ng-dblclick="categoryTreeviewDblClick($event)"></div>
					              	</div>
					 			</div>
				 			</div>
				 			<div class="col-sm-5">
				 				<div class="row">
				 					<a ng-click="categoryTreeviewClearAll()"
				 						 ng-hide="operation==='view'"
				 						 style="cursor: pointer">Clear All</a>
					 				<span class="validation-error pull-right"
                                   		ng-show="errorData.hasAlreadyExistsCategory">
                                   		Category already exists in list
                                	</span>
                                </div>
                                <div class="row">
			              			<div class="drop-me ui-droppable" droppable=""
                        				style="overflow-y: auto; overflow-x: hidden; height:250px;">
										<ol class="list-group">
											<li class="list-group-item ng-binding ng-scope"
												ng-repeat="node in listCategorySetting" style="cursor:pointer;">
												{{node.name}}
												<div class="btn-group pull-right">
			                                    	<span class="bli-delete-circle"
				                                    	style="padding-left: 10px;"
				                                    	ng-click="deleteCategoryNode($index)"
				                                    	ng-hide="operation==='view'"></span>
			                                	</div>
											</li>
										</ol>
			              			</div>
                                </div>
				 			</div>
					 	</div>
                    </form>
                </div>
            </div>

            <div ng-show="getCurrentStep() == '2'" class="wave">
                <div class="row">
                    <form class="form-horizontal col-sm-8 col-sm-offset-2">
                        <div class="form-group">
                            <div class="col-sm-12" style="padding: 0px;">
                                <div class="col-sm-12">
                                    <span class="validation-error pull-right"
                                          ng-show="errorData.hasEmptyFileUploadError">
                                        Required field cannot be empty </span>
                                </div>
                            </div>
                            <label class="col-sm-3 control-label">
                                Logictic Product Shipping Cost<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Logistic ID yang akan dibuat harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-9">
                                <input type="file" name="logisticProductDetailShippingCost"
                                       file-model="data.logisticProductDetailShippingCost"
                                       accept=".xlsx"/>
                                <p class="help-block">Shipping Table Example Excel File can be downloaded <a href="${applicationBasePathLocation}/resources/files/shipping_table_example.xlsx">here</a></p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">
                                Is it new data version?<span class="red">* </span>
                                <i class="bli bli-info-1"
                                   popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                                   popover-trigger="mouseenter"></i>
                            </label>

                            <div class="col-sm-9">
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-default"
                                           ng-click="setNewDataVersionFlag(false)">
                                        <input type="radio" name="newDataVersion"
                                               ng-model="newDataVersion"> No
                                    </label>
                                    <label class="btn btn-default active"
                                           ng-click="setNewDataVersionFlag(true)">
                                        <input type="radio" name="newDataVersion"
                                               ng-model="newDataVersion" checked> Yes
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-5 col-sm-offset-7">
                                <a href="${applicationBasePathLocation}/view/logistic-product-summary" class="btn btn-default">
                                    Continue without Upload
                                </a>
                                <button type="button" ng-click="openUploadConfirmation()" class="btn btn-primary">
                                    Upload
                                </button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="pull-right" ng-show="isFirstStep()">
                <a class="btn btn-default"
                   href="${applicationBasePathLocation}/view/logistic-product-summary">
                    Cancel </a>
                <button type="button" ng-click="handleNext()" class="btn btn-primary"
                        ng-hide="operation==='view'">Save and Continue</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var operation = '${operation}';
        var paymentRuleEnum = '${paymentRuleEnum}';
        var logisticProductCode = '${logisticProductCode}';
    </script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/shipping/save-logistic-product-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/shipping/shipping-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/shipping/logistic-product-controller.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/eventListener-directive.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/inputValidator-directive.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/droppableListener-directive.js"></script>
    <style>
	    .font-color-red {
	    	color: red
	    }
	    .drop-me {
	    	width: 100%;
   			height: 250px;
	    }
    </style>
</div>
