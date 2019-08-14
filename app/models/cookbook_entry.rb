class CookbookEntry < ApplicationRecord
  belongs_to :book
  belongs_to :recipe

  after_create :update_cookbook_pdf
  after_destroy :update_cookbook_pdf

  after_create :update_cover_pdf
  after_destroy :update_cover_pdf

  def update_cookbook_pdf
    book.make_pdf
  end
  
  def update_cover_pdf
    book.cover_pdf
  end 

end
