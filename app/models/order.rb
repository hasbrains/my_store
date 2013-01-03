class Order < ActiveRecord::Base

  attr_accessible :user, :user_id

  belongs_to :user

end
