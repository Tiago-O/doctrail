class CreateRepos < ActiveRecord::Migration[6.0]
  def change
    create_table :repos do |t|
      t.boolean :owner, default: false

      t.timestamps
    end
  end
end
