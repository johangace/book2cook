class Cover < ApplicationRecord
  belongs_to :book

  has_one_attached :image
  has_one_attached :pdf

  def cover_url(size="200x200")
    if image.attached?
      image.variant(resize: size)
    else
      '/images/frame1.jpeg'
    end
  end

  def cover_pdf
    Prawn::Document.generate(
    "tmp/cover#{id}.pdf",
      page_size: [891.36, 666],
      page_layout: :portrait
    ) do |pdf|
      pdf.image StringIO.open(image.download), width: 420, height: 620, at:[-20, 620 ], fit: [450, 666], vposition: :center
      pdf.move_down 250
      pdf.font "Times-Roman", style: :bold
      pdf.font_size(35) {pdf.text_box book.name, at: [110, 330], align: :left}
      pdf.move_down 10
      pdf.font "Helvetica", style: :italic
      pdf.font_size(20) {  pdf.text_box book.subtitle, at: [110, 300], align: :left}

      pdf.font "Helvetica", style: :italic
      pdf.font_size(12) {  pdf.text_box book.footer, at: [500, 600], align: :left}
      pdf.text "end", at: [770, 20]
    end
    self.pdf.attach(io: File.open(Rails.root.join('tmp', "cover#{id}.pdf")), filename: 'cover.pdf')
  end
end
