class ManagedRecord < ApplicationRecord
  self.abstract_class = true

  connects_to database: { writing: :managed }
end
