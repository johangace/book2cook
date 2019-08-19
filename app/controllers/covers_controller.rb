class CoversController < ApplicationController
  include Rails.application.routes.url_helpers
  before_action :set_book

  def update
    @book.cover.update(cover_params)
    redirect_to edit_book_path(@book)
  end

  def show
    redirect_to url_for(@book.cover.pdf)
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def cover_params
    params.require(:cover).permit(:image)
  end

end



