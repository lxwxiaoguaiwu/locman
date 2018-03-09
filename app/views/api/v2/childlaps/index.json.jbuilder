json.code @code
json.message @message
json.gross @gross.each do |a|
  json.(a,:id,:leibie,:desc,:asset,:sercycle_id,:created_at)
  json.teacher Teacher.find(a.teacherid).name
end
json.fine @fine.each do |a|
  json.(a,:id,:leibie,:desc,:asset,:sercycle_id,:created_at)
  json.teacher Teacher.find(a.teacherid).name
end
json.congnitive @congnitive.each do |a|
  json.(a,:id,:leibie,:desc,:asset,:sercycle_id,:created_at)
  json.teacher Teacher.find(a.teacherid).name
end
json.language @language.each do |a|
  json.(a,:id,:leibie,:desc,:asset,:sercycle_id,:created_at)
  json.teacher Teacher.find(a.teacherid).name
end
json.selfhelp @selfhelp.each do |a|
  json.(a,:id,:leibie,:desc,:asset,:sercycle_id,:created_at)
  json.teacher Teacher.find(a.teacherid).name
end
json.social @social.each do |a|
  json.(a,:id,:leibie,:desc,:asset,:sercycle_id,:created_at)
  json.teacher Teacher.find(a.teacherid).name
end
