angular.module('app.boardApp').controller "BoardCtrl", [
  '$scope'
  '$http'
  ($scope, $http) ->
    $http.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

    # The selected item will be stored in this var
    $scope.board =
      selected: null

    $scope.task =
      status: null

    # Get the list from the server
    $http.get('/boards/'+$('.ng-scope').data('boardid')+'.json').success((data, status, headers, config) ->
      $scope.board = data
      return
    )

    $scope.createTask = (task) ->
      $http.post('/tasks.json', {task: task}).success((data, status, headers, config) ->
        $scope.board.tasks[data.status].items.push(data)
        $('#myModal').modal("toggle")
        return
      )

    $scope.dropCallback = (index, item, listName) ->
      $http.put('/tasks/'+item.id+'.json', {status: listName, index: index}).success((data, status, headers, config) ->
      ).error((data) ->
        return false
      )
      item

    $scope.removeFromlist = (list, index, item) ->
      $http.delete('/tasks/'+item.id+'.json').success((data, status, headers, config) ->
        list.items.splice(index, 1)
      ).error((data) ->
        return false
      )

    $scope.updateBoard = () ->
      $http.put('/boards/'+$scope.board.id+'.json', {board: $scope.board}).success((data, status, headers, config) ->
      ).error((data) ->
        return false
      )
]