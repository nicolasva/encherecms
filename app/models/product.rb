class Product < ActiveRecord::Base
  belongs_to :categoryall

  validates_presence_of :categoryall_id
end
