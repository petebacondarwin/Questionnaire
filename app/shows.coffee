# Show functions to be exported from the design doc.

handlebars = require('handlebars');

# Setup the templates
page_templates = 
  choice: handlebars.template['page-choice.hb']
intro_template = handlebars.template['page-intro.hb']
summary_template = handlebars.template['page-summary.hb']
complete_template = handlebars.template['page-complete.hb']
base_template = handlebars.template['base.hb']

# This function returns a questionnaire in the form of an JQuery Mobile HTML page
# Each question in the questionnaire is rendered using a template specific to that question type

exports.questionnaire = (doc,req)->
  pages = []
  pages.push intro_template(doc)
  for question, i in doc.questions
      #Add some meta data to the question
      question.index = i+1
      question.page_id = "question_"+(i+1)
      question.first = (i==0)
      question.last = (i==questions.length-1)
      question.previous = question.first ? null : "question_"+i
      question.next = question.last ? null : "question_"+(i+2)
      # Render the template and add it to the list
      pages.push page_templates[question.type](question)
  # Render the summary page, which lists all the responses to the questions
  pages.push summary_template({"questionnaire":doc,"last": "question_"+questions.length})
  # Render the completion page which has a thank you message
  pages.push complete_template(doc)

  # Render the overall layout of the page  
  date = new Date()
  base_template
    "document": doc
    "submission":
      "date": date.toDateString()
      "time": date.getTime()
    "content": pages.join('\n')
