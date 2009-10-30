# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091027060336) do

  create_table "forums", :force => true do |t|
    t.string   "name",        :limit => 50
    t.integer  "position",                  :default => 0
    t.string   "all_keys"
    t.string   "description"
    t.integer  "parent_id",                 :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "user_id",    :default => 0
    t.integer  "post_id",    :default => 0
    t.integer  "topic_id",   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "forum_id",                 :default => 0
    t.integer  "topic_id",                 :default => 0
    t.integer  "user_id",                  :default => 0
    t.string   "subject",    :limit => 60
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_tags", :force => true do |t|
    t.string   "name"
    t.integer  "account"
    t.integer  "forum_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.integer  "forum_id",                  :default => 0
    t.integer  "user_id",                   :default => 0
    t.string   "subject",     :limit => 60
    t.text     "content"
    t.datetime "postdate_at",               :default => '2009-10-01 07:55:15'
    t.datetime "lastpost_at",               :default => '2009-10-01 07:55:15'
    t.string   "last_poster", :limit => 20
    t.integer  "hits",                      :default => 0
    t.integer  "replies",                   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tag"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 20
    t.string   "email",                     :limit => 50
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "admin",                                   :default => false
    t.datetime "lastlogin_at",                            :default => '2009-10-01 07:55:15'
    t.integer  "gold",                                    :default => 10
    t.integer  "prestige",                                :default => 0
    t.datetime "last_login_at",                           :default => '2009-10-19 16:53:42'
    t.integer  "photo_id",                                :default => 0
  end

  add_index "users", ["login"], :name => "index_users_on_login"

end
