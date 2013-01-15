class Cart < ActiveRecord::Base

  has_many   :positions
  belongs_to :user
  has_many   :items, through: :positions

end
