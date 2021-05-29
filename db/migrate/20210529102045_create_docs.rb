class CreateDocs < ActiveRecord::Migration[6.0]
  def change
    create_table :docs do |t|
      t.string :title
      t.text :text
      t.integer :create_date
      t.integer :update_date
      t.boolean :locked, default: false
      t.boolean :final, default: false

      t.timestamps
    end
  end
end
