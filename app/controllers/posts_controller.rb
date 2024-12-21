class PostsController < ApplicationController
    before_action :authenticate_user, except: [:index, :show]
    before_action :set_post, only: [:show, :update, :destroy]
    before_action :authorize_user, only: [:update, :destroy]
  
    # POST /posts
    def create
      post = current_user.posts.new(post_params)
      if post.save
        render json: post, status: :created
      else
        render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # GET /posts
    def index
      if params[:search].present?
        posts = Post.where('title LIKE ? OR content LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").paginate(page: params[:page], per_page: 10)
      else
        posts = Post.paginate(page: params[:page], per_page: 10)
      end
      render json: posts
    end
  
    # GET /posts/:id
    def show
      @post = Post.find(params[:id])
      render json: @post
    end
  
    # PATCH /posts/:id
    def update
      if @post.update(post_params)
        render json: @post
      else
        render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    # DELETE /posts/:id
    def destroy
      @post.destroy
      render json: { message: 'Post deleted successfully' }
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content)
    end
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def authorize_user
      render json: { error: 'Unauthorized' }, status: :unauthorized unless @post.user == current_user
    end
  end
  