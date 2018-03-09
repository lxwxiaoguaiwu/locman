json.code @code
json.message @message
json.weborder do
  json.id @order.id
  json.paystatus @order.paystatus
  json.price @order.price
  address = Alcoaddress.find(@order.alcoaddress_id)
  json.address address.addressinfo
  json.toname address.toname
  json.packstatus @order.packstatus
  json.packprice @order.packprice
  items = @order.orderitems
  json.items items.each do |i|
    json.number i.number
    json.desc i.category.desc
    json.asset i.category.asset
    json.name i.category.alcohol.name
    json.price i.category.price
  end
  json.wxresponse @wxresponse
end
