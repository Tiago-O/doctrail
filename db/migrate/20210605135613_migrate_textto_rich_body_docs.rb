class MigrateTexttoRichBodyDocs < ActiveRecord::Migration[6.0]
  def up
      Doc.find_each do |doc|
        doc.update(rich_body: doc.text)
      end
    end

    def down
      Doc.find_each do |doc|
        doc.update(text: doc.rich_body)
        doc.update(rich_body: nil)
      end
    end
end
