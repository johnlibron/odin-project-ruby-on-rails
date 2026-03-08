class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :post_authorings, foreign_key: :post_author_id
  has_many :authored_posts, through: :post_authorings
  has_many :edited_posts, foreign_key: :editor_id, class_name: "Post"

  has_many :shipping_addresses
  accepts_nested_attributes_for :shipping_addresses

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  # Option 1: Purely overriding the #as_json method
  def as_json(_options = {})
    { name: self.name }  # NOT including the email field
  end

  # Option 2: Working with the default #as_json method
  def as_json(options = {})
    super({ only: [ :name ] }.merge(options))
  end
end
