class Note < ApplicationRecord
  belongs_to :user
  before_save :default_values

  private
  def default_values
    self.is_completed = :false
  end
end
