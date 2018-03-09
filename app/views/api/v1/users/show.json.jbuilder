json.code @code
json.message @message
if @user
  json.(@user,:id,:phone,:wename,:weno,:gender)
  json.recommend Serman.where(user: @user).length
  json.topic Post.where(user: @user).length
  json.comment Comment.where(user: @user).length
  today = Time.new
  json.jointime ((today - @user.created_at)/60/60/24).to_i
end
