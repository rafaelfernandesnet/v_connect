# Homepage (Root path)
get '/' do
  erb :index
end

get '/students/:id/organizations' do 
  #TODO: change when sessions/login/authorization is finished
  @organizations = Organization.all
  @student = Student.find(params[:id])
  erb :'organizations/index'
end

get '/organizations/:id/students' do
  #TODO: refactor erb file using partials
  @organization = Organization.find(params[:id])
  @students = @organization.students
  erb :'favourites/index'
end
