class Api::V2::BaseController < ApplicationController
  # disable the CSRF token
protect_from_forgery with: :null_session
attr_accessor :current_user

# disable the CSRF token
skip_before_action :verify_authenticity_token
# rescue_from Pundit::NotAuthorizedError, with: :deny_access

# disable cookies (no set-cookies header in response)
before_action :destroy_session

# def deny_access
#   api_error(status: 403,message:"无权限访问！")
# end

def destroy_session
  request.session_options[:skip] = true
end

# def api_error(opts = {})
#   render json: {status: opts[:status],message: opts[:message]}
# end


# def authenticate_user!
#   token, options = ActionController::HttpAuthentication::Token.token_and_options(request)
#
#   userid = options.blank?? nil : options[:userid]
#   user = userid && User.find(userid)
#
#   if user && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, token)
#     self.current_user = user
#   else
#     return unauthenticated!
#   end
# end

# def unauthenticated!
#   api_error(status: 401,message: "签名未验证！")
# end

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
