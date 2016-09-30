# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

get '/campuses' do
	@students = db.execute("SELECT * FROM students")
	erb :campuses
end

get '/students/change_campus' do
	@students = db.execute("SELECT * FROM students")
	erb :change_campus
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

post '/students/change_campus' do	
  db.execute("UPDATE students SET campus = ? WHERE id = ?", [params['campus'], params['student'].to_i])
  redirect '/'
end

# add static resources