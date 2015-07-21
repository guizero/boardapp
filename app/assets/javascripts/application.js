// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap

// Angular are used in boards
//= require angular
//= require angular-rails-templates
//= require boards/app
//= require_tree ./boards/templates
//= require_tree ./boards/modules
//= require_tree ./boards/filters
//= require_tree ./boards/directives
//= require_tree ./boards/models
//= require_tree ./boards/services
//= require_tree ./boards/controllers

// Router for specific JS
//= require routerrouter
//= require router_rules
//= require_tree ./application