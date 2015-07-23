# Homepage (Root path)

# TODO: authorize logged in student
helpers do
  def current_student
    Student.find(session[:id]) if session[:id]
  end
  def current_student?
    session[:id]
  end
end

get '/' do
  erb :index
end

# temporary routes
get '/registered' do
  'registered! '
end

get '/loggedin' do
  "logged in!"
end

get '/logout' do
  session[:id] = nil
  'logged out'
  # redirect '/'
end