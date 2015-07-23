# Homepage (Root path)
get '/' do
  erb :index
end


# TODO: authorize logged in student
helpers do
  def current_student
    Student.find(session[:id]) if session[:id]
  end
  def current_student?
    session[:id].nil?
  end
end
