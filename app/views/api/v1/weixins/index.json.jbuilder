json.code @code
json.message @message

if @weixins.length != 0
  json.weixin @weixins.each do |p|
      json.wid p.id
      json.wname p.name
      json.weino p.weino
      json.desc p.desc
      json.assets p.weixinimgs,:asset
      json.sumcomment Comment.where(commentable: p).length
      time = p.created_at.strftime("%Y-%m-%d").to_s
      json.updatetime time
      json.xq_id p.xiaoqu_id
      json.uid p.user.id
      json.uname p.user.wename
      json.uasset p.user.weno
  end
end
