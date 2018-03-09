json.code @code
json.message @message
json.orders @orders.each  do |a|
  json.(a,:id,:status,:totalprice,:number)
  json.gradevinid a.gradevin.name
  json.name a.category.alcohol.name
  json.asset a.category.asset
  json.category a.category.desc
  json.leibie a.category.leibie
  json.caid a.category.id
  json.serialnum a.serialnum
end
