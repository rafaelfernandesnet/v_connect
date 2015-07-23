# Homepage (Root path)

# TODO: authorize logged in student
# helpers do
#   def protected!
#     return if authorized?
#     headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
#     halt 401, "Not authorized\n"
#   end

#   def authorized?
#     @student = Student.find_by(email: @email)
#     @student.authenticate(@password)
#   end
# end

get '/' do
  "Everybody can see this page"
end

# get '/protected' do
#   protected!
#   "Welcome, authenticated client"
# end
