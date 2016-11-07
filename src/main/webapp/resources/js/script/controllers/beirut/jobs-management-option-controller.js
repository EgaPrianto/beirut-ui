var positionOptionModuleController = angular.module('x.beirut.position.option-module.controllers', []);

positionOptionModuleController.controller('positionCreateNew.ctrl', ['$scope', '$window', '$modal', 'positionService', positionCreateNewModuleCtrlFunc]);
positionOptionModuleController.controller('positionEdit.ctrl', ['$scope', '$window', '$modal', 'positionService', positionEditModuleCtrlFunc]);

function positionEditModuleCtrlFunc($scope, $window, $modal, positionService){
    $scope.loading=true;
    $scope.onFileSelect = function(ele){
        $scope.files = ele.files;
        var reader = new FileReader();
        reader.onload = function(e){
            // console.log("about to encode");
            $scope.encoded_file = btoa(e.target.result.toString());
        };
        reader.readAsBinaryString($scope.files[0]);
        $scope.fileBase64 = new FileReader();
        $scope.fileBase64.readAsDataURL($scope.files[0]);
    };

    $scope.changeStatus = function(status){
        $scope.statusPost = status;
        $('#StatusPosition').html($scope.statusPost);
    }

    $scope.submitEditPosition = function(successUrl){
        $scope.loading=true;
        console.log("shit got real!");
        $scope.positionDTORequestString = "{\"id\": \"id\"," +
            "\"title\": \""+$scope.title+"\"," +
            "\"jobType\": \""+$scope.jobType+"\"," +
            "\"jobDivision\": \""+$scope.jobDivision+"\"}";

        $scope.listStringRequest = {
            "statusDTORequest": $scope.statusPost,
            "idPositions": [
                $scope.id
            ]
        };

        positionService.updatePositionInformation({
            positionDTORequest: $scope.positionDTORequest
        })
            .$promise.then(function(response){
                if(response.success){
                    return positionService.updatePositionsStatus({
                        listStringRequest: $scope.listStringRequest
                    })
                }else{
                    swal('Error!', response.error.statusText, 'error');
                    $scope.loading = false;
                }
            })
            .then(function(res2){
                if(res2.success){
                    if($scope.fileBase64 && $scope.files){
                        return positionService.updatePositionDescription({
                            id: $scope.id,
                            base64File: $scope.fileBase64,
                            filename: $scope.files[0].name
                        })
                    }else{
                        $window.location.href = successUrl;
                    }
                }else{
                    swal('Error!', res2.error.statusText, 'error');
                    $scope.loading = false;
                }
            })
            .then(function(res3){
                if(res3.success){
                    $window.location.href = successUrl;
                }
            })
            .catch(function(error){
                swal('Error!', error.statusText, 'error');
                $scope.loading = false;
            })
    }

    positionService.getPosition({
        id: $scope.id
    }).$promise.then(function(response){
        // console.log("response: ", response);
        if (response.success) {
            $scope.position = response.value;
            $scope.title = $scope.position.title;
            $scope.jobDivision = $scope.position.jobDivision;
            $scope.jobType = $scope.position.jobType;
            $scope.jobStatus = $scope.position.jobStatus;
            $scope.changeStatus($scope.jobStatus);
            console.log("$scope.response: ", $scope.response);
        } else {
            swal("Failed!", response.errorMessage, "error");
        }
        $scope.loading = false;
    }).catch(function(err){
        swal('Error!', error.statusText, 'error');
        $scope.loading = false;
    });

    // positionService.getPosition({
    //     id: $scope.id
    // },function(response){
    //     // console.log("response: ",response );
    //     if(response.success){
    //         $scope.position = response.value;
    //         $scope.title = $scope.position.title;
    //         $scope.jobDivision = $scope.position.jobDivision;
    //         $scope.jobType = $scope.position.jobType;
    //         $scope.jobStatus = $scope.position.jobStatus;
    //         $scope.changeStatus($scope.jobStatus);
    //         console.log("$scope.response: ",$scope.response);
    //     } else{
    //         swal("Failed!", response.errorMessage, "error");
    //     }
    //     $scope.loading = false;
    // }, function(error){
    //     swal('Error!', error.statusText, 'error');
    //     $scope.loading = false;
    // });

}

function positionCreateNewModuleCtrlFunc($scope, $window, $modal, positionService){

    $scope.onFileSelect = function(ele){
        $scope.files = ele.files;
        var reader = new FileReader();
        reader.onload = function(e){
            // console.log("about to encode");
            $scope.encoded_file = btoa(e.target.result.toString());
        };
        reader.readAsBinaryString($scope.files[0]);
        $scope.fileBase64 = new FileReader();
        $scope.fileBase64.readAsDataURL($scope.files[0]);
    };

    $scope.submitPosition = function(successUrl){
        $scope.loading=true;
        $scope.positionDTORequestString = "{\"id\": \"id\"," +
            "\"title\": \""+$scope.title+"\"," +
            "\"jobType\": \""+$scope.jobType+"\"," +
            "\"jobDivision\": \""+$scope.jobDivision+"\"}";

        positionService.insertNewPosition({
            positionDTORequestString: $scope.positionDTORequestString,
            filename: $scope.files[0].name,
            base64File: $scope.fileBase64.result
        }, function(response){
            if(response.success){
                $window.location.href = successUrl;
            } else {
                swal("Failed!", response.errorMessage, "error");
            }
            $scope.loading = false;
        }, function(error){
            console.log("Error available: ",error);
            swal('Error!', error.statusText, 'error');
            $scope.loading = false;
        });
    }
    $scope.loading=false;

}
