babsApp = angular.module 'babsApp', ['ngRoute', 'babsAppControllers', 'babsAppFilters', 'babsAppServices']

babsApp.config ['$routeProvider', ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: '/partials/list'
      controller: 'StationListCtrl'
    })
    .when('/:stationId', {
      templateUrl: 'partials/detail'
      controller: 'StationDetailCtrl'
    })
    .otherwise({
      redirectTo: '/'
    })
]