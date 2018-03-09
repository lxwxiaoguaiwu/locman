json.code @code
json.message @message
  # json.id @gradgood.id
json.status @gradgood.status
json.number @gradgood.number
json.preprice @gradgood.preprice
json.currprice @gradgood.currprice
category = @gradgood.category
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
