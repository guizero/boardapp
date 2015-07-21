angular.module('app.boardApp').controller("BoardCtrl", [
  '$scope',
  ($scope)->

    $scope.models =
      selected: null
      lists:
        'A':
          'name': 'To do'
          'class': 'red'
          'items': []
        'B':
          'name': 'In progress'
          'class': 'light-blue'
          'items': []
        'C':
          'name': 'In verification'
          'class': 'yellow'
          'items': []
        'D':
          'name': 'Done'
          'class': 'green'
          'items': []

    # Generate initial model
    i = 1
    while i <= 3
      $scope.models.lists.A.items.push label: 'Item A' + i
      $scope.models.lists.B.items.push label: 'Item B' + i
      $scope.models.lists.C.items.push label: 'Item C' + i
      $scope.models.lists.D.items.push label: 'Item D' + i
      ++i

    # Model to JSON for demo purpose
    $scope.$watch 'models', ((model) ->
      $scope.modelAsJson = angular.toJson(model, true)
      return
    ), true




])