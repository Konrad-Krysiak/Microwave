$(document).ready ->

	$.ajax({
	url: '/oven/status',
	success: (data) ->
		if data['state']=="OFF"
			$(".spinning").css "animation-play-state", "paused"
})

	setInterval () ->
		$.ajax({
			url: '/oven/status',
			success: (data) ->
				$('#time').html data['time'] + "s"
				$('#power').html data['power'] + "W"
		})
	, 1000


	$("#switch_on").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "switch_on"},
			success: (data) ->
				$("#state").html data['state']
				$(".spinning").css "animation-play-state", "running"
		})


	$("#switch_off").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "switch_off"},
			success: (data) ->
				$("#state").html data['state']
				$(".spinning").css "animation-play-state", "paused"
		})

	$("#inc_power").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "increase_power"},
			success: (data) ->
				return
		})


	$("#dec_power").click (e) ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "decrease_power"},
			success: (data) ->
				return
		})


	$('#inc_time').click ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "increase_time"},
			success: (data) ->
				return
		})

	$('#dec_time').click ->
		$.ajax({
			url: '/oven/event',
			method: 'POST',
			dataType: "json",
			data: {"microwave_action": "decrease_time"},
			success: (data) ->
				return
		})