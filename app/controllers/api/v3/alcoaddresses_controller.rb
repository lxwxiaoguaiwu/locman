class Api::V3::AlcoaddressesController < Api::V3::BaseController
  def create
    address  = Alcoaddress.new
    address.alcoholuser_id = params[:userid]
    address.tel = params[:tel]
    address.addressinfo = params[:addressinfo]
    address.toname = params[:toname]
    address.save
  end

  def index
    @adds = Alcoaddress.where(alcoholuser_id: params[:userid])
    zerornot(@adds)
  end

  def destory
    address = Alcoaddress.find(params[:id])
    address.destory
    @addresses = Alcoholuser.find(params[:userid]).alcoaddresses
  end
end
