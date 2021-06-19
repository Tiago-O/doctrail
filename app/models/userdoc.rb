class Userdoc < ApplicationRecord
  belongs_to :doc
  belongs_to :user

  validates :owner, inclusion: [true, false]

  def self.zero_happy?(userdocs, doc)
    return false if userdocs.empty? || doc.nil?

    userdocs.where(happy: false).count.zero? # they are all happy
    doc.update(final: true)
  end
end
