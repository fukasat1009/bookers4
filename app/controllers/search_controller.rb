class SearchController < ApplicationController
  def search
  	@how_search = params[:choice]
  	@user_or_book = params[:option]
    if @user_or_book == "1"
      @users = User.search(params[:search], @user_or_book,@how_search)
    else
      @books = Book.search(params[:search], @user_or_book,@how_search)
  end
end

end
