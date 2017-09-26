require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("pg")


get("/") do
  @surveys = Survey.all()
  erb(:index)
end


get("/surveys/new") do
  erb(:survey_form)
end

post("/surveys") do
  name = params.fetch("name")
  @survey = Survey.new({:survey_name => name, :id => nil})
  @survey.save
  erb(:survey_success)
end

get('/surveys') do
  @surveys = Survey.all()
  erb(:surveys)
end

get('/surveys/:id/edit') do
  @question = Survey.find(params.fetch("id").to_i())
  erb(:survey_edit)
end

patch("/surveys/:id") do
  name = params.fetch("name")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:name => name})
  @surveys = Survey.all()
  erb(:index)
end

get('/questions/:id/edit') do
  @question = Question.find(params.fetch("id").to_i())
  erb(:question_edit)
end

patch("/questions/:id") do
  question = params.fetch("question")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:question => question})
  @questions = Question.all()
  erb(:index)
end
