#students can see a list of all organizations that are registered
get '/organizations' do 
  #TODO: change when sessions/login/authorization is finished
  @organizations = Organization.all
  erb :'organizations/index'
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


#an organization can see a list of interested students
get '/organizations/:id/students' do
  #TODO: refactor erb file using partials
  @organization = Organization.find(params[:id])
  @students = @organization.students
  erb :'students/index'
end

