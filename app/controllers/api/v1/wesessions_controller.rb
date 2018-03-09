class Api::V1::WesessionsController < Api::V1::BaseController
  def create
    puts "----------------------------------1"
    wse = Wxsession.new
    puts "----------------------------------2"
    # wse.asseta = params[:asseta]
    puts "--------------#{params[:asseta]}--------------------3"
    wse.save
  end
end
