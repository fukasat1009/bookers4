class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@books = Book.all
    @post = Book.new
 
  end

  def new
  	@book = Book.new
  end

  def create
    @books =Book.all
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
      flash[:notice] = "successfully"
  	redirect_to books_path(@book)
   else
    @post = @book
    render :index
   end
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
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path, alert:'不正なアクセスです'
    end
  end

  def update
    @book = Book.find(params[:id])
     if @book.update(book_params)
      flash[:notice] = "successfully"
    redirect_to book_path(@book)
   else
    render :edit
   end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
