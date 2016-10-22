var beirutController = angular.module('beirutController', []);

beirutController.controller('CandidatePositionController',['$scope','$http','$routeParams', function($scope,$http,$routeParams){
	changeTitleHeader("Recruitment Center");
}]);

beirutController.controller('PositionController',['$scope','$http','$routeParams', function($scope,$http,$routeParams){
	changeTitleHeader("Jobs Management");
	$http.get("position/getAllPosition?clientId=1&storeId=1&requestId=1&channelId=1&username=1").success(function(response){
	 console.log(response);
		$scope.positionsContent = response.content;
		console.log($scope.positionsContent);
	//httpGet("http://localhost:8180/beirut/api/position/getAllPosition?clientId=1&storeId=1&requestId=1&channelId=1&username=1");
});

	$scope.clickPosition = function(id){
		console.log($scope.itr);
		$scope.activeData = $scope.positionsContent[id];
		console.log($scope.activeData);
	}

}]);
function httpGet(theUrl)
{
    var xmlHttp = new XMLHttpRequest();
    xmlHttp.open( "GET", theUrl, false ); // false for synchronous request
    xmlHttp.send( null );
    return xmlHttp.responseText;
}
