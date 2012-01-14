# Rewrite settings to be exported from the design doc
module.exports = [
  {
    "from":"/",
    "to":"_show/questionnaire/questionnaire-1"
  },
  {
     "from":"/responses",
     "to":"_list/responses/responses"
  },
  {
    "from": "/questionnaire/*",
    "to": "../../*"
  },
  {
    "from":"/:id",
    "to":"_show/questionnaire/:id"
  },
  { # keeping relative urls sane
    "from":"/css/*",
    "to":"/css/*"
  },
  { # keeping relative urls sane
    "from":"/js/*",
    "to":"/js/*"
  },
  { # keeping relative urls sane
    "from":"/images/*",
    "to":"/images/*"
  }
]
