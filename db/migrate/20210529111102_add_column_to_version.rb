class AddColumnToVersion < ActiveRecord::Migration[6.0]
  def change
    add_reference :versions, :doc, null: false, foreign_key: true
    add_reference :versions, :user, null: false, foreign_key: true
  end
end
