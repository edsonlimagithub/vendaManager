class Usuario < ActiveRecord::Base
  validates :empresa, :presence => true
end
