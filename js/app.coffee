# Have all the questions been answered - TODO: use general validation        
allAnswered = () ->
  $("ul#summary span.error").length is 0

find = $.mobile.activePage.find

# Set up the event handlers when the JQuery Mobile framework initializes
$(document).bind "mobileinit", () ->
  $("div:jqmData(role='page')").live 'pageshow', (event, ui) ->
    $.mobile.activePage.find('a[href="#summary"]').toggle(allAnswered())

  $('div#summary').live 'pageshow', (event, ui) ->
    # Only enable the submit button if all the questions have been answered.
    $("#submit-answers-button").button(allAnswered() ? 'enable' : 'disable')


$(document).ready ()->
  buildResponse = ()->
   
    # Extract the response from this page's form
    response = for item in $("#questionnaire_form").serializeArray()
      response[item.name] = item.value

    # Add extra useful meta data
    response.type = "response"
    response._id = "response_" + response.questionnaire + "_" + response.submission

    # Create the hash
    response.hash = hex_md5(response.nhs_number + ":" + response.dob)

    # Remove the original identifying data
    delete response.nhs_number;
    delete response.dob;
    
    response;
   
  # Add validation stuff to the form
  $('#questionnaire-form').validate()

  # When a choice is selected in a question...
  # Update the text in the summary page with the text from the label of the radio button that was selected
  $('input[type="radio"]').change (query)->
    selectedAnswer = $('label[for="'+query.target.id + '"]')
    summarySpan = $("#summary_"+$.mobile.activePage[0].id)
    answerSpan = summarySpan.find("span.answer")
    answerSpan.text(selectedAnswer.text())
    $.mobile.activePage.find('a[href="#summary"]').toggle(allAnswered())

  # Catch the form submission...
  $('#submit-answers-button').click (query)->
    db = new CouchDB('questionnaire')
    response = buildResponse()
    db.save(response)
    $.mobile.changePage($("#complete"))
    false
