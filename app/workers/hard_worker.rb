require 'sidekiq-scheduler'

class HardWorker
  include Sidekiq::Worker

  def perform
  	r = Redis.new
  	time = Integer(r.get('time'))
  	if time > 0 && r.get('state')=='ON'
  		r.set('time', time-1)
  	end
  end
end
