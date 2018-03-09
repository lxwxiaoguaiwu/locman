class Api::V3::BaseController < ApplicationController
    # disable the CSRF token
  protect_from_forgery with: :null_session
  attr_accessor :current_user

  # disable the CSRF token
  skip_before_action :verify_authenticity_token
  before_action :destroy_session
  def destroy_session
    request.session_options[:skip] = true
  end

  # code --message define------------start
  CSUCCESS = 10000
  CERROR = 10001
  CEMPTY = 10002
  CHAVEDATA = 10003

  MSUCCESS = "请求成功！"
  MERROR = "请求失败！"
  MEMPTY = "暂无数据！"
  MHAVEDATA = "获取数据成功！"
  # code --message define------------end

  # pay status -----------------start
      #0->待支付，1->支付完成,-1->支付失败 -2->取消
  # pay status -----------------end



  def nullornot(obj)
    if obj
      @code = CHAVEDATA
      @message = MHAVEDATA
    else
      @code = CERROR
      @message = MERROR
    end
  end
  def saveornot(obj)
    if obj
      @code = CSUCCESS
      @message = MSUCCESS
    else
      @code = CERROR
      @message = MERROR
    end
  end

  def zerornot(obj)
    if obj.length != 0
      @code = CSUCCESS
      @message = MSUCCESS
    else
      @code = CEMPTY
      @message = MEMPTY
    end
  end

end
