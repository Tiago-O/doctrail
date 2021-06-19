class AddHappyToUserdocs < ActiveRecord::Migration[6.0]
  def change
    add_column :userdocs, :happy, :boolean, default: false, null: false
  end
end
