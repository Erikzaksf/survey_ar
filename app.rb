require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/survey")
require("./lib/question")
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

get('/surveys/:id') do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey)
end

get('/surveys/:id/edit') do
  @survey = Survey.find(params.fetch("id").to_i())
  erb(:survey_edit)
end

get('/questions') do
  @questions = Question.all()
  erb(:questions)
end

get('/questions/:id') do
  @question = Question.find(params.fetch("id").to_i())
  erb(:question)
end

get('/questions/:id/edit') do
  @question = Question.find(params.fetch("id").to_i())
  erb(:question_edit)
end

post("/questions") do
  question = params.fetch("question")
  survey_id= params.fetch("survey_id")
  @question = Question.new({:questions => question, :survey_id => survey_id})
  @question.save
  erb(:success)
end

post("/questions") do
  questions = params.fetch("questions")
  survey_id = params.fetch("survey_id").to_i()
  @survey = Survey.find(survey_id)
  @question = Question.new({:questions => questions, :survey_id => survey_id})
  if @question.save()
    erb(:success)
  else
    erb(:errors)
  end
end


patch("/surveys/:id") do
  name = params.fetch("name")
  @survey = Survey.find(params.fetch("id").to_i())
  @survey.update({:name => name})
  @surveys = Survey.all()
  erb(:survey)
end

delete("/surveys/:id") do
  @survey = Survey.find(params.fetch("id").to_i)
  @survey.delete
  @surveys = Survey.all
  erb(:index)
end


patch("/questions/:id") do
  question = params.fetch("question")
  @question = Question.find(params.fetch("id").to_i())
  @question.update({:question => question})
  @questions = Question.all()
  erb(:index)
end
