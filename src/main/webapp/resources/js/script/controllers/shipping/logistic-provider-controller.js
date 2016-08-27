var logisticProviderModuleController = angular.module('x.shipping.logistic-provider-module.controllers', []);

logisticProviderModuleController.controller('logisticProviderCounter.ctrl', ['$scope', 'logisticProviderService', logisticProviderCounterModuleCtrlFunc]);
logisticProviderModuleController.controller('logisticProviderReportLog.ctrl', ['$scope', 'logisticProviderService', logisticProviderReportLogModuleCtrlFunc]);

function logisticProviderCounterModuleCtrlFunc($scope, logisticProviderService){
    $scope.date = new Date();

    $scope.opened = false;

    $scope.openCalendar = function (e) {
        e.preventDefault();
        e.stopPropagation();
        $scope.opened = true;
    };

    $scope.findLogisticProviderCounter = function(){
        var dateInMilis = $scope.date.getTime();
        console.log(dateInMilis);
        logisticProviderService.getAllLogisticProviderCountersByDate({
          date: dateInMilis
      }, function(response){
          console.log(response);
            $scope.logisticProviders = response.content;
      });
    };

    $scope.findLogisticProviderCounter();
}

function logisticProviderReportLogModuleCtrlFunc($scope, logisticProviderService){
    $scope.currentPage = 1;
    $scope.size = 10;
    $scope.numPages = $scope.totalRecords / $scope.size;
    $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
    $scope.totalRecords = 0;

    $scope.getPage = function (page) {
        $scope.currentPage = page;
        $scope.findLogisticProviderReportLog();
    };
    $scope.setPage = function (pageNo) {
        $scope.currentPage = pageNo;
    };
    $scope.pageChanged = function () {
        $scope.findLogisticProviderReportLog();
        $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
    };
    $scope.findLogisticProviderReportLog = function(){
        logisticProviderService.getLogisticProviderReportLog({
            page : $scope.currentPage - 1,
            size : $scope.size,
            property : 'updatedDate',
            direction : 'desc'
        }, function(response){
            console.log(response);
            $scope.logisticProviderReportLog = response.content;
            $scope.totalRecords = response.pageMetaData.totalRecords;
            $scope.size = response.pageMetaData.pageSize;
            $scope.currentPage = response.pageMetaData.pageNumber + 1;
        });
    };

    $scope.findLogisticProviderReportLog();
}
