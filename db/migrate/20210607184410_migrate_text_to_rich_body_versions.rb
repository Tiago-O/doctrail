class MigrateTextToRichBodyVersions < ActiveRecord::Migration[6.0]
  def up
    Version.find_each do |version|
      version.update(rich_body: version.text)
    end
  end

  def down
    Version.find_each do |version|
      version.update(text: version.rich_body)
      version.update(rich_body: nil)
    end
  end
end
