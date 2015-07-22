angular.module('app.boardApp').controller "BoardCtrl", ($scope, $http)->
    $http.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')

    # The selected item will be stored in this var
    $scope.models =
      selected: null

    $scope.task =
      status: null

    # Get the list from the server
    $http.get('/boards/'+$('.ng-scope').data('boardid')+'.json').success((data, status, headers, config) ->
      $scope.board = data.id
      $scope.models.lists = data.tasks
      return
    )

    $scope.createTask = (task) ->
      $http.post('/tasks.json', {task: task}).success((data, status, headers, config) ->
        $scope.models.lists[data.status].items.push(data)
        $('#myModal').modal("toggle")
        return
      )

    $scope.dropCallback = (index, item, listName) ->
      $http.put('/tasks/'+item.id+'.json', {status: listName}).success((data, status, headers, config) ->
        console.log data
      ).error((data) ->
        return false
      )
      item
