# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180302082311) do

  create_table "admins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "admins_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "admin_id"
    t.bigint "role_id"
    t.index ["admin_id", "role_id"], name: "index_admins_roles_on_admin_id_and_role_id"
    t.index ["admin_id"], name: "index_admins_roles_on_admin_id"
    t.index ["role_id"], name: "index_admins_roles_on_role_id"
  end

  create_table "alcoaddresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "alcoholuser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tel"
    t.string "addressinfo"
    t.string "toname"
    t.string "latitude"
    t.string "longitude"
    t.index ["alcoholuser_id"], name: "index_alcoaddresses_on_alcoholuser_id"
  end

  create_table "alcohols", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "leibie"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "alcoholusers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "wename"
    t.string "weasset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "openid"
    t.string "sessionkey"
    t.string "responsebody"
    t.integer "gender"
  end

  create_table "alcrecords", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "tagsc"
    t.bigint "alcohol_id"
    t.bigint "alcoholuser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcohol_id"], name: "index_alcrecords_on_alcohol_id"
    t.index ["alcoholuser_id"], name: "index_alcrecords_on_alcoholuser_id"
  end

  create_table "alcscores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "code"
    t.integer "maleco"
    t.integer "femaleco"
    t.bigint "alcohol_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alcohol_id"], name: "index_alcscores_on_alcohol_id"
  end

  create_table "applies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_applies_on_event_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "standard"
    t.string "desc"
    t.string "price"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "alcohol_id"
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.string "leibie"
    t.index ["alcohol_id"], name: "index_categories_on_alcohol_id"
  end

  create_table "checkups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "lefteye"
    t.string "righteye"
    t.string "lefthearing"
    t.string "righthearing"
    t.string "teeth"
    t.string "heartrate"
    t.string "tempertature"
    t.string "diastolic"
    t.string "systolic"
    t.date "evaltime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.bigint "sercycle_id"
    t.index ["sercycle_id"], name: "index_checkups_on_sercycle_id"
    t.index ["teacher_id"], name: "index_checkups_on_teacher_id"
  end

  create_table "childimgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.bigint "childlap_id"
    t.index ["childlap_id"], name: "index_childimgs_on_childlap_id"
  end

  create_table "childlaps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_id"
    t.integer "teacherid"
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.string "leibie"
    t.bigint "sercycle_id"
    t.index ["child_id"], name: "index_childlaps_on_child_id"
    t.index ["sercycle_id"], name: "index_childlaps_on_sercycle_id"
  end

  create_table "children", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "gender"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "contact"
    t.string "conphone"
    t.date "starttime"
    t.date "endtime"
    t.bigint "xiaoqu_id"
    t.string "desc"
    t.index ["xiaoqu_id"], name: "index_children_on_xiaoqu_id"
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "code"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "commentable_id"
    t.string "commentable_type"
    t.string "title"
    t.text "body"
    t.string "subject"
    t.integer "user_id", null: false
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "equipment", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "child_id"
    t.index ["child_id"], name: "index_equipment_on_child_id"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.text "body"
    t.datetime "deadline"
    t.integer "num"
    t.bigint "post_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "xiaoqu_id"
    t.string "leixing", default: "event"
    t.index ["post_id"], name: "index_events_on_post_id"
    t.index ["user_id"], name: "index_events_on_user_id"
    t.index ["xiaoqu_id"], name: "index_events_on_xiaoqu_id"
  end

  create_table "exchanges", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "pass_id"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pass_id"], name: "index_exchanges_on_pass_id"
    t.index ["user_id"], name: "index_exchanges_on_user_id"
  end

  create_table "gradevins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "latitude"
    t.string "longitude"
    t.string "status"
  end

  create_table "gradgoods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.integer "number"
    t.string "preprice"
    t.string "currprice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "gradevin_id"
    t.bigint "category_id"
    t.index ["category_id"], name: "index_gradgoods_on_category_id"
    t.index ["gradevin_id"], name: "index_gradgoods_on_gradevin_id"
  end

  create_table "gradorders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.string "totalprice"
    t.bigint "gradevin_id"
    t.bigint "alcoholuser_id"
    t.bigint "category_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "serialnum"
    t.string "tmplog"
    t.index ["alcoholuser_id"], name: "index_gradorders_on_alcoholuser_id"
    t.index ["category_id"], name: "index_gradorders_on_category_id"
    t.index ["gradevin_id"], name: "index_gradorders_on_gradevin_id"
  end

  create_table "growthcurves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "evaltime"
    t.string "circum"
    t.string "height"
    t.string "weight"
    t.string "bmi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sercycle_id"
    t.index ["sercycle_id"], name: "index_growthcurves_on_sercycle_id"
  end

  create_table "imgcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.index ["category_id"], name: "index_imgcategories_on_category_id"
  end

  create_table "lapreports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.date "evaltime"
    t.string "finescore"
    t.string "groscore"
    t.string "socialscore"
    t.string "selfscore"
    t.string "lanscore"
    t.string "conscore"
    t.string "fineage"
    t.string "groage"
    t.string "socialage"
    t.string "selfage"
    t.string "lanage"
    t.string "conage"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.bigint "sercycle_id"
    t.index ["sercycle_id"], name: "index_lapreports_on_sercycle_id"
    t.index ["teacher_id"], name: "index_lapreports_on_teacher_id"
  end

  create_table "lapresults", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "child_id"
    t.date "evaltime"
    t.string "leibie"
    t.bigint "lap_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "result"
    t.index ["child_id"], name: "index_lapresults_on_child_id"
    t.index ["lap_id"], name: "index_lapresults_on_lap_id"
  end

  create_table "laps", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "leibie"
    t.integer "month"
    t.string "content"
    t.integer "code"
    t.text "encontent"
    t.text "guidecard"
  end

  create_table "orderitems", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "weborder_id"
    t.bigint "category_id"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_orderitems_on_category_id"
    t.index ["weborder_id"], name: "index_orderitems_on_weborder_id"
  end

  create_table "passes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "leixing"
    t.bigint "user_id"
    t.bigint "xiaoqu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.string "desc"
    t.index ["user_id"], name: "index_passes_on_user_id"
    t.index ["xiaoqu_id"], name: "index_passes_on_xiaoqu_id"
  end

  create_table "passimgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "pass_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.index ["pass_id"], name: "index_passimgs_on_pass_id"
  end

  create_table "postimgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.index ["post_id"], name: "index_postimgs_on_post_id"
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.bigint "xiaoqu_id"
    t.string "leixing"
    t.index ["user_id"], name: "index_posts_on_user_id"
    t.index ["xiaoqu_id"], name: "index_posts_on_xiaoqu_id"
  end

  create_table "quxians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "code"
    t.index ["city_id"], name: "index_quxians_on_city_id"
  end

  create_table "roles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "sercycles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "child_id"
    t.string "desc"
    t.date "dota"
    t.date "dotb"
    t.date "dotc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["child_id"], name: "index_sercycles_on_child_id"
  end

  create_table "sermen", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "phone"
    t.text "desc"
    t.boolean "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.bigint "user_id"
    t.bigint "post_id"
    t.bigint "xiaoqu_id"
    t.integer "star"
    t.string "tag"
    t.bigint "shangquan_id"
    t.string "leixing"
    t.index ["post_id"], name: "index_sermen_on_post_id"
    t.index ["shangquan_id"], name: "index_sermen_on_shangquan_id"
    t.index ["user_id"], name: "index_sermen_on_user_id"
    t.index ["xiaoqu_id"], name: "index_sermen_on_xiaoqu_id"
  end

  create_table "serverlogs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "logtext"
  end

  create_table "shangquans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "quxian_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pinyin"
    t.integer "code"
    t.index ["quxian_id"], name: "index_shangquans_on_quxian_id"
  end

  create_table "shows", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.index ["user_id"], name: "index_shows_on_user_id"
  end

  create_table "swippers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "t_sh_villages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "housetitle"
    t.string "address"
    t.string "quxian"
    t.string "shangquan"
    t.string "sqpinyin"
    t.integer "money"
    t.string "image"
    t.string "url"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
  end

  create_table "tags", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name", collation: "utf8_bin"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "teachers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "thumbsups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.bigint "serman_id"
    t.string "tag"
    t.string "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "star"
    t.index ["serman_id"], name: "index_thumbsups_on_serman_id"
    t.index ["user_id"], name: "index_thumbsups_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.string "wename"
    t.string "weno"
    t.boolean "isok"
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.string "openid"
    t.string "authentication_token"
    t.string "wkey"
    t.string "responsebody"
    t.bigint "xiaoqu_id"
    t.string "gender"
    t.index ["xiaoqu_id"], name: "index_users_on_xiaoqu_id"
  end

  create_table "votes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable_type_and_votable_id"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter_type_and_voter_id"
  end

  create_table "webgoods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "status"
    t.integer "number"
    t.string "preprice"
    t.string "currprice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_webgoods_on_category_id"
  end

  create_table "weborders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "paystatus"
    t.string "price"
    t.string "packstatus"
    t.string "packprice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "alcoaddress_id"
    t.bigint "alcoholuser_id"
    t.string "serialnum"
    t.index ["alcoaddress_id"], name: "index_weborders_on_alcoaddress_id"
    t.index ["alcoholuser_id"], name: "index_weborders_on_alcoholuser_id"
  end

  create_table "wegroups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.index ["user_id"], name: "index_wegroups_on_user_id"
  end

  create_table "weixinimgs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "weixin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "asset_file_name"
    t.string "asset_content_type"
    t.integer "asset_file_size"
    t.datetime "asset_updated_at"
    t.index ["weixin_id"], name: "index_weixinimgs_on_weixin_id"
  end

  create_table "weixins", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.string "weino"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "ispub"
    t.bigint "xiaoqu_id"
    t.string "desc"
    t.index ["user_id"], name: "index_weixins_on_user_id"
    t.index ["xiaoqu_id"], name: "index_weixins_on_xiaoqu_id"
  end

  create_table "wxsessions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "wxkey"
    t.string "openid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "authentication_token"
    t.string "asseta_file_name"
    t.string "asseta_content_type"
    t.integer "asseta_file_size"
    t.datetime "asseta_updated_at"
    t.string "assetb_file_name"
    t.string "assetb_content_type"
    t.integer "assetb_file_size"
    t.datetime "assetb_updated_at"
    t.index ["user_id"], name: "index_wxsessions_on_user_id"
  end

  create_table "xiaoqus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "shangquan_id"
    t.string "pinyin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.bigint "city_id"
    t.bigint "quxian_id"
    t.integer "code"
    t.index ["city_id"], name: "index_xiaoqus_on_city_id"
    t.index ["quxian_id"], name: "index_xiaoqus_on_quxian_id"
    t.index ["shangquan_id"], name: "index_xiaoqus_on_shangquan_id"
  end

  add_foreign_key "alcoaddresses", "alcoholusers"
  add_foreign_key "alcrecords", "alcohols"
  add_foreign_key "alcrecords", "alcoholusers"
  add_foreign_key "alcscores", "alcohols"
  add_foreign_key "applies", "events"
  add_foreign_key "applies", "users"
  add_foreign_key "categories", "alcohols"
  add_foreign_key "checkups", "sercycles"
  add_foreign_key "checkups", "teachers"
  add_foreign_key "childimgs", "childlaps"
  add_foreign_key "childlaps", "children"
  add_foreign_key "childlaps", "sercycles"
  add_foreign_key "children", "xiaoqus"
  add_foreign_key "equipment", "children"
  add_foreign_key "events", "posts"
  add_foreign_key "events", "users"
  add_foreign_key "events", "xiaoqus"
  add_foreign_key "exchanges", "passes"
  add_foreign_key "exchanges", "users"
  add_foreign_key "gradgoods", "categories"
  add_foreign_key "gradgoods", "gradevins"
  add_foreign_key "gradorders", "alcoholusers"
  add_foreign_key "gradorders", "categories"
  add_foreign_key "gradorders", "gradevins"
  add_foreign_key "growthcurves", "sercycles"
  add_foreign_key "imgcategories", "categories"
  add_foreign_key "lapreports", "sercycles"
  add_foreign_key "lapreports", "teachers"
  add_foreign_key "lapresults", "children"
  add_foreign_key "lapresults", "laps"
  add_foreign_key "orderitems", "categories"
  add_foreign_key "orderitems", "weborders"
  add_foreign_key "passes", "users"
  add_foreign_key "passes", "xiaoqus"
  add_foreign_key "passimgs", "passes"
  add_foreign_key "postimgs", "posts"
  add_foreign_key "posts", "users"
  add_foreign_key "posts", "xiaoqus"
  add_foreign_key "quxians", "cities"
  add_foreign_key "sercycles", "children"
  add_foreign_key "sermen", "posts"
  add_foreign_key "sermen", "shangquans"
  add_foreign_key "sermen", "users"
  add_foreign_key "sermen", "xiaoqus"
  add_foreign_key "shangquans", "quxians"
  add_foreign_key "shows", "users"
  add_foreign_key "thumbsups", "sermen"
  add_foreign_key "thumbsups", "users"
  add_foreign_key "users", "xiaoqus"
  add_foreign_key "webgoods", "categories"
  add_foreign_key "weborders", "alcoaddresses"
  add_foreign_key "weborders", "alcoholusers"
  add_foreign_key "wegroups", "users"
  add_foreign_key "weixinimgs", "weixins"
  add_foreign_key "weixins", "users"
  add_foreign_key "weixins", "xiaoqus"
  add_foreign_key "wxsessions", "users"
  add_foreign_key "xiaoqus", "cities"
  add_foreign_key "xiaoqus", "quxians"
  add_foreign_key "xiaoqus", "shangquans"
end
