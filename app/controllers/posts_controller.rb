class PostsController < ApplicationController

	before_action :authenticate_user!, :only => [:create, :destroy]

	def index
		@posts = Post.order("id DESC").limit(20)

		if params[:max_id]
			@posts = @posts.where( "id < ?", params[:max_id])
		end

		respond_to do |format|
			format.html
			format.js
		end
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		@post.save
	end

	def destroy
		@post = current_user.posts.find(params[:id])
		@post.destroy
		render :json => { :id => @post.id }
	end

	def like
		@post = Post.find(params[:id])
		unless @post.find_like(current_user)
			Like.create( :user => current_user, :post => @post)
		end
	end

	def unlike
		@post = Post.find(params[:id])
		like = @post.find_like(current_user)
		like.destroy
		render "like"
	end


	protected

	def post_params

		params.require(:post).permit(:content)

	end
end
