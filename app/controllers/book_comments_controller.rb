class BookCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(book_comment_params)
    comment.user_id = current_user.id
    comment.save
      # render 'error'
    # end
    # redirect_back fallback_location: @book
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = @book.book_comments.find(params[:id])
    comment.destroy
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
