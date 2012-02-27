class Categoryall < ActiveRecord::Base
  CHOISE_CATEGORY = {"Products" => 0, "Content" => 1, "Link_redirection" => 2}
  belongs_to :panel
  has_many :products, :dependent => :destroy
  
  has_many :contents, :as => :contains, :dependent => :destroy

  accepts_nested_attributes_for :panel, :products, :contents

  validates_presence_of :name 
  validates_presence_of :panel_id
end
