class AddGoldPrestigeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :gold,         :integer,     :default=>10  # 注册就有10个金币
    add_column :users, :prestige,     :integer,     :default=>0   # 威望
  end

  def self.down
    remove_column :users, :Prestige
    remove_column :users, :Gold
  end
end
