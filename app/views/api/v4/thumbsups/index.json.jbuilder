json.code @code
json.message @message
json.sermen @allSermen.each do |s|
  json.(s,:id,:name,:phone,:desc,:gender,:post_id)
  time = s.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
end
