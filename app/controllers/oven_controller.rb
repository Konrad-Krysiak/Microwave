class OvenController < ApplicationController
	before_action :oven_params, only: [:index, :status, :event]

	def index
	end

	def status
		render json: { time: @oven.time, power: @oven.power }
	end


	def event
		case params[:microwave_action]
		when "increase_time"
			render json: {time: 65, power: 400 }
		when "decrease_time"
			render json: {time: 65, power: 400 }
		when "cancel"
			render json: {time: 65, power: 400 }
		when "increase_power"
			@oven.update(power: @oven.power+=100)
			render json: { power: @oven.power }
		when "decrease_power"
			render json: {time: 65, power: 400 }
		else
			puts "There is no microwave action such as " + params[:microwave_action]
		end
	end

	private
	def oven_params
		@oven = Oven.first
	end
end
