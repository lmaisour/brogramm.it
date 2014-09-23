class Room < ActiveRecord::Base
	has_many :users
	# has_one :comment
end
