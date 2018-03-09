json.code @code
json.message @message
json.gradpaid @alreadypaids.each do |a|
  json.(a,:status,:totalprice,:number)
  json.gradevinid a.gradevin.name
  json.name a.category.alcohol.name
  json.asset a.category.asset
  json.category a.category.desc
  json.serialnum a.serialnum
end
json.webpaid @webpaids.each do |w|
  json.id w.id
  json.paystatus w.paystatus
  json.price w.price
  address = Alcoaddress.find(w.alcoaddress_id)
  json.address address.addressinfo
  json.toname address.toname
  json.packstatus w.packstatus
  json.packprice w.packprice
  items = w.orderitems
  json.items items.each do |i|
    json.number i.number
    json.desc i.category.desc
    json.asset i.category.asset
    json.name i.category.alcohol.name
    json.price i.category.price
  end
end
json.gradtopaid @tobepaids.each do |a|
  json.(a,:status,:totalprice,:number)
  json.gradevinid a.gradevin.name
  json.name a.category.alcohol.name
  json.asset a.category.asset
  json.category a.category.desc
  json.serialnum a.serialnum
end
json.webtopaid @topaids.each do |w|
  json.id w.id
  json.paystatus w.paystatus
  json.price w.price
  address = Alcoaddress.find(w.alcoaddress_id)
  json.address address.addressinfo
  json.toname address.toname
  json.packstatus w.packstatus
  json.packprice w.packprice
  items = w.orderitems
  json.items items.each do |i|
    json.number i.number
    json.desc i.category.desc
    json.asset i.category.asset
    json.name i.category.alcohol.name
    json.price i.category.price
  end
end
