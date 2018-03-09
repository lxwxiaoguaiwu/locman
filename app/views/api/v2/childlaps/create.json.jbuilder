json.code @code
json.message @message
json.(@childlap,:id,:leibie,:desc,:asset,:sercycle_id,:created_at)
json.teacher Teacher.find(@childlap.teacherid).name
