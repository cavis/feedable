class Post < ActiveRecord::Base
  attr_accessible :desc, :title
  feedable :created_at
end
