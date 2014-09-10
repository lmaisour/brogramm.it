class User < ActiveRecord::Base
	
belongs_to :users
belongs_to :rooms

end
