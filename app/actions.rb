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
