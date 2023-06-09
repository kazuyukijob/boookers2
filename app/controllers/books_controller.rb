class BooksController < ApplicationController
    def index
        @book = Book.new
        @books = Book.all
        @book_comment = BookComment.new
    end

    def show
        @books = Book.all
        @book = Book.find(params[:id])
        @book_new = Book.new
        @book_comment = BookComment.new
    end

    def edit
        @book = Book.find(params[:id])
        if current_user.id == @book.user.id
        else
            redirect_to books_path
        end

    end

    def create
        @books = Book.all
        @book = Book.new(book_params)
        @book.user_id=current_user.id
        if @book.save
        flash[:notice] = "successfully"
            redirect_to book_path(@book)
        else
            render :index
        end
    end

      def destroy
         book = Book.find(params[:id])
         book.destroy
         redirect_to '/books'
      end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)
        else
        render :edit
        end
    end

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end

