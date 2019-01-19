class PostsController < ApplicationController
   before_action :set_post,only: [:destroy, :update]
   before_action :correct_user?,only: [:edit]

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
          ConfirmMailer.confirm_mail(@post).deliver
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
      @post = current_user.posts.build(post_params)
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
    
    def show
      @favorite = current_user.favorites.find_by(post_id: @post.id)
    end
    
    private
    
    def post_params
      params.require(:post).permit(:content, :image,:image_cache)
    end
    
    def set_post
      @post = Post.find(params[:id])
    end
    
    def correct_user?
      @selected_post = Post.find(params[:id])
      @user = User.find_by(id: @selected_post.user_id)
      unless @user == current_user
        flash[:danger] = "アクセスする権限がありません。正しいユーザーでログインしてください"
        redirect_to root_url
      end
    end
end
