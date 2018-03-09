json.code @code
json.message @message
json.webgoods @webgoods.each do |w|
  json.id w.id
  json.number w.number
  json.currprice w.currprice
  json.name w.category.alcohol.name
  json.asset w.category.asset
  json.leibie w.category.leibie
end
