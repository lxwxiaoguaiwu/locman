class Api::V3::GradordersController < Api::V3::BaseController

  def index
    if params[:userid]
      # ['待使用','待支付','待评价'，'已完成']
      if params[:status]
        @orders = Gradorder.where(alcoholuser_id: params[:userid],status: params[:status])
      else
        @orders = Gradorder.where(alcoholuser_id: params[:userid],status: ["待使用","待评价","已完成"])
      end
      zerornot(@orders)
    else
      @code = CERROR
      @message = "未知参数！"
    end
  end

  def create
    @order = Gradorder.new()
    totalprice = params[:totalprice].to_f
    @order.totalprice = totalprice
    @order.alcoholuser_id = params[:userid]
    # ['待使用','待支付','待评价'，'已完成']
    @order.status = "待支付"
    @order.category_id = params[:categoryid].to_i
    @order.number = params[:number].to_i
    @order.gradevin_id = params[:gradevinid]
    @order.save
    saveornot(@order.reload)
    user = Alcoholuser.find(params[:userid])
    params1 = {
      body: '无人go订单',
      out_trade_no: @order.serialnum ,
      total_fee:1,
      spbill_create_ip: '127.0.0.1',
      notify_url: 'https://api.changching.cn/api/v3/wx/response',
      trade_type: 'JSAPI', # could be "JSAPI", "NATIVE" or "APP",
      openid: user.openid
    }

    r = WxPay::Service.invoke_unifiedorder params1
    prepay_id = r['prepay_id']

    params2 = {
      prepayid: prepay_id,
      noncestr: r['nonce_str']
    }
    @wxresponse = WxPay::Service.generate_app_pay_req params2
  end




  def weixinorder
    result = Hash.from_xml(request.body.read)["xml"]
    if WxPay::Sign.verify?(result)
      tno = result['out_trade_no']
      @order = Gradorder.find_by(serialnum: tno)
      if @order
        @order.status = "待使用"
        @order.save
      end
      render :xml => {return_code: "SUCCESS"}.to_xml(root: 'xml', dasherize: false)
    else
      render :xml => {return_code: "FAIL", return_msg: "签名失败"}.to_xml(root: 'xml', dasherize: false)
    end
  end


end
