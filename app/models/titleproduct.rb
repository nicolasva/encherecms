class Titleproduct < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :product_id

  has_one :contents, :as => :contains, :dependent => :destroy
end
