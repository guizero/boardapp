angular.module('app.boardApp').controller("BoardCtrl", [
  '$scope',
  ($scope)->

    $scope.models =
      selected: null
      lists:
        '0':
          'name': 'To do'
          'class': 'red'
          'items': []
        '1':
          'name': 'In progress'
          'class': 'light-blue'
          'items': []
        '2':
          'name': 'In verification'
          'class': 'yellow'
          'items': []
        '3':
          'name': 'Done'
          'class': 'green'
          'items': []

    # Generate initial model
    i = 1
    while i <= 3
      $scope.models.lists[0].items.push label: 'Item A' + i
      $scope.models.lists[1].items.push label: 'Item B' + i
      $scope.models.lists[2].items.push label: 'Item C' + i
      $scope.models.lists[3].items.push label: 'Item D' + i
      ++i

    # Model to JSON for demo purpose
    $scope.$watch 'models', ((model) ->
      $scope.modelAsJson = angular.toJson(model, true)
      return
    ), true




])