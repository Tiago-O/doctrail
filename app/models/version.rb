class Version < ApplicationRecord
  belongs_to :docs
  has_many :comments
  has_many :users, through: :docs

  validates :text, presence: true
end
