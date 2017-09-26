class Survery < ActiveRecord::Base
  has_many(:questions)
end
