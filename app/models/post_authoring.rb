  # app/models/post_authoring.rb
  class PostAuthoring < ActiveRecord::Base
    belongs_to :post_author, class_name: "User"
    belongs_to :authored_post, class_name: "Post"
  end
