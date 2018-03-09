# required
WxPay.appid = 'wx7be4244b6b0b43df'
WxPay.key = 'mei18jiu18he18zimei18jiu18he18zi'
WxPay.mch_id = '1497725182'
WxPay.debug_mode = true # default is `true`
WxPay.sandbox_mode = false # default is `false`

# cert, see https://pay.weixin.qq.com/wiki/doc/api/app/app.php?chapter=4_3
# using PCKS12
# WxPay.set_apiclient_by_pkcs12(File.read(pkcs12_filepath), pass)

# if you want to use `generate_authorize_req` and `authenticate`
WxPay.appsecret = '70627e78167e0ff6ff5671bea1ae501f'

# optional - configurations for RestClient timeout, etc.
WxPay.extra_rest_client_options = {timeout: 2, open_timeout: 3}
