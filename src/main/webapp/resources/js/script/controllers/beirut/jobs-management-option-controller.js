var positionOptionModuleController = angular.module('x.beirut.position.option-module.controllers', []);

positionOptionModuleController.controller('positionCreateNew.ctrl', ['$scope', '$window', '$modal', 'positionService', positionCreateNewModuleCtrlFunc]);

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
