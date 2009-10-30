class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table "users" do |t|
      t.string    :login,                          :limit => 20
      t.string    :email,                          :limit => 50
      t.string    :crypted_password,               :limit => 40
      t.string    :salt,                           :limit => 40
      t.datetime  :created_at
      t.datetime  :updated_at
      t.string    :remember_token
      t.datetime  :remember_token_expires_at

      t.boolean   :admin,                           :default=>false
      t.datetime  :lastlogin_at,                    :default=>Time.now
    end
    add_index :users, [:login]

    # 增加一个超级用户
    User.create(:login=>'administrator',
                :password=>'qxh771003yxd750818',
                :password_confirmation=>'qxh771003yxd750818',
                :email=>'admin.popmao@gmail.com')
    # 不知为什么，boolean的初始值没有办法设置，
    # 只好这里更新
    User.update_all [ "admin = ?", true ]
  end

  def self.down
    drop_table "users"
  end
end
