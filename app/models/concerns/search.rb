module Search
  extend ActiveSupport::Concern

  included do
    scope :search, -> (term) { where("name ILIKE ?", "%#{term}%") }
  end
  def as_json(options={})
      {
        id:           id,
        name:         name,
      }
    end
end
