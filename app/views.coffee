# Show functions to be exported from the design doc.
exports.by_type = 
  map: (doc)->
    emit [doc.type, doc.updated_at], doc._id

exports.responses =
  map: (doc)->
    emit doc.questionnaire, doc if doc.type == "response"
