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
        $scope.fileBase64 = new FileReader();
        $scope.fileBase64.readAsDataURL($scope.files[0]);
        console.log("$scope.fileBase64: ",$scope.fileBase64);
    };

    $scope.submitPosition = function(){
        $scope.positionDTORequestString = "{\"id\": \"id\"," +
            "\"title\": \""+$scope.title+"\"," +
            "\"jobType\": \""+$scope.jobType+"\"," +
            "\"jobDivision\": \""+$scope.jobDivision+"\"}";

        $scope.positionNew = {
            positionDTORequestString: $scope.positionDTORequestString,
            filename: $scope.files[0].name,
            base64File: $scope.fileBase64.result
        }

        console.log("$scope.positionNew: ",$scope.positionNew);
        //Convert file to img base 64


        positionService.insertNewPosition({
            positionDTORequestString: $scope.positionDTORequestString,
            filename: $scope.files[0].name,
            base64File: $scope.fileBase64.result
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

        //     $http({
        //         method: 'POST',
        //         url: 'EmployeeService/employee/data/fileupload',
        //         headers: {'Content-Type': undefined},
        //         data: fd,
        //         transformRequest: angular.identity
        //     })
        //         .success(function(data, status) {
        //             alert("success");
        //         });
        // }
        //     --

    }

    // $scope.fileNameChanged = function (ele) {
    //     var files = ele.files;
    //     var l = files.length;
    //     var namesArr = [];
    //
    //     for (var i = 0; i < l; i++) {
    //         namesArr.push(files[i].name);
    //     }
    //     // console.log("Files: ",files);
    //     $scope.files = files;
    // }

    $scope.loading=false;

    
}
