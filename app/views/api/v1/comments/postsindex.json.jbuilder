json.code @code
json.message @message
if @all_comments
  json.commentlenght @all_comments.length
  json.comment @all_comments.each do |c|
    json.id c.id
    json.title c.body
    json.commentable_id c.commentable_id
    json.time c.updated_at
    time = c.updated_at.strftime("%Y-%m-%d %T").to_s
    json.time time
    json.userid c.user.id
    json.username c.user.wename
    json.userasset c.user.weno
  end
end
if @event
  json.post do
    json.id @event.id
    json.title @event.title
    json.assets @commentable.postimgs,:asset
    json.body @event.body
    json.leixing "event"
    json.status @userstatus
    time = @event.created_at.strftime("%Y-%m-%d %T").to_s
    json.time time
    user = @event.user
    if user
      json.userid user.id
      json.username user.wename
      json.userasset user.weno
    end
  end
elsif @serman
    json.post do
      json.id @serman.id
      json.name @serman.name
      json.phone @serman.phone
      json.assets @commentable.postimgs,:asset
      json.desc @serman.desc
      json.leixing "serman"
      if @tagthumbs
        json.tagthumbs @tagthumbs.each_pair do |k,v|
          json.tag k
          json.sumthumbs v
        end
      end
      time = @serman.created_at.strftime("%Y-%m-%d %T").to_s
      json.time time
      user = @serman.user
      if user
        json.userid user.id
        json.username user.wename
        json.userasset user.weno
      end
    end
else
  json.post do
    if @commentable
      json.id @commentable.id
      json.title @commentable.title
      json.assets @commentable.postimgs,:asset
      json.leixing @commentable.leixing
      time = @commentable.created_at.strftime("%Y-%m-%d %T").to_s
      json.time time
      json.userid @commentable.user.id
      json.username @commentable.user.wename
      json.userasset @commentable.user.weno
    end
  end
end
