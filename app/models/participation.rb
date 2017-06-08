class Participation < ApplicationRecord
	belongs_to :user
	belongs_to :project

	#def user=(new_user)
  # 		self.old_user = self.user
   # 	super
  	#end
end


