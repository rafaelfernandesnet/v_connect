# Homepage (Root path)
get '/' do
  erb :index
end

# this will route to a student's profile after they log in
# expect session[:id] to be an id of a student to be set
get 'students/profile' do
	@student = Student.find_by(session[:id])

	if @student
		erb: '/students/show'
	else redirect '/'
	end

end