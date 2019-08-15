module Search
  extend ActiveSupport::Concern

  included do
    scope :search, -> (term) { where("name ILIKE ?", "%#{term}%") }
  end

  def as_json(options={})
    {
      id:           id,
      name:         name,
      class:        self.class.name,
      location:     if self.class.name == "Profile"
                      "/users/#{self.user_id}/recipes"
                    elsif self.class.name == "Recipe"
                      "/recipes/#{id}"
                    end
    }
  end
end
