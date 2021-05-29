class CreateVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :versions do |t|
      t.text :text
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
