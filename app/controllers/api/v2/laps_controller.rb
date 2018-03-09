class Api::V2::LapsController < Api::V2::BaseController

  def index
    child = Child.find(params[:childid])
    $age =  params[:month].to_i
    @laps = Array.new
    case $age
    when 0..12
      # @laps = Lap.where(leibie: params[:leibie],month: (params[:prearea])..params[:endarea])
      @laps = Lap.where(leibie: params[:leibie],month: 0..12).order(month: :ASC)
    when 13..24
      @laps = Lap.where(leibie: params[:leibie],month: 13..24).order(month: :ASC)
    when 25..36
      @laps = Lap.where(leibie: params[:leibie],month: 25..36).order(month: :ASC)
    when 37..48
      @laps = Lap.where(leibie: params[:leibie],month: 37..28).order(month: :ASC)
    when 49..60
      @laps = Lap.where(leibie: params[:leibie],month: 49..60).order(month: :ASC)
    else
      puts "---------------------"
    end
    zerornot(@laps)
  end


end
