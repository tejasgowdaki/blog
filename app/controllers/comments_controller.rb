class CommentsController < ApplicationController

	def create
		@comment = Comment.new(comment_param)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_to article_path(@comment.article_id)
		else
			render action: "new"
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to article_path(@comment.article_id)
	end


	private

	def comment_param
		params[:comment].permit(:body, :article_id)
	end

end
