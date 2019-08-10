class BooksController < ApplicationController
  


  def create
  	book = Book.new(book_params)#ローカル変数：変数の受け取りのみ インスタンス変数：変数の（ビューファイルの受け渡し）
  	if book.save
      flash[:notice] = "Book was successfully created"
  	  redirect_to book_path(book.id)#投稿詳細画面へリダイレクト
    else
      redirect_to books_path(book.id)
    end
  end


  def index
    @book = Book.new
  	@books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "Book was successfully updated"
      redirect_to book_path(book.id)
    else
      redirect_to books_path(book.id)
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def create_introduction
    @user = User.new(user_params)
    @user.save
    redirect_to books_path
  end
  def edit_introduction
    @user = User.find_by(id: params[:id])
  end

  def update_introduction
    @user=User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to books_path(@user.id)
    else
      render :new
    end
  end

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
