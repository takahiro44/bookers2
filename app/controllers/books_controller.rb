class BooksController < ApplicationController
  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @new_book = Book.new
    @books = Book.all
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
