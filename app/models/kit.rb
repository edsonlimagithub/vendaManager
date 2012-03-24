class Kit < ActiveRecord::Base
  has_many :item_kit, :dependent => :destroy
end
