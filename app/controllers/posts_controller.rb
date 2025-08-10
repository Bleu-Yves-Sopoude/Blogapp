class PostsController < ApplicationController
    before_action :set_post, only: [ :show, :update, :edit, :delete ]
    before_action :authenticate_user!


    def index
        @posts =Post.all
    end

    def new
        @post = Post.new()
    end

    def create
        @post =current_user.posts.build(post_params)
        if @post.save
            redirect_to @post, notice: "Post was succesfully created"
        else
            render :new
        end
    end

    def show
    end

    def edit
    end


    def update
        if @post.update(post_params)
            redirect_to @post, notice: "Post was succesfully updated"
        else
            render :edit
        end
    end


    def delete
        @post.destroy
        redirect_to posts_url, notice: "Post was succesfully deleted"
    end

    private

    def post_params
        params.require(:post).permit(:title, :description)
    end

    def set_post
        @post =Post.find(params[:id])
    end
end
