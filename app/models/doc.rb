class Doc < ApplicationRecord
  has_many :userdocs
  has_many :versions

  validates :title, presence: { message: "Title must be given please" }, length: { in: 3..50 }
  validates :text, presence: true

  accepts_nested_attributes_for :userdocs
end
