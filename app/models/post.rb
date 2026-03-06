class Post < ApplicationRecord
  belongs_to :user
  has_many :post_authorings, foreign_key: :authored_post_id
  has_many :authors, through: :post_authorings, source: :post_author
  belongs_to :editor, class_name: "User"
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :body, presence: true

  scope :important, -> { where(is_important: true) }
end
