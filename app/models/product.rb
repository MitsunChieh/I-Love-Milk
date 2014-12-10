class Product < ActiveRecord::Base

  validates_presence_of :name

  has_many :order_items
  has_many :cart_items

  has_attached_file :logo_url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :logo_url, :content_type => /\Aimage\/.*\Z/
end
