json.code @code
json.message @message
json.detailedlist do
  json.(@order, :id,:serialnum, :totalprice,
     :alcoholuser_id,  :status, :category_id,
     :number,:gradevin_id,:created_at)
  json.wxresponse @wxresponse
end
