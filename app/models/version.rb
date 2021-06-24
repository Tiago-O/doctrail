class Version < ApplicationRecord
  has_rich_text :rich_body

  belongs_to :doc
  has_many :comments
  belongs_to :user

  validates :rich_body, presence: true

  # def previous_version(doc)
  #   index = doc.versions.index(self)
  #   doc.versions[index - 1]
  # end

  def previous_version
    self.doc.versions.where('created_at < ? AND accepted = ?', self.created_at, true).order(created_at: :desc).limit(1).first
  end

end
