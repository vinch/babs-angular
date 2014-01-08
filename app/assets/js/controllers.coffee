babsAppControllers = angular.module 'babsAppControllers', []

babsAppControllers.controller 'StationListCtrl', ['$scope', '$http', '$location', 'GeolocationService', ($scope, $http, $location, geolocation) ->
  geolocation().then (position) ->
    $http.get('/stations?latitude=' + position.coords.latitude + '&longitude=' + position.coords.longitude).success (data) ->
      $scope.stations = data

  $scope.goToStation = (id) ->
    $location.path '/' + id

]

babsAppControllers.controller 'StationDetailCtrl', ['$scope', '$routeParams', '$http', 'GeolocationService', ($scope, $routeParams, $http, geolocation) ->
  $scope.isLoading = true
  geolocation().then (position) ->
    $http.get('/stations/' + $routeParams.stationId + '?latitude=' + position.coords.latitude + '&longitude=' + position.coords.longitude).success (data) ->
      $scope.station = data
      $scope.isLoading = false
]