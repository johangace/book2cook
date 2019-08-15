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
      page_size: [666, 891.36],
      page_layout: :landscape
    ) do |pdf|
      pdf.image StringIO.open(image.download), width: 560, at: [0, 560], align: :center
      pdf.move_down 250
      pdf.font "Times-Roman", style: :bold
      pdf.font_size(40) { pdf.text book.name, align: :center }
      pdf.move_down 10
      pdf.font "Helvetica", style: :italic
      pdf.font_size(20) { pdf.text book.subtitle, align: :center}
    end
    self.pdf.attach(io: File.open(Rails.root.join('tmp', "cover#{id}.pdf")), filename: 'cover.pdf')
  end
end
