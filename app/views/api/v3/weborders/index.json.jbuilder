json.code @code
json.message @message
json.weborder @orders.each do |o|
  json.id o.id
  json.paystatus o.paystatus
  json.price o.price
  address = Alcoaddress.find(o.alcoaddress_id)
  json.address address.addressinfo
  json.toname address.toname
  json.packstatus o.packstatus
  json.packprice o.packprice
  items = o.orderitems
  json.items items.each do |i|
    json.number i.number
    json.caid i.category.id
    json.desc i.category.desc
    json.asset i.category.asset
    json.leibie i.category.leibie
    json.name i.category.alcohol.name
    json.price i.category.price
  end
end
