class Owner < ActiveRecord::Base

  has_one :user
  has_many :pets, dependent: :destroy
  accepts_nested_attributes_for :pets

  def name
    first + ' ' + last
  end

end
