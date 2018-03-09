class LapChannel < ApplicationCable::Channel
  def subscribed
    lap = Lap.find(params[:id])
    stream_for lap
  end
end
