class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_book

  def current_book
    current_user.books.find(session[:book_id]) if session[:book_id].present?
  end
end
