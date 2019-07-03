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

  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
