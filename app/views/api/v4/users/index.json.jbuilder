json.code @code
json.message @message

if @newusers
  json.newusers @newusers.each do |u|
    json.(u,:id,:phone,:wename,:weno,:gender)
    today = Time.new
    json.jointime ((today - u.created_at)/60/60/24).to_i
  end
end
if @users
  json.user @users.each do |u|
    json.(u,:id,:phone,:wename,:weno,:gender)
    today = Time.new
    json.jointime ((today - u.created_at)/60/60/24).to_i
  end
end
