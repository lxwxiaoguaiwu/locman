json.code @code
json.message @message
json.comment do
  json.(@comment, :user_id,:body,:commentable_id)
  time = @comment.created_at.strftime("%Y-%m-%d %T").to_s
  json.time time
end
