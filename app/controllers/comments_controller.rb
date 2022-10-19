class CommentsController < ApplicationController
  def new
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new
  end

  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @my_thread.comments.create!(comment_params)
    redirect_to root_path
    # if @comment.save
    #   format.html { redirect_to my_thread_url(@my_thread), notice: "My thread was successfully created." }
    #   format.json { render :show, status: :created, location: @my_thread }
    # else
    #   format.html { render :new, status: :unprocessable_entity }
    #   format.json { render json: @comment.errors, status: :unprocessable_entity }
    # end
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
