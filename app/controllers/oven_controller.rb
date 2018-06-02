class OvenController < ApplicationController
	before_action :oven_params, only: [:index, :status, :event]

	def index
		@oventime = redis.get('time')
		@ovenpower = redis.get('power')
		@ovenstate = redis.get('state')
	end

	def status
		render json: { time: redis.get('time'), power: redis.get('power'), state: redis.get('state') }
	end

	def event
		case params[:microwave_action]
		when "increase_time"
			redis.set('time', redis.get('time').to_i + 10)
			render json: {}
		when "decrease_time"
			redis.set('time', redis.get('time').to_i - 10)
			render json: {}
		when "cancel"
			render json: {}
		when "increase_power"
			redis.set('power', redis.get('power').to_i+100)
			render json: { }
		when "decrease_power"
			redis.set('power', redis.get('power').to_i-100)
			render json: { }
		when "switch_on"
			redis.set('state', 'ON')
			render json: { state: "ON" }
		when "switch_off"
			redis.set('state', 'OFF')
			render json: { state: "OFF"}
		else
			puts "There is no microwave action such as " + params[:microwave_action]
		end
	end

	private
	def oven_params
		@oven = Oven.first
	end
end
