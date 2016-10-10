require 'sinatra'
require 'mail'
require 'mail_store'
require 'yaml/store'
store = MailStore.new('mail.yml')

get('/cv') do
    erb :index
end
get('/cv/mail') do
	@mail = store.all
	erb :mail
end
post('/cv/create') do
	@mail = Mail.new
	@mail.email = params['email']
	@mail.content = params['content']
	store.save(@mail)
	erb :show
	
end
get('/cv/:id') do
	id = params['id'].to_i
	@mail = store.find(id)
	erb :show
end
