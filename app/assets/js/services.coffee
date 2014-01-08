babsAppServices = angular.module 'babsAppServices', []

babsAppServices.factory 'GeolocationService', ['$q', '$window', '$rootScope', ($q, $window, $rootScope) ->
  return ->
    deferred = $q.defer()
    unless 'geolocation' of $window.navigator
      deferred.reject 'Geolocation is not supported'
    else
      $window.navigator.geolocation.getCurrentPosition (position) ->
        $rootScope.$apply ->
          deferred.resolve position

    deferred.promise
]