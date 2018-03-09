# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = Admin.find_or_create_by(email: 'admin@changching.cn')
admin.password = "Cc2017"
admin.add_role :admin
admin.save
# xq = Xiaoqu.all
# if xq
#   xq.delete_all
# end
#
# sq = Shangquan.all
# if sq
#   sq.delete_all
# end
#
# quxian = Quxian.all
# if quxian
#   quxian.delete_all
# end
#
# xs = TBjVillage.all
# xs.each do |x|
#   c = City.find_or_create_by(name: '北京')
#   c_id = c.id
#
#   qux = Quxian.find_or_create_by(name: x.quxian)
#   qux.city_id = c_id
#   qux.save
#   qu_id = qux.id
#
#   shang = Shangquan.find_or_create_by(name: x.shangquan)
#   shang.quxian_id = qu_id
#   shang.pinyin = x.sqpinyin
#   shang.save
#   sq_id = shang.id
#   py = HanziToPinyin.hanzi_to_pinyin(x.housetitle)[0]
#   xq = Xiaoqu.create(name:x.housetitle,pinyin:py,location:x.address,city_id:c_id,quxian_id:qu_id,shangquan_id:sq_id)
#   xq.save
# end
#
# sh = TShVillage.all
# sh.each do |x|
#   c = City.find_or_create_by(name: '上海')
#   c.save
#   c_id = c.id
#
#   shqux = Quxian.find_or_create_by(name: x.quxian)
#   shqux.city_id = c_id
#   shqux.save
#   qu_id = shqux.id
#
#   shshang = Shangquan.find_or_create_by(name: x.shangquan)
#   shshang.quxian_id = qu_id
#   shshang.pinyin = x.sqpinyin
#   shshang.save
#   sq_id = shshang.id
#   shpy = HanziToPinyin.hanzi_to_pinyin(x.housetitle)[0]
#   shxq = Xiaoqu.create(name:x.housetitle,pinyin:shpy,location:x.address,city_id:c_id,quxian_id:qu_id,shangquan_id:sq_id)
#   shxq.save
# end
#
#
# gz = TGzVillage.all
# gz.each do |x|
#   c = City.find_or_create_by(name: '广州')
#   c_id = c.id
#
#   gzqux = Quxian.find_or_create_by(name: x.quxian)
#   gzqux.city_id = c_id
#   gzqux.save
#   qu_id = gzqux.id
#
#   gzshang = Shangquan.find_or_create_by(name: x.shangquan)
#   gzshang.quxian_id = qu_id
#   gzshang.pinyin = x.sqpinyin
#   gzshang.save
#   sq_id = gzshang.id
#   gzpy = HanziToPinyin.hanzi_to_pinyin(x.housetitle)[0]
#   gzxq = Xiaoqu.create(name:x.housetitle,pinyin:gzpy,location:x.address,city_id:c_id,quxian_id:qu_id,shangquan_id:sq_id)
#   gzxq.save
# end
#
# sz = TSzVillage.all
# sz.each do |x|
#   c = City.find_or_create_by(name: '深圳')
#   c_id = c.id
#
#   szqux = Quxian.find_or_create_by(name: x.quxian)
#   szqux.city_id = c_id
#   szqux.save
#   qu_id = szqux.id
#
#   szshang = Shangquan.find_or_create_by(name: x.shangquan)
#   szshang.quxian_id = qu_id
#   szshang.pinyin = x.sqpinyin
#   szshang.save
#   sq_id = szshang.id
#   szpy = HanziToPinyin.hanzi_to_pinyin(x.housetitle)[0]
#   szxq = Xiaoqu.create(name:x.housetitle,pinyin:szpy,location:x.address,city_id:c_id,quxian_id:qu_id,shangquan_id:sq_id)
#   szxq.save
# end
