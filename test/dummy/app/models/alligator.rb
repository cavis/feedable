class Alligator < ActiveRecord::Base
  attr_accessible :name
  feedable :created_at
end
