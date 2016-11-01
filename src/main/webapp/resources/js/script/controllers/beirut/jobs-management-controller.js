var positionModuleController = angular.module('x.beirut.position-module.controllers', []);

positionModuleController.controller('positionSummary.ctrl', ['$scope', '$window', '$modal', 'positionService', positionSummaryModuleCtrlFunc]);
positionModuleController.controller('positionDetail.ctrl', ['$scope', '$window', '$modal', 'positionService', positionDetailModuleCtrlFunc]);

function positionDetailModuleCtrlFunc($scope, $window, $modal, positionService){
    $scope.loading = true;

    console.log("$scope.id: ",$scope.id);
    positionService.getPositionDetail({
        id: $scope.id
    },function(response){
        // console.log("Ini Response: ",response);
        if(response.success){
            $scope.response = response;
        } else{
            swal("Failed!", response.errorMessage, "error");
        }
        $scope.loading = false;
    }, function(error){
        swal('Error!', error.statusText, 'error');
        $scope.loading = false;
    });
}

function positionSummaryModuleCtrlFunc($scope, $window, $modal, positionService){
    $scope.currentPage = 1;
    $scope.size = 10;
    $scope.numPages = $scope.totalRecords / $scope.size;
    $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
    $scope.totalRecords = 0;

    $scope.getAllPositionsSummary = function(){

        $scope.loading = true;
        positionService.getAllPositions({
            page : $scope.currentPage - 1,
            size : $scope.size
        }, function(response){
            //debug
            if(response.success){
                $scope.positions = response.content;
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

	$scope.getAllPositionsSummary();

}
