var positionOptionModuleController = angular.module('x.beirut.position.option-module.controllers', []);

// positionOptionModuleController.controller('positionCreateNew.ctrl',['$scope', '$window', '$modal', 'positionService', positionCreateNewModuleCtrlFunc]);
positionOptionModuleController.controller('positionCreateNew.ctrl', ['$scope', '$window', '$modal', 'positionService', positionCreateNewModuleCtrlFunc]);

function positionCreateNewModuleCtrlFunc($scope, $window, $modal, positionService){

    $scope.onFileSelect = function(ele){
        $scope.files = ele.files;
        var reader = new FileReader();
        reader.onload = function(e){
            console.log("about to encode");
            $scope.encoded_file = btoa(e.target.result.toString());
        };
        reader.readAsBinaryString($scope.files[0]);
    };

    $scope.submitPosition = function(){
        $scope.positionDTORequestString = "{'id': 'id'," +
            "'title': "+$scope.title+"," +
            "'jobType': "+$scope.jobType+"," +
            "'jobDivision': "+$scope.jobDivision+"}";

        $scope.positionNew = {
            positionDTORequestString: $scope.positionDTORequestString,
            filename: $scope.files[0].name,
            files: $scope.encoded_file
        }

        // for (var i = 0 ; i < $scope.files.length ; i ++){
        //     $scope.formData.append('files', $scope.files[i]);
        // }
        // console.log("$scope.formData: ",$scope.formData);
        console.log("$scope.positionNew: ",$scope.positionNew);
        // console.log("$scope.encoded_file: ",$scope.encoded_file);
        // console.log("$scope.positionDTORequestString: ",$scope.positionDTORequestString);
        // console.log("$scope.files: ",$scope.files);

        positionService.insertNewPosition({
            positionDTORequestString: $scope.positionDTORequestString,
            filename: $scope.files[0].name,
            files: $scope.encoded_file
        }, function(response){
            console.log("Response available");
            if(response.success){
                console.log("Success response: ",response);
            } else {
                swal("Failed!", response.errorMessage, "error");
            }
            // console.log(response);
            $scope.loading = false;
        }, function(error){
            console.log("Error available",error);
            swal('Error!', error.statusText, 'error');
            $scope.loading = false;
        });

    }

    $scope.fileNameChanged = function (ele) {
        var files = ele.files;
        var l = files.length;
        var namesArr = [];

        for (var i = 0; i < l; i++) {
            namesArr.push(files[i].name);
        }
        // console.log("Files: ",files);
        $scope.files = files;
    }

    $scope.loading=false;


}
