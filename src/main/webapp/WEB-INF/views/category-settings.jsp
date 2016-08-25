<div ng-app="x.shipping.category-settings-angularApp"
     ng-controller="shippingSaveLogisticProduct.ctrl as shippingSaveLogisticProduct">
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
	      	<a href="${applicationBasePathLocation}/view/logistic-provider-report-log">Logistic Provider Report Log</a> |
	      	<a href="${applicationBasePathLocation}/view/logistic-upload-data-status">Logistic Upload Data Status</a>
        </div>
    	<div class="col-sm-1 pull-right">
            <a href="${applicationBasePathLocation}/j_spring_cas_security_logout">Logout</a>
        </div>
    </div>

    <div class="row">
        <h1>Category Settings</h1>
    </div>

    <div class="panel-body slide-frame row">
    	<form class="form-horizontal col-sm-10 col-sm-offset-1">
			<div class="form-group">
                <label class="col-sm-2 control-label">
                     Direct Flight Settings
                     <i class="bli bli-info-1"
                        popover="Pengaturan Direct Flight per kategori."
                        popover-trigger="mouseenter"></i>
                 </label>
	         	<div class="col-sm-5">
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
						<a ng-click="categoryTreeviewClearAll()" style="cursor: pointer">Clear All</a>
						<span class="validation-error pull-right"
                        		ng-show="errorData.hasAlreadyExistsCategory">
                         		Category already exists in list
                  		</span>
           			</div>
                    <div class="row">
	         			<div class="drop-me ui-droppable" droppable=""
              				style="overflow-y: auto; overflow-x: hidden; height:250px; width: 100%">
							<ol class="list-group">
								<li class="list-group-item ng-binding ng-scope"
									ng-repeat="node in listCategorySetting" style="cursor:pointer;">
									{{node.name}}
									<div class="btn-group pull-right">
										<span class="bli-delete-circle"
		                                	style="padding-left: 10px;"
		                                	ng-click="deleteCategoryNode($index)">
		                               	</span>
	                            	</div>
								</li>
							</ol>
	          			</div>
                   </div>
				</div>
			</div>
        </form>
    </div>

    <div class="row">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="pull-right">
                <button type="button" ng-click="saveSettings()"
                	class="btn btn-primary">
                	Save Settings
				</button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var operation = '${operation}';
    </script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/shipping/category-settings-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/shipping/shipping-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/shipping/category-settings-controller.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/eventListener-directive.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/inputValidator-directive.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/droppableListener-directive.js"></script>
</div>
