class Content < ActiveRecord::Base
  belongs_to :contains, :polymorphic => true
  validates_presence_of :content_text

  def self.bordersize_value
    tab_border_size = Array.new
    10.times do |i|
      tab_border_size.push(i+1) 
    end
    tab_border_size
  end
end
