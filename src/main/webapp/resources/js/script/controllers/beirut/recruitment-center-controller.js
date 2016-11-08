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
    $scope.jobTypes = [];
    $scope.jobTitles = [];
    $scope.jobTitlesToShow = [];
	  $scope.advanceSearch=false;
    $scope.searchJobType=null;

  	$scope.date1 = new Date();
  	$scope.date2 = new Date();

    $scope.opened1 = false;
	  $scope.opened2 = false;

    $scope.openCalendar = function (e) {
        e.preventDefault();
        e.stopPropagation();
        $scope.opened1 = true;
    };

	$scope.openCalendar2 = function (e) {
        e.preventDefault();
        e.stopPropagation();
        $scope.opened2 = true;
    };

    $scope.getDetail = function(candidatePositions){
      window.location.assign(applicationBasePathLocation + "/view/recruitment-center-detail/"+candidatePositions.idCandidate+"/"+candidatePositions.idPosition);
    }

    $scope.searchCandidate = function(){
      console.log($scope.jobTypes);
      /*
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
      });*/
    }

    $scope.changeNumPerPage = function(numPerPages){
      $scope.size = numPerPages;
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
        $scope.loading = true;
        candidateService.getAllPositionsNotDeleted({
          page : 0,
          size : 2147483640
        },function(response){
              $scope.positions = response.content;
              console.log($scope.positions);
              distinctType = [];
              for(var i = 0 ; i< $scope.positions.length ; i++){
                index = distinctType.indexOf($scope.positions[i].jobType);
                if (index == -1) {
                  newObject = new Object();
                  newObject.jobType = $scope.positions[i].jobType;
                  newObject.jobTitles = [];
                  newObject.jobTitles.push($scope.positions[i].title);
                  $scope.jobTitles[$scope.positions[i].jobType] = [];
                  $scope.jobTitles[$scope.positions[i].jobType].push($scope.positions[i].title);
                  distinctType.push($scope.positions[i].jobType);
                  $scope.jobTypes.push(newObject);
                }else{
                  if ($scope.jobTypes[index].jobTitles.indexOf($scope.positions[i].title) == -1){
                    $scope.jobTypes[index].jobTitles.push($scope.positions[i].title);
                    $scope.jobTitles[$scope.positions[i].jobType].push($scope.positions[i].title);
                  }
                }
              }
              console.log($scope.jobTypes);
              console.log($scope.jobTitles);
              $scope.loading = false;
        },function(error){
              swal('Error!', error.statusText, 'error');
              $scope.loading = false;
        });
    };
    console.log($scope.totalAllRecords);


    $scope.$watch('currentPage + size', function(){
        console.log("TES");
        $scope.getAllCandidatePositionsSummary();
    });
    $scope.$watch('searchJobType', function(){
    console.log($scope.searchJobType);
      if($scope.searchJobType != null){
        $scope.jobTitlesToShow = $scope.jobTitles[$scope.searchJobType+""];
        console.log($scope.jobTitlesToShow);
      }
    });

}
