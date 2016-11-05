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
                $scope.candidate = response.value.candidate;
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
    $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
    $scope.totalRecords = 0;
    $scope.maxSize = 5;

    $scope.getDetail = function(candidatePositions){
      window.location.assign(applicationBasePathLocation + "/view/recruitment-center-detail/"+candidatePositions.idCandidate+"/"+candidatePositions.idPosition);
    }

    $scope.searchCandidate = function(){
      candidateService.getAllCandidatePosition({
        query : 'firstName:'+$scope.searchParam +' OR lastName:'+ $scope.searchParam ,
        page  : $scope.currentPage - 1,
        size  : $scope.size
      }, function(response){
          if(response.success){
              $scope.candidatePositions = response.content;
              $scope.totalRecords = response.pageMetaData.totalRecords;
              $scope.pageSize = response.pageMetaData.pageSize;
              $scope.currentPage = response.pageMetaData.pageNumber + 1;
          } else {
              swal("Failed!", response.errorMessage, "error");
          }
          $scope.loading = false;
      }, function(error){
          swal('Error!', error.statusText, 'error');
          $scope.loading = false;
      });
    }

    $scope.changeNumPerPage = function(numPerPages){
      $scope.size = numPerPages;
      candidateService.getAllCandidatePosition({
          query : '*:*',
          page  : $scope.currentPage - 1,
          size  : $scope.size
      }, function(response){
          if(response.success){
              $scope.candidatePositions = response.content;
              $scope.totalRecords = response.pageMetaData.totalRecords;
              $scope.pageSize = response.pageMetaData.pageSize;
              $scope.currentPage = response.pageMetaData.pageNumber + 1;
          } else {
              swal("Failed!", response.errorMessage, "error");
          }
          $scope.loading = false;
      }, function(error){
          swal('Error!', error.statusText, 'error');
          $scope.loading = false;
      });
    }

    $scope.changeStatus = function(){
      $scope.selectedStatus;
      if ($scope.selectedStatus==null) {
        alert("Please Select Status");
      }else{
        $scope.idArrayBind = [];
        angular.forEach($scope.candidatePositions, function(candidatePosition){
          if (!!candidatePosition.selected){
            data = new Object();
            data.idCandidate = candidatePosition.idCandidate;
            data.idPosition = candidatePosition.idPosition;
            $scope.idArrayBind.push(data);
          }
        })
        console.log($scope.idArrayBind);
        candidateService.updateCandidatesStatus({
          arrayBind : $scope.idArrayBind,
          status : $scope.selectedStatus
        },function(response){
          if(response.success){
            window.location.replace(applicationBasePathLocation + "/view/recruitment-center");
            console.log(response);
          } else {
              swal("Failed!", response.errorMessage, "error");
          }
          $scope.loading = false;
        },function(error){
          swal('Error!', error.statusText, 'error');
          $scope.loading = false;
        });
      }
    }


    $scope.$watch('currentPage + size', function(){
        console.log("TES");
        candidateService.getAllCandidatePosition({
            query : '*:*',
            page  : $scope.currentPage - 1,
            size  : $scope.size
        }, function(response){
            if(response.success){
                $scope.candidatePositions = response.content;
                $scope.totalRecords = response.pageMetaData.totalRecords;
                $scope.pageSize = response.pageMetaData.pageSize;
                $scope.currentPage = response.pageMetaData.pageNumber + 1;
            } else {
                swal("Failed!", response.errorMessage, "error");
            }
            $scope.loading = false;
        }, function(error){
            swal('Error!', error.statusText, 'error');
            $scope.loading = false;
        });
    });

    $scope.loading = true;
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
                $scope.pageSize = response.pageMetaData.pageSize;
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
    console.log($scope.totalAllRecords);
	$scope.getAllCandidatePositionsSummary();

}
