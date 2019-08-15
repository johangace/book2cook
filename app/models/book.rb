class Book < ApplicationRecord
  belongs_to :user
  has_many :cookbook_entries
  has_many :recipes, through: :cookbook_entries

  has_one_attached :interior_pdf

  validates :name, :subtitle, :dedication, :footer ,presence: true
 

  after_save :make_pdf, if: :changed?

  def make_pdf
    Prawn::Document.generate(
      "tmp/cookbook#{id}.pdf",
      page_size: [450, 666],
      page_layout: :portrait
    ) do |pdf|
      # pdf.image Rails.root.join("public", "background.png"), width: 300, at: [0,666]

      pdf.move_down 200
      pdf.font "Helvetica", style: :italic
      pdf.font_size(17) { pdf.text dedication, align: :center}
      pdf.start_new_page
       recipes.each do |recipe|
        pdf.move_down 55
        pdf.stroke_horizontal_rule
        pdf.pad_top(12) { pdf.font_size(20) { pdf.text recipe.name.upcase, style: :normal, align: :center} }
        pdf.stroke_horizontal_rule
        pdf.move_down (27)
        pdf.font_size(10) { pdf.text "Recipe by: #{recipe.user.email}", style: :italic }
        pdf.move_down (20)
        pdf.font_size(15) { pdf.text_box "Ingredients:", at: [0, 430], style: :normal }
        pdf.font_size(11)
        pdf.text_box recipe.ingredients, at: [0, 410], height: 100, width: 120, style: :normal
        pdf.font_size(15) { pdf.text_box "Instructions:", at: [165, 430],  style: :normal
          pdf.font_size(11) { pdf.text_box recipe.instructions, at: [165, 410], width: 200, style: :normal }
        }
        pdf.start_new_page
        pdf.image StringIO.open(recipe.image.download), fit: [377, 460], position: :center, vposition: :center
        pdf.start_new_page
        pdf.start_new_page
        pdf.move_down 200
      pdf.font "Helvetica", style: :italic
      pdf.font_size(17) { pdf.text footer, align: :center}
    
      
      end
      # Green page numbers 1 to 7
      options = {
        align: :center,
        page_filter: lambda{ |pg| pg > 1},
        start_count_at: 2,
        at: [ 0, 5]
      }
      pdf.number_pages " <page> ", options
    end
    self.interior_pdf.attach(io: File.open(Rails.root.join('tmp', "cookbook#{id}.pdf")), filename: 'interior.pdf')
  end
end
