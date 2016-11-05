var positionModuleController = angular.module('x.beirut.position-module.controllers', []);

positionModuleController.controller('positionSummary.ctrl', ['$scope', '$window', '$modal', 'positionService', positionSummaryModuleCtrlFunc]);
positionModuleController.controller('positionDetail.ctrl', ['$scope', '$window', '$modal', 'positionService', positionDetailModuleCtrlFunc]);
positionModuleController.controller('positionDescription.ctrl', ['$scope', '$window', '$modal', 'positionService', positionDescriptionModuleCtrlFunc]);

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
    $scope.currentRecords = (($scope.currentPage - 1) * $scope.size) + 1;
    $scope.totalRecords = 0;
    $scope.maxSize = 5;
    $scope.currentState = "Summary";

    $scope.getDetail = function(position){
      window.location.assign(applicationBasePathLocation + "/view/jobs-management-detail/"+position.id);
    }

    $scope.searchPositionTitle = function(){
      console.log($scope.searchParam);
      $scope.currentState = "Search";
      if($scope.searchParam == null){
        $scope.currentState = "Summary";
        $scope.currentPage = 1;
        $scope.size = 10;
      }else{
        positionService.getPositionByTitle({
          title : $scope.searchParam
        }, function(response){
            if(response.success){
                $scope.positions = response.content;
                $scope.currentPage= 1;
                $scope.pageSize = 1;
            } else {
                swal("Failed!", response.errorMessage, "error");
            }
            $scope.loading = false;
        }, function(error){
            swal('Error!', error.statusText, 'error');
            $scope.loading = false;
        });
        $scope.currentPage= 1;
      }
    }

    $scope.changeNumPerPage = function(numPerPages){
      $scope.size = numPerPages;
    }

    $scope.changeStatus = function(){
      $scope.selectedStatus;
      if ($scope.selectedStatus==null) {
        alert("Please Select Status");
      }else{
        $scope.idArray = [];
        angular.forEach($scope.positions, function(position){
          if (!!position.selected){
            $scope.idArray.push(position.id);
          }
        })
        $scope.loading = true;

        positionService.updatePositionsStatus({
          listId : $scope.idArray,
          status : $scope.selectedStatus
        },function(response){
          if(response.success){
            window.location.replace(applicationBasePathLocation + "/view/jobs-management");
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
        if ($scope.currentState === "Summary") {
          positionService.getAllPositionsNotDeleted({
              page : $scope.currentPage - 1,
              size : $scope.size
          }, function(response){
              //debug
              if(response.success){
                  $scope.positions = response.content;
                  $scope.totalRecords = response.pageMetaData.totalRecords;
                  $scope.pageSize = response.pageMetaData.pageSize;
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
        }
    });

    $scope.deletePosition = function(){
      $scope.idArray = [];
      angular.forEach($scope.positions, function(position){
        if (!!position.selected){
          $scope.idArray.push(position.id);
        }
      })
      $scope.loading = true;
      positionService.deletePosition({
        listId : $scope.idArray
      },function(response){
        if(response.success){
          window.location.replace(applicationBasePathLocation + "/view/jobs-management");
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



    $scope.getAllPositionsSummary = function(){

        $scope.loading = true;
        $scope.currentState = "Summary";
        positionService.getAllPositionsNotDeleted({
            page : $scope.currentPage - 1,
            size : $scope.size
        }, function(response){
            //debug
            if(response.success){
                $scope.positions = response.content;
                $scope.totalRecords = response.pageMetaData.totalRecords;
                $scope.pageSize = response.pageMetaData.pageSize;
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
    console.log($scope);
}

function positionDescriptionModuleCtrlFunc($scope, $window, $modal, positionService){
  $scope.loading = true;

  console.log("$scope.id: ",$scope.id);
  positionService.getPositionDescription({
      id: $scope.id
  },function(response){
      if(response.success){
          $scope.response = response;
      } else{
          swal("Failed!", response.errorMessage, "error");
      }
  }, function(error){
      swal('Error!', error.statusText, 'error');
  });
  positionService.getPosition({
      id: $scope.id
  },function(detail){
      console.log("response: ",detail );
      if(detail.success){
          $scope.detail = detail;
      } else{
          swal("Failed!", detail.errorMessage, "error");
      }
      $scope.loading = false;
  }, function(error){
      swal('Error!', error.statusText, 'error');
      $scope.loading = false;
  });
}
