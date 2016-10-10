require 'yaml/store'
class MailStore
	def initialize(file_name)
		@store = YAML::Store.new(file_name)
	end
	def find(id)
		@store.transaction do
			@store[id]
		end
	end
	def all
		@store.transaction do
			@store.roots.map { |id| @store[id]}
		end
	end
	def save(mail)  
		@store.transaction  do 
			unless mail.id
				highest_id = @store.roots.max || 0
				mail.id = highest_id + 1
			end
		@store[mail.id] = mail
	 
	    end
	end
end