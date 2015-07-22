angular.module('app.boardApp').controller "BoardCtrl", ($scope, $http)->
    
    # The selected item will be stored in this var
    $scope.models =
      selected: null

    # Get the list from the server
    $http.get('/boards/27.json').success((data, status, headers, config) ->
      $scope.models.lists = data.tasks
      return
    )