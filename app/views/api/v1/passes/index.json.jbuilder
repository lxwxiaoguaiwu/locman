json.code @code
json.message @message
json.passes @passes.each do |p|
  json.(p,:id,:title,:leixing,:desc,:user_id,:asset)
  time = p.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
  # json.assets p.passimgs,:asset
end
