# Homepage (Root path)

# TODO: authorize logged in student
helpers do
  def current_student
    Student.find(session[:id]) if session[:id]
  end
  def current_student?
    session[:id].nil?
  end
end

get '/' do
  erb :index
end

# temporary routes
get '/registered' do
  'registered!'
end

get '/loggedin' do
  'logged in!'
end

get '/student/register' do
  @student = Student.new
  @errors = [] #TODO: create a helper for checking errors
  erb :'students/new'
end

get '/student/session' do
  @student = Student.new
  @errors = []
  erb :'students/login'
end

post '/students' do
  @errors = []
  @student = Student.new(params[:student])
  @student.password = params[:password]
  @student.password_confirmation = params[:password2]
  if @student.save
    # TODO: login and redirect to the student profile page
    redirect '/registered'
  else
    @errors = @student.errors.full_messages 
    erb :'students/new'
  end
end

post '/student/session' do
  @student = Student.find_by(email: params[:email])
  @errors = []
  case
  when @student.nil?
    @errors << "Invalid login"
    erb :'students/login'
  when @student.authenticate(params[:password])
    session[:id] = @student.id
    redirect '/loggedin'
  end
end
