json.code @code
json.message @message
json.sumcomment @allsermen.length
json.serman @allsermen.each do |s|
  json.(s,:name)
  json.tags s.tags, :id, :name
end
