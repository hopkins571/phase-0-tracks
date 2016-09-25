require 'sqlite3'

class PackingList

	attr_reader :packing_list

	def initialize(database, userid, list_id, imported_list)
		@db = database
		@user_id = userid
		@list_id = list_id
		@packing_list = imported_list

	end


end
