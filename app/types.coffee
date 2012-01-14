### Kanso document types to export
{Type} = require('kanso/types')
fields = require('kanso/fields')
widgets = require('kanso/widgets')

exports.question = new Type('question-choice', {
   fields: {
      name: fields.string(),
      title: fields.string(),
      question: fields.string({
         widget: widgets.textarea({cols: 40, rows: 10})
      }),
      choices: {}
   }
})

exports.questionnaire = new Type('questionnaire', {
   fields: {
      created: fields.timestamp(),
      title: fields.string(),
      description: fields.string(),
      questions: fields.embedList({
         type: exports.question
      })
   }
})
###