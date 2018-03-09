class Api::V1::ExchangesController < Api::V1::BaseController
  before_action :authenticate_user!

  def create
    begin
      exch = Exchange.find_by(user_id: params[:userid],pass_id: params[:passid])
      if exch
        @code = 10001
        @message = "您已加入该交换"
      else
        @exchange = Exchange.new
        @exchange.user_id = params[:userid]
        @exchange.pass_id = params[:passid]
        @exchange.desc = params[:desc]
        @exchange.save
        nullornot(@exchange.reload)
      end
    rescue Exception => e
      @code = 10001
      @message = e.message 
    end
  end


  def index
    @exchanges = Exchange.where(pass_id: params[:passid]).order(created_at: :DESC)
    zerornot(@exchanges)
  end

end
