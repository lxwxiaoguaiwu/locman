json.code @code
json.message @message
# json.id @webgood.id
json.status @webgood.status
json.number @webgood.number
json.preprice @webgood.preprice
json.currprice @webgood.currprice
category = @webgood.category
json.id category.id
json.desc category.desc
json.name category.alcohol.name
json.asset category.asset
json.serial category.code
json.leibie category.leibie
json.detailimgs category.imgcategories,:asset
json.comments @alcscores.each do |a|
  json.(a,:code,:maleco,:femaleco)
end
