class Book < ApplicationRecord
  has_many :cookbook_entries
  has_many :recipes, through: :cookbook_entries

  validates :name, presence: true

  require "open-uri"
  include Rails.application.routes.url_helpers

  after_create :make_pdf

  def make_pdf
    # SEE http://prawnpdf.org/manual.pdf
    Prawn::Document.generate(
      "cookbook.pdf",
      page_size: [450, 666],
      page_layout: :portrait
    ) do |pdf|
      # replace this with the actual book's recipes once you have a UI to add recipes to a book
      pdf.text name
      pdf.text "THIS IS THE FIRST PAGE"
      pdf.text "PUT SOMETHING COOL HERE"
      pdf.start_new_page
      Recipe.all.each do |recipe|
        pdf.text recipe.name
        pdf.text "BY: #{recipe.user.email}"
        pdf.move_down 10
        pdf.text "Ingredients:"
        pdf.text recipe.ingredients
        pdf.move_down 10
        pdf.text "Instructions:"
        pdf.text recipe.instructions
        pdf.start_new_page
        image_file = open(url_for(recipe.image))
        pdf.image image_file.path, width: 300
        pdf.start_new_page
      end
      pdf.text "THIS IS THE LAST PAGE"
      pdf.text "PUT SOMETHING SPECIAL HERE"
    end
  end
end
