class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create
         post = Post.new(post_params)
         if post.save
         	flash[:notice] = "Book was successfully created."
         redirect_to post_path(post.id)
     else
     	render action: :new
     end
  end

  def update
      @post = Post.find(params[:id])
      @post.update(post_params)
      redirect_to @post
end

  def index
      @posts = Post.all
      @post = Post.new
  end

  def show
        @post = Post.find(params[:id])
  end

  def edit
        @post = Post.find(params[:id])
  end

  def update
        post = Post.find(params[:id])
        if post.update(post_params)
        	flash[:notice] = "Book was successfully updated."
        redirect_to post_path(post.id)
    else
    	render action: :new
    end
  end

  def destroy
        post = Post.find(params[:id])
        if post.destroy
        	flash[:notice] = "Book was successfully destroyed."
        redirect_to posts_path
    else
    	render action: :new
    end
  end



  private

    def post_params
        params.require(:post).permit(:title, :body)
    end
end
