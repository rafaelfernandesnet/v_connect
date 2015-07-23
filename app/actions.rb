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

# student sign up page
get '/student/register' do
  @student = Student.new
  @errors = [] #TODO: create a helper for checking errors
  erb :'students/new'
end

# student login page
get '/student/session' do
  @student = Student.new
  @errors = []
  erb :'students/login'
end

#a student can see their favourite organizations
get '/students/:id/organizations' do
  @student = Student.find(params[:id])
  @organizations = @student.organizations
  erb :'organizations/index'
end

# create new student
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

# login student
post '/student/session' do
  @student = Student.find_by(email: params[:email])
  @errors = []
  if @student && @student.authenticate(params[:password])
    session[:id] = @student.id
    redirect '/loggedin'
  else
    @errors << "Invalid login"
    erb :'students/login'
  end
end