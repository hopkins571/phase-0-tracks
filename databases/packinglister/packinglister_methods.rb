require 'sqlite3'

class PackingList

	attr_reader :user_id, :list_id
	attr_accessor :packing_list, :destination, :departure_date


	def initialize(database, userid, list_id, imported_list)
		@db = database
		@destination = @db.execute("SELECT destination FROM lists where id = ?", [list_id])[0]["destination"]
		@departure_date = @db.execute("SELECT depart_date FROM lists where id = ?", [list_id])[0]["depart_date"]
		@user_id = userid
		@list_id = list_id
		@packing_list = imported_list

	end

	def save_changes
		@db.execute("UPDATE lists SET destination=?, depart_date=?, items=?, user_id=? WHERE id=?", [@destination, @departure_date, @packing_list.to_s, @user_id, @list_id])
		system "clear"
		puts "Bon Voyage!"
		sleep 3
	end
end
