<div ng-app="x.shipping.save-logistic-option-angularApp"
     ng-controller="shippingSaveLogisticOption.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-3">
            <a href="${applicationBasePathLocation}/view/logistic-option-summary">Logistic Option List</a>
        </div>
        <div class="col-sm-1 col-sm-offset-8"><a
                href="${applicationBasePathLocation}/j_spring_cas_security_logout">Logout</a></div>
    </div>

    <div class="row">
        <h1>Create Logistic Option</h1>
    </div>

    <div class="row">
        <form class="form-horizontal col-sm-10 col-sm-offset-1">
            <div class="form-group">
                <div class="col-sm-12" style="padding: 0px;">
                    <div class="col-sm-12">
                        <span class="validation-error pull-right"
                              ng-show="errorData.hasEmptyLogisticOptionCodeError">
                            Required field cannot be empty.</span> <span
                            class="validation-error pull-right"
                            ng-show="errorData.logisticOptionCodeHasSpacesError">
                            Logistic Option Code must not contain any spaces.</span>
                    </div>
                </div>
                <label class="col-sm-2 control-label">
                    Logistic Option Code<span class="red">* </span>
                    <i class="bli bli-info-1"
                       popover="Logistic ID yang akan dibuat harus unik."
                       popover-trigger="mouseenter"></i>
                </label>

                <div class="col-sm-10">
                    <input required ng-disabled="operation!=='insert'"
                           ng-model="logisticOption.logisticOptionCode" class="form-control"
                           custom-onblur="logisticOptionCodeValidation()">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12" style="padding: 0px;">
                    <div class="col-sm-12">
                        <span class="validation-error pull-right"
                              ng-show="errorData.hasEmptyLogisticOptionNameError">
                            Required field cannot be empty </span>
                    </div>
                </div>
                <label class="col-sm-2 control-label">
                    Logistic Option Name<span class="red">* </span>
                    <i class="bli bli-info-1"
                       popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                       popover-trigger="mouseenter"></i>
                </label>

                <div class="col-sm-10">
                    <input required ng-disabled="operation==='view'"
                           ng-model="logisticOption.logisticOptionName" class="form-control"
                           custom-onblur="logisticOptionNameValidation()">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12" style="padding: 0px;">
                    <div class="col-sm-12">
                        <span class="validation-error pull-right"
                              ng-show="errorData.hasEmptyLogisticOptionDescriptionError">
                            Required field cannot be empty </span>
                    </div>
                </div>
                <label class="col-sm-2 control-label">
                    Description<span class="red">* </span>
                    <i class="bli bli-info-1"
                       popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                       popover-trigger="mouseenter"></i>
                </label>

                <div class="col-sm-10">
          <textarea required name="adjustmentName" ng-disabled="operation==='view'"
                    ng-model="logisticOption.logisticOptionDescription" class="form-control"
                    custom-onblur="logisticOptionDescriptionValidation()"></textarea>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12" style="padding: 0px;">
                    <div class="col-sm-12">
                        <span class="validation-error pull-right"
                              ng-show="errorData.hasEmptyLogisticProductListError">
                            Required field cannot be empty </span>
                    </div>
                </div>
                <label class="col-sm-2 control-label">
                    Logistic Products<span class="red">* </span>
                    <i class="bli bli-info-1"
                       popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                       popover-trigger="mouseenter"></i>
                </label>

                <div class="col-sm-3">
                    <div class="drop-me" data-drop="operation!=='view'"
                         ng-model='logisticProductList'
                         ng-class="{'highlight': dropOver}"
                         jqyoui-droppable="{multiple:true, onOver:'highlightRow'}" style="overflow-x: auto">
                        <ol class="list-group">
                            <li class="list-group-item"
                                style="cursor:pointer;"
                                ng-repeat="product in logisticProductList"
                                ng-show="product"
                                data-drag="true"
                                data-jqyoui-options="{revert: 'invalid', helper: 'clone'}"
                                ng-model="logisticProductList"
                                jqyoui-draggable="{index: {{$index}},animate:false}">{{ product.logisticProductName
                                }}
                            </li>
                            <li class="list-group-item" ng-hide="hideMe()">
                                <small>Drop logistic products here</small>
                            </li>
                            </ul>
                        </ol>
                    </div>
                </div>

                <div class="col-sm-3" ng-hide="operation==='view'">
                    <div class="drop-me" data-drop="operation!=='view'" ng-model='logisticProducts'
                         jqyoui-droppable="{multiple:true}"
                         style="display:block;border: 1px solid #ccc;width:200px;height:200px;padding:10px;overflow-x: auto">
                        <ul class="list-group">
                            <li class="list-group-item" ng-repeat="product in logisticProducts"
                                data-drag="true"
                                data-jqyoui-options="{revert: 'invalid', helper: 'clone'}"
                                ng-model="logisticProducts"
                                jqyoui-draggable="{index: {{$index}}, animate: false}"
                                style="cursor:move;z-index:1;">{{ product.logisticProductName }}
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-12" style="padding: 0px;">
                    <div class="col-sm-12">
                        <span class="validation-error pull-right"
                              ng-show="errorData.hasEmptySequenceError">
                            Required field cannot be empty </span> <span
                            class="validation-error pull-right"
                            ng-show="errorData.hasInvalidSequenceError">
                            Sequence must be greater than 0 </span>
                    </div>
                </div>
                <label class="col-sm-2 control-label">
                    Sequence<span class="red">* </span>
                    <i class="bli bli-info-1"
                       popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                       popover-trigger="mouseenter"></i>
                </label>

                <div class="col-sm-10">
                    <input required type="text" only-digits ng-disabled="operation==='view'"
                           ng-model="logisticOption.sequence" class="form-control"
                           custom-onblur="sequenceValidation()">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">
                    Is it default logistic option?<span class="red">* </span>
                    <i class="bli bli-info-1"
                       popover="Nama adjustment yang akan dibuat, nama adjustment harus unik."
                       popover-trigger="mouseenter"></i>
                </label>

                <div class="col-sm-10">
                    <div class="btn-group" data-toggle="buttons" ng-hide="operation==='view'">
                        <label class="btn btn-default active"
                               ng-click="setDefaultLogisticOption(false)">
                            <input type="radio" name="defaultLogisticOption"
                                   ng-model="logisticOption.defaultLogisticOption"
                                   checked> No
                        </label>
                        <label class="btn btn-default" ng-click="setDefaultLogisticOption(true)">
                            <input type="radio" name="defaultLogisticOption"
                                   ng-model="logisticOption.defaultLogisticOption"> Yes
                        </label>
                    </div>
                    <div ng-show="operation==='view'">
                        <span ng-if="logisticOption.defaultLogisticOption">Yes</span>
                        <span ng-if="!logisticOption.defaultLogisticOption">No</span>
                    </div>
                </div>
            </div>

        </form>
    </div>

    <div class="row" ng-hide="operation==='view'">
        <div class="col-sm-10 col-sm-offset-1">
            <div class="pull-right">
                <a class="btn btn-default" ng-if="isFirstStep()"
                   href="${applicationBasePathLocation}/view/logistic-option-summary">
                    Cancel </a>
                <button type="button" ng-click="validate()" class="btn btn-primary"
                        ng-hide="pageType == 'detail'">Save
                </button>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        var operation = '${operation}';
        var logisticOptionCode = '${logisticOptionCode}';
    </script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/shipping/save-logistic-option-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/shipping/shipping-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/shipping/logistic-option-controller.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/eventListener-directive.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/inputValidator-directive.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/directive/droppableListener-directive.js"></script>
</div>
