class Panel < ActiveRecord::Base
  CATEGORYALL_OR_CONTENT = {"Category" => 1, "Content" => 2, "Link_redirection" => 3}
  has_many :contents, :as => :contains, :dependent => :destroy 
  has_many :categoryalls, :dependent => :destroy
  accepts_nested_attributes_for :contents, :categoryalls

  def self.position(index,id)
    update_all(['position=?', index], ['id=?', id])
  end
end
