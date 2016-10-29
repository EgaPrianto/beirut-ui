<!--div ng-app="x.beirut.position-angularApp" ng-controller="positionSummary.ctrl">
    <div class="loading-wrapper" ng-show="loading">
        <div class="loading-spinner">
            <img src="${staticBlistrapPathLocation}images/Preloader84.gif">
        </div>
    </div-->

    <h2 class="title-head">Forms</h2>
    <h4>Form Wizard Horizontal</h4>
    <div class="panel panel-default">
        <div class="panel-body" ng-switch="getCurrentStep()">
            <h3 ng-switch-when="1">Form Title Page 1 <small>({{ getCurrentStep() }}/{{ steps.length }})</small></h3>
            <h3 ng-switch-when="2">Form Title Page 2 <small>({{ getCurrentStep() }}/{{ steps.length }})</small></h3>
            <h3 ng-switch-when="3">Form Title Page 3 <small>({{ getCurrentStep() }}/{{ steps.length }})</small></h3>

            <div ng-switch="getCurrentStep()" class="slide-frame">
                <div ng-switch-when="1" class="wave" ng-form="formStep1">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="new-url" class="col-sm-2 control-label" tooltip="mandatory">Name<span class="red">*</span></label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="new-url" placeholder="Nama" id="new-url" tooltip="mandatory">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="new-url" class="col-sm-2 control-label">Address</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="3" placeholder="Address" ui-tinymce="tinymceOptions" ng-model="address"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="new-url" class="col-sm-2 control-label">Email</label>
                            <div class="col-sm-6">
                                <div class="input-group">
                                    <input type="text" class="form-control" name="new-url" placeholder="email" id="new-url">
                                    <span class="input-group-addon" id="new-url">mail.com</span>
                                </div>
                            </div>
                        </div>
                        <fieldset>
                            <legend>Datepicker</legend>
                            <div class="form-group">
                                <label for="new-url" class="col-sm-2 control-label">Start Date</label>
                                <div class="col-sm-4">
                                    <p class="input-group">
                                        <input type="text" class="form-control" datetime-picker="dd-MM-yyyy hh:mm" ng-model="dates.startdate" is-open="open.date" enable-time="false" />
                              <span class="input-group-btn">
                                  <button type="button" class="btn btn-default" ng-click="openCalendar($event, 'date')"><i class="fa fa-calendar"></i></button>
                              </span>
                                    </p>
                                    <small>disabled time config (enable-time="false")</small>
                                    <p class="bg-warning" ng-bind="dates.startdate | date:'EEEE, dd-MM-yyyy hh:mm'"></p>
                                </div>
                                <label for="new-url" class="col-sm-2 control-label">End Date</label>
                                <div class="col-sm-4">
                                    <p class="input-group">
                                        <input type="text" class="form-control" datetime-picker="dd-MM-yyyy hh:mm" ng-model="dates.enddate" is-open="open.date" enable-time="true" />
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-default" ng-click="openCalendar($event, 'date')"><i class="fa fa-calendar"></i></button>
                            </span>
                                    </p>
                                    <p class="bg-warning" ng-bind="dates.enddate | date:'EEEE, dd-MM-yyyy hh:mm'"></p>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Validation Field</legend>
                            <div class="form-group" ng-class="{'has-error': !city}">
                                <div class="col-sm-12" style="padding: 0px;">
                                    <div class="col-sm-8">
                                        <span class="validation-error pull-right" ng-show="!city">Required Field</span>
                                    </div>
                                </div>
                                <label for="city" class="col-sm-2 control-label">City<span class="red">*</span></label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" ng-model="city" name="city" placeholder="City" id="City" required>
                                    <span id="helpBlock" class="help-block">Validation for required field should not empty</span>
                                </div>
                            </div>

                            <div class="form-group" >
                                <label for="city" class="col-sm-2 control-label">Price (Rp.)<span class="red">*</span></label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" ng-model="price" amount="price" name="price" blur-to-currency only-digits >
                                    <span id="helpBlock" class="help-block">Validation for price format and only digits input ex: 1,000,000.00</span>
                                </div>
                            </div>

                            <div class="form-group" >
                                <label for="age" class="col-sm-2 control-label">Age <span class="red">*</span></label>
                                <div class="col-sm-6">
                                    <input type="number" class="form-control" ng-model="age" name="price" only-numbers>
                                    <span id="helpBlock" class="help-block">Validation for number format and only number input ex: 12345</span>
                                </div>
                            </div>

                            <div class="form-group" >
                                <label for="age" class="col-sm-2 control-label">Alert me<span class="red">*</span></label>
                                <div class="col-sm-6">
                                    <button class="btn btn-success" ng-click="alertMe('success')">Push Me</button>
                                    <button class="btn btn-danger" ng-click="alertMe('error')">Push Me</button>
                                    <button class="btn btn-warning" ng-click="alertMe('warning')">Push Me</button>
                                </div>
                            </div>
                            <div class="form-group" >
                                <label for="age" class="col-sm-2 control-label">Popover<span class="red">*</span>
                                    <i popover="this is popover this is popover this is popover this is popover this is popover text this is popover text this is popover text this is popover text"  popover-trigger="mouseenter" class="bli bli-info"></i>
                                </label>
                                <div class="col-sm-6">
                                    <input type="text" class="form-control" placeholder="click here for popover focus"  name="text" popover="this is popover this is popover this is popover this is popover this is popover text this is popover text this is popover text this is popover text" popover-placement="right"  popover-trigger="focus">
                                    <br>
                                    <input type="text" placeholder="click here for popover focus html template" class="form-control" name="text" popover-template="popover.templateUrl" popover-placement="right" popover-trigger="focus">

                                    <script type="text/ng-template" id="PopoverTemplate.html">
                                        <div>{{popover.content}}</div>
                                        <p>Lorem ipsum dolor sit amet </p>
                                        <ol>
                                            <li>one</li>
                                            <li>two</li>
                                            <li>three</li>
                                        </ol>
                                    </script>
                                </div>
                            </div>
                        </fieldset>
                    </div>
                </div>
                <div ng-switch-when="2" class="wave">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="new-url" class="col-sm-2 control-label">Phone</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="new-url" id="new-url" ng-model="phone" only-numbers>
                            </div>
                        </div>

                    </div>
                </div>
                <div ng-switch-when="3" class="wave">

                    <div class="form-horizontal">
                        <div class="form-group">
                            <label for="new-url" class="col-sm-2 control-label">Handphone</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" name="new-url" id="new-url">
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <div class="panel-footer">
            <div class="pull-right">
                <button type="submit" class="btn btn-default " ng-click="handlePrevious()" >
                    {{ (isFirstStep()) ? "Cancel":"Back"  }} </button>

                <button type="submit" class="btn btn-primary" ng-click="handleNext()">
                    {{getNextLabel()}}
                </button>
            </div>
        </div>
    </div>

    <!--
    <script src="${applicationBasePathLocation}/resources/bower_components/jquery/dist/jquery.min.js"></script>
    <script src="${applicationBasePathLocation}/resources/bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="${applicationBasePathLocation}/resources/bower_components/angular/angular.js"></script>
  	<script src="${applicationBasePathLocation}/resources/bower_components/angular-route/angular-route.js"></script>
    <script src="${applicationBasePathLocation}/resources/bower_components/angular-resource/angular-resource.js"></script>-->
    <script src="${staticBlistrapPathLocation}js/vendor/ui-grid-angular/ui-grid.js"></script>
    <script src="${staticBlistrapPathLocation}js/vendor/angular-chips/angular-chips.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/apps/beirut/jobs-management-app.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/services/beirut/beirut-service.js"></script>
    <script src="${applicationBasePathLocation}/resources/js/script/controllers/beirut/jobs-management-controller.js"></script>
</div>
