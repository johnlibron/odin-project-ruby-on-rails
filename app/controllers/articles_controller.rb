  # in app/controllers/articles_controller.rb
  class ArticlesController < ApplicationController
    def create
      article = Article.create(status: :draft)
    end
  end
