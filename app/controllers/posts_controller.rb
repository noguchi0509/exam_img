class PostsController < ApplicationController
   before_action :set_post,only: [:destroy, :update]

    def index
      @posts = Post.all
    end
    
    def new
      if params[:back] 
        @post = Post.new(post_params)
      else
        @post = Post.new
      end
    end
    
    def confirm
      @post = current_user.posts.build(post_params)
      if @post.invalid?
          render 'new'
      end
    end
    
    def create
      @post = Post.new(post_params)
      @post.user_id = current_user.id
      if @post.save
          redirect_to posts_path, notice:"投稿しました"
      else
          render 'confirm'
      end
    end
    
   def edit
     if params[:back]
       @post = Post.new(post_params)
       @post.image = params[:image_cache]
     else
       @post = Post.find(params[:id])
     end
   end
   
   def edit_confirm
      @post = Post.new(post_params)
      if @post.invalid?
          render 'new'
      end
    end
   
   def update
    if @post.update(post_params)
      redirect_to posts_path, notice:"編集しました！"
    else
      render 'edit'
    end
   end
    
   def destroy
    @post.destroy
    redirect_to posts_path, notice:"削除しました"
   end
    
    private
    
    def post_params
      params.require(:post).permit(:content, :image,:image_cache)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
end
