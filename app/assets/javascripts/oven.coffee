$(document).ready ->
	setInterval () ->
		$.ajax({
			url: '/oven/status',
			success: (data) ->
				$('#time').html "Time: " + data['time']
				$('#power').html "Power: " + data['power']
		})
	, 1000


	$("#switch_on").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "switch_on"},
			success: (data) ->
				$("#state").html "State: " + data['state']
		})


	$("#switch_off").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "switch_off"},
			success: (data) ->
				$("#state").html "State: " + data['state']
		})

	$("#inc_power").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "increase_power"},
			success: (data) ->
				$("#responses").html "power increased by 100"
		})


	$("#dec_power").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "decrease_power"},
			success: (data) ->
				$("#responses").html "power decreased by 100"
		})


	$('#inc_time').click ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "increase_time"},
			success: (data) ->
				$("#responses").html "time increased by 10"
		})

	$('#dec_time').click ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "decrease_time"},
			success: (data) ->
				$("#responses").html "time decreased by 10"
		})