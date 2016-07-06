class Pet < ActiveRecord::Base

  require 'securerandom'
  def generate_filename
    self.filename = SecureRandom.hex(10)
  end

  belongs_to :post
  belongs_to :owner

end
