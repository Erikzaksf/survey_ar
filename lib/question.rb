class Question < ActiveRecord::Base
  #validates(:description, :presence => true) below method takes care of this
  validates(:description, {:presence => true, :length => {:maximum => 50}})

end
