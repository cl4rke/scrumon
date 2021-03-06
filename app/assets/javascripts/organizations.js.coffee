# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module 'OrganizationsApp', []
	.controller 'TasksController', ['$http', ($http) ->
		Task = this

		Task.loaded = true

		Task.newTask = ''
		Task.objects = [ ]

		Task.add = ->
			$http.post '/tasks/create', {title: Task.newTask, organization_id: Task.org_id}
				.success (data) ->
					for i in [0...Task.objects.length]
						if Task.objects[i].id is -1
							Task.objects[i] = data
							break

			Task.objects.push {title: Task.newTask, id: -1}
			Task.newTask = ''

		Task.alterStatus = (task) ->
			task.done = !task.done
			$http.post '/tasks/update', task
	]
