class AddOwnerToUserdocs < ActiveRecord::Migration[6.0]
  def change
    add_column :userdocs, :owner, :boolean
  end
end
