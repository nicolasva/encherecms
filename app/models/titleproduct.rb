class Titleproduct < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :product_id
  belongs_to :product
  has_one :contents, :as => :contains, :dependent => :destroy
end
