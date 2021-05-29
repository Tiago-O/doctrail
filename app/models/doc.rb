class Doc < ApplicationRecord
  belongs_to :repo
  has_many :versions
end
