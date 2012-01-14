(function() {
  var allAnswered, find;

  allAnswered = function() {
    return $("ul#summary span.error").length === 0;
  };

  find = $.mobile.activePage.find;

  $(document).bind("mobileinit", function() {
    $("div:jqmData(role='page')").live('pageshow', function(event, ui) {
      return $.mobile.activePage.find('a[href="#summary"]').toggle(allAnswered());
    });
    return $('div#summary').live('pageshow', function(event, ui) {
      var _ref;
      return $("#submit-answers-button").button((_ref = allAnswered()) != null ? _ref : {
        'enable': 'disable'
      });
    });
  });

  $(document).ready(function() {
    var buildResponse;
    buildResponse = function() {
      var item, response;
      response = (function() {
        var _i, _len, _ref, _results;
        _ref = $("#questionnaire_form").serializeArray();
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          item = _ref[_i];
          _results.push(response[item.name] = item.value);
        }
        return _results;
      })();
      response.type = "response";
      response._id = "response_" + response.questionnaire + "_" + response.submission;
      response.hash = hex_md5(response.nhs_number + ":" + response.dob);
      delete response.nhs_number;
      delete response.dob;
      return response;
    };
    $('#questionnaire-form').validate();
    $('input[type="radio"]').change(function(query) {
      var answerSpan, selectedAnswer, summarySpan;
      selectedAnswer = $('label[for="' + query.target.id + '"]');
      summarySpan = $("#summary_" + $.mobile.activePage[0].id);
      answerSpan = summarySpan.find("span.answer");
      answerSpan.text(selectedAnswer.text());
      return $.mobile.activePage.find('a[href="#summary"]').toggle(allAnswered());
    });
    return $('#submit-answers-button').click(function(query) {
      var db, response;
      db = new CouchDB('questionnaire');
      response = buildResponse();
      db.save(response);
      $.mobile.changePage($("#complete"));
      return false;
    });
  });

}).call(this);
