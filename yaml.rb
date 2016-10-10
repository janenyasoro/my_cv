require 'mail'
require 'yaml/store'
store = YAML::Store.new('test.yml')

first_mail = Mail.new
first_mail.email = "janenyasoro@gmail.com"
first_mail.content = "ruby at first"


second_mail = Mail.new
second_mail.email = "ombinja@yahoo.com"
second_mail.content = "find attached my cv"

store.transaction do 
store["janenyasoro@gmail.com"] = first_mail
store["ombinja@yahoo.com"] = second_mail

p store["ombinja@yahoo.com"]	
end