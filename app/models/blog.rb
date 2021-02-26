class Blog < ApplicationRecord
    belongs_to :author

    def author_attributes=(author_name)
        self.author = Author.find_or_create_by(name: author_name)
    end
end
