class Post < ActiveRecord::Base

    has_one :pet
    belongs_to :owner
end
