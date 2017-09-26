require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("pg")


get(/) do
  @surveys = Survey.all()
  erb(:index)
end

get("/surveys/new") do
  erb(:survey_form)
end
