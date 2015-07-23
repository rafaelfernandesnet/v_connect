# Homepage (Root path)

# TODO: authorize logged in student
# helpers do
#   def protected!
#     return if authorized?
#     headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
#     halt 401, "Not authorized\n"
#   end

#   def authorized?
#     @student = Student.find_by(email: @email)
#     @student.authenticate(@password)
#   end
# end

# before '/student/*' do
#   authenticate!
# end

# get '/protected' do
#   protected!
#   "Welcome, authenticated client"
# end

get '/' do
  erb :index
end

get '/registered' do
  'registered!'
end

get '/student/register' do
  @student = Student.new
  erb :'students/new'
end

post '/students' do
  @student = Student.new(
    email: params[:email]
  )
  @student.password = params[:password]
  @student.password_confirmation = params[:password2]
  if @student.save
    # TODO: login
    redirect '/registered'
  else
    erb :'students/new'
  end

end
