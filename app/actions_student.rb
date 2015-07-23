#display all students that are registered
get '/students' do 
  @students = Student.all
  erb :'students/index'
end

# student sign up page
get '/students/register' do
  @student = Student.new
  @errors = [] #TODO: create a helper for checking errors
  erb :'students/new'
end

# student login page
get '/students/session' do
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
    session[:id] = @student.id
    redirect '/'
  else
    @errors = @student.errors.full_messages 
    erb :'students/new'
  end
end

# login student
post '/students/session' do
  @student = Student.find_by(email: params[:email])
  @errors = []
  if @student && @student.authenticate(params[:password])
    session[:id] = @student.id
    redirect '/'
  else
    @errors << "Invalid login"
    erb :'students/login'
  end
end