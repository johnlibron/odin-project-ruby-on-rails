  # in app/controllers/posts_controller.rb
  class PostsController < ApplicationController
    before_action :set_post, only: %i[ show edit update destroy ]

    def index
      # code to grab all posts so they can be
      # displayed in the Index view (index.html.erb)
      if params[:important] == true
        @posts = Post.important.all
      else
        @posts = Post.all
      end
    end

    def show
      # code to grab the proper Post so it can be
      # displayed in the Show view (show.html.erb)
      # @user = User.find(params[:id])
      # if @user.is_male?
      #   render "show-boy"
      # end
      # render "show-girl"
    end

    # Make (but don't save) an empty Post so the form we render
    # knows which fields to use and where to submit the form
    # This action will render app/views/posts/new.html.erb once
    # it's done
    def new
      # code to create an empty post and send the user
      # to the New view for it (new.html.erb), which will have a
      # form for creating the post
      @user_options = User.all.map { |u| [ u.name, u.id ] }
      @user = User.new
      @post = Post.new
    end

    # We know this will get run once we receive the submitted
    # form from our NEW action above (remember your REST actions??)
    # We'll just use pseudo-code for now to illustrate the point
    def create
      @post = Post.new(post_params)
      # code here to set up a new @post based on form info
      p "creating post with params: #{params[:post].inspect}"
      if @post.save
        flash[:success] = "Great! Your post has been created!"
        redirect_to @post # go to show page for @post
      else
        flash.now[:error] = "Rats! Fix your mistakes, please."
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      # code to find the post we want and send the
      # user to the Edit view for it (edit.html.erb), which has a
      # form for editing the post
    end

    def update
      # code to figure out which post we're trying to update, then
      # actually update the attributes of that post. Once that's
      # done, redirect us to somewhere like the Show page for that
      # post
    end

    def destroy
      # code to find the post we're referring to and
      # destroy it.  Once that's done, redirect us to somewhere fun.
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.expect(post: [ :title, :body, :author_id ])
    end
  end
