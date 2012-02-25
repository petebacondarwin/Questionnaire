# Show functions to be exported from the design doc.

dust = require('dust');

render = (name, context)->
  r = ''
  dust.render name, context, (err, result)->
    throw err if err
    r = result  
  r

# This function returns a questionnaire in the form of an JQuery Mobile HTML page
# Each question in the questionnaire is rendered using a template specific to that question type

exports.questionnaire = (doc,req)->
  pages = []
  pages.push render('page-intro.hb',doc)
  num_questions = doc.questions.length
  for question, i in doc.questions
      #Add some meta data to the question
      question.index = i+1
      question.page_id = "question_"+(i+1)
      question.first = (i==0)
      question.last = (i==num_questions-1)
      question.previous = "question_#{i}" unless question.first
      question.next = "question_#{i+2}" unless question.last
      # Render the template and add it to the list
      pages.push render("page-#{question.type}.hb",question)
  # Render the summary page, which lists all the responses to the questions
  pages.push render("page-summary.hb",{"questionnaire":doc,"last": "question_"+num_questions})
  # Render the completion page which has a thank you message
  pages.push render("page-complete.hb",doc)

  # Render the overall layout of the page  
  date = new Date()
  render "base.hb",
    "document": doc
    "submission":
      "date": date.toDateString()
      "time": date.getTime()
    "content": pages.join('\n')
