class LikesController < ApplicationController
    before_action :authenticate_user
  
    # POST /posts/:post_id/likes
    def create
      post = Post.find(params[:post_id])
      like = post.likes.new(user: current_user)
      if like.save
        render json: like, status: :created
      else
        render json: { error: 'Already liked' }, status: :unprocessable_entity
      end
    end
  
    # DELETE /posts/:post_id/likes/:id
    def destroy
      post = Post.find(params[:post_id])
      like = post.likes.find_by(user: current_user)
      if like
        like.destroy
        render json: { message: 'Like removed' }
      else
        render json: { error: 'Like not found' }, status: :not_found
      end
    end
  end
  