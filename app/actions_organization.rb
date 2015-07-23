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

get '/organization/profile' do
  @organization = Organization.find_by(id: session[:id])
  if @organization
    erb :'/organization/show'
  else redirect '/'
  end
end
