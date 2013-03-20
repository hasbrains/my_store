class BlogPost < ActiveRecord::Base
  attr_accessible :title, :body
  has_many :comments, as: :commentable
end
