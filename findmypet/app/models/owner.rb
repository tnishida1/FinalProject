class Owner < ActiveRecord::Base

  has_one :user
  has_many :pets, dependent: :destroy
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :pets, :posts

  def name
    first + ' ' + last
  end

end
