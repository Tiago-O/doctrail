class Version < ApplicationRecord
  belongs_to :doc
  has_many :comments
  belongs_to :user

  validates :text, presence: true
end
