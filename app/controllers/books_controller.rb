class BooksController < ApplicationController
  def index
  	@books = Book.all
    @post = Book.new
    @side = current_user.id
  end

  def new
  	@book = Book.new
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	@book.save
  	redirect_to books_path(@book)
  end

  def show
    @book = Book.find(params[:id])
    @post = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def edit
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end