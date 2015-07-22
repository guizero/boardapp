@app = angular.module('app', ['templates'])

@app.run(->
  console.log 'angular app running'
)
