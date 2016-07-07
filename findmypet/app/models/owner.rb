class Owner < ActiveRecord::Base

  belongs_to :user
  has_many :pets, dependent: :destroy
  has_many :posts, dependent: :destroy
  accepts_nested_attributes_for :pets

  def name
    first + ' ' + last
  end

end
