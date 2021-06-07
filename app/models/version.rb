class Version < ApplicationRecord
  has_rich_text :rich_body

  belongs_to :doc
  has_many :comments
  belongs_to :user

  validates :rich_body, presence: true
end
