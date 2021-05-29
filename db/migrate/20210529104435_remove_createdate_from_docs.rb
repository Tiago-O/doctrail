class RemoveCreatedateFromDocs < ActiveRecord::Migration[6.0]
  def change
    remove_column :docs, :create_date, :integer
    remove_column :docs, :update_date, :integer
  end
end
