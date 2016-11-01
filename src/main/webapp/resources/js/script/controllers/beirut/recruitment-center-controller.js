var candidatePositionModuleController = angular.module('x.beirut.candidate-module.controllers', []);

candidatePositionModuleController.controller('candidateSummary.ctrl', ['$scope', '$window', '$modal', 'candidateService', candidateSummaryModuleCtrlFunc]);
candidatePositionModuleController.controller('candidateDetail.ctrl', ['$scope', '$window', '$modal', 'candidateService', candidateDetailModuleCtrlFunc]);

function candidateDetailModuleCtrlFunc($scope, $window, $modal, candidateService){

    $scope.getCandidatePositionDetail = function(){
        $scope.loading = true;
        candidateService.getCandidatePositionDetail({
            idCandidate: $scope.idCandidate,
            idPosition: $scope.idPosition
        },function(response){
            // console.log("Ini Response: ",response);
            if(response.success){
                $scope.candidateDetail = response.value.candidate;
                $scope.position = response.value.position;
                $scope.statusLogs = response.value.statusLogs;
            } else{
                swal("Failed!", response.errorMessage, "error");
            }
            $scope.loading = false;
        }, function(error){
            swal('Error!', error.statusText, 'error');
            $scope.loading = false;
        });
    }

    // console.log("idCandidate: ",$scope.idCandidate);
    // console.log("idPosition: ",$scope.idPosition);

    $scope.getCandidatePositionDetail();
}

function candidateSummaryModuleCtrlFunc($scope, $window, $modal, candidateService){
    $scope.currentPage = 1;
    $scope.size = 10;
    $scope.numPages = $scope.totalRecords / $scope.size;
    $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
    $scope.totalRecords = 0;

    $scope.getAllCandidatePositionsSummary = function(){
        $scope.loading = true;
        candidateService.getAllCandidatePosition({
            query : '*:*',
            page  : $scope.currentPage - 1,
            size  : $scope.size
        }, function(response){
            if(response.success){
                $scope.candidatePositions = response.content;
                $scope.totalRecords = response.pageMetaData.totalRecords;
                $scope.size = response.pageMetaData.pageSize;
                $scope.currentPage = response.pageMetaData.pageNumber + 1;
            } else {
                swal("Failed!", response.errorMessage, "error");
            }
            $scope.loading = false;
        }, function(error){
            swal('Error!', error.statusText, 'error');
            $scope.loading = false;
        });
    };

	$scope.getAllCandidatePositionsSummary();

}
