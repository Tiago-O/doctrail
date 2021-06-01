class RemoveOwnerFromUserdocs < ActiveRecord::Migration[6.0]
  def change
    remove_column :userdocs, :owner, :boolean
  end
end
