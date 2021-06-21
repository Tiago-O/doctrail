class Doc < ApplicationRecord
  include PgSearch::Model

  has_rich_text :rich_body

  has_many :userdocs
  has_many :versions

  validates :title, presence: { message: "Title must be given please" }, length: { in: 3..50 }
  validates :rich_body, presence: true

  accepts_nested_attributes_for :userdocs
  # validates :locked, presence: true
  # validates :final, presence: true

  def doc_uninvited_users
    all_users = User.all
    docs = Userdoc.where(doc: self)
    invited_users = docs.map do |doc|
      doc.user
    end
    all_users - invited_users
  end

  pg_search_scope :search_by_title,
    against: :title,
    using: {
      tsearch: { prefix: true }
    }
end
