class CommentsController < ApplicationController
  def show 
    @comment = Comment.find(params[:my_thread_id])
  end 
  def new
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new
  end

  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    comment = @my_thread.comments.new(comment_params)
    if comment.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update!(comment_params)
    redirect_to root_path
  end 
  # def update
  #   @my_thread = MyThread.find(params[:my_thread_id])
  #   @comment = @my_thread.comments.find(params[:id])
  #   @comment.update(update_params)
  #   redirect_to root_path
  #   # if @comment.update(comment_params)
  #   #   flash[:success] = "Comment updated"
  #   #   redirect_to root_path
  #   # else
  #   #   flash[:danger] = "Comment failed"
  #   #   render 'edit'
  #   # end
  # end 

  def destroy
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    @comment.destroy
    redirect_to root_path
  end
  private
  def comment_params
    params.require(:comment).permit(:text)
  end
end
