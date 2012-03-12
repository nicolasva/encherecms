class Product < ActiveRecord::Base
  has_attached_file :imgproduct, :styles => { :thumb => ["100x100#"], :original => ["500x500#"] },
  :url => "/images/products/:id/:basename.:extension",
  :path => ":rails_root/app/assets/images/products/:id/:basename.:extension"
  belongs_to :categoryall
  has_many :titleproducts

  accepts_nested_attributes_for :categoryall

  validates_presence_of :categoryall_id
end
