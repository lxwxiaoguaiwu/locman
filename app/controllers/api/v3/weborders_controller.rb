class Api::V3::WebordersController < Api::V3::BaseController

  def create
    @order = Weborder.new()
    price = params[:price].to_s
    @order.price = price
    # TODO:判断地址id是否存在，判断地址是否和user对应----程序会自动查找外键记录
    #0->待支付，1->支付完成,-1->支付失败 -2->取消
    @order.paystatus = "待支付"
    addressid = params[:addressid].to_i
    @order.alcoaddress_id =addressid
    @order.alcoholuser_id = params[:userid].to_i
    @order.packstatus = "0"
    @order.save
    saveornot(@order.reload)
    wines = params[:wineid]
    numbers = params[:number]
    $index = 0
    while $index < wines.length  do
      orderitem = Orderitem.new
      orderitem.weborder_id = @order.id
      orderitem.category_id =wines[$index]
      orderitem.number = numbers[$index].to_i
      orderitem.save
      $index += 1
    end
    user = Alcoholuser.find(params[:userid])
    params1 = {
      body: '易到购',
      out_trade_no: @order.serialnum,
      total_fee:1,
      spbill_create_ip: '127.0.0.1',
      notify_url: 'https://api.changching.cn/api/v3/web/response',
      trade_type: 'JSAPI', # could be "JSAPI", "NATIVE" or "APP",
      openid: user.openid
    }

    r = WxPay::Service.invoke_unifiedorder params1
    # -------------------
    log = Serverlog.new
    log.logtext = "aaa-#{r}"
    log.save
    # -------------------
    prepay_id = r['prepay_id']
    params2 = {
      prepayid: prepay_id,
      noncestr: r['nonce_str']
    }
    @wxresponse = WxPay::Service.generate_app_pay_req params2
  end




  def weixinorder
    result = Hash.from_xml(request.body.read)["xml"]
    # -------------------
    log = Serverlog.new
    log.logtext = "bbb-#{result}"
    log.save
    # -------------------
    if WxPay::Sign.verify?(result)
      tno = result['out_trade_no']
      @order = Weborder.find_by(serialnum: tno)
      if @order
        @order.paystatus = "待评价"
        @order.save
        saveornot(@order.reload)
      end
      render :xml => {return_code: "SUCCESS"}.to_xml(root: 'xml', dasherize: false)
    else
      render :xml => {return_code: "FAIL", return_msg: "签名失败"}.to_xml(root: 'xml', dasherize: false)
    end
  end


  def index
    if params[:userid]
      # ['待支付','待评价'，'已完成']
      if params[:status]
        @orders = Weborder.where(alcoholuser_id: params[:userid],paystatus: params[:status])
      else
        @orders = Weborder.where(alcoholuser_id: params[:userid],paystatus: ["待评价","已完成"])
      end
      zerornot(@orders)
    else
      @code = CERROR
      @message = "未知参数！"
    end
  end


end
