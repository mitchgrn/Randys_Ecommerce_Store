class Province < ActiveRecord::Base
  attr_accessible :code, :gst, :home_province, :hst, :name, :pst
  has_many :customers
end
