# Homepage (Root path)
get '/' do
  erb :index
end

#students can see a list of all organizations that are registered
get '/organizations' do 
  #TODO: change when sessions/login/authorization is finished
  @organizations = Organization.all
  erb :'organizations/index'
end

#an organization can see a list of interested students
get '/organizations/:id/students' do
  #TODO: refactor erb file using partials
  @organization = Organization.find(params[:id])
  @students = @organization.students
  erb :'students/index'
end

#display all students that are registered
get '/students' do 
  @students = Student.all
  erb :'students/index'
end

#a student can see their favourite organizations
get '/students/:id/organizations' do
  @student = Student.find(params[:id])
  @organizations = @student.organizations
  erb :'organizations/index'
end


