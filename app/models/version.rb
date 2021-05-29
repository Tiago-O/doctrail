class Version < ApplicationRecord
  belongs_to :docs
  has_many :comments

  validates :text, presence: true
end
