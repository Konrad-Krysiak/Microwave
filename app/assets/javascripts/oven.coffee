# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

	$('#inc_time').click ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "increase_time"},
			success: (data, textStatus, jqXHR) ->
				alert("")

		})

	$("#inc_power").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "increase_power"},
			success: (data) ->
				$("#power").text(data["power"])
		})