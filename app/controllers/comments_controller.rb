class CommentsController < ApplicationController
	def create
		@comment_hash = params[:comment]
		@obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])

		@comment = Comment.build_from(@obj, current_writer.id, @comment_hash[:body])
	    if @comment.save
	      	render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
	    else
			render :js => "alert('error saving comment');"
	    end
	    
	end
	
	def show
	end

	def destroy
		@comment = Comment.find(params[:id])
		if @comment.destroy
			render :json => @comment, :status => :ok
		else
			render :js => "alert('error deleting comment');"
		end
	end
	 # acts_as_votable functions
	def upvote
		if !signed_in?  
		  redirect_to new_writer_session_path
		else 
		  @comment = Comment.find(params[:id])
		  @comment.upvote_by current_writer
		  redirect_to :back
		end
	end  

	 def downvote
		if !signed_in?  
		  redirect_to new_writer_session_path
		else 
		  @comment = Comment.find(params[:id])
		  @comment.downvote_by current_writer
		  redirect_to :back
		end
	end
	private

	def comment_params
		params.require(:comment).permit(:body, :commentable_id, :commentable_type, :comment_id)
	end


end
