class Rooster < ActiveRecord::Base
  attr_accessible :awesomeness, :kind
  feedable :created_at
end
