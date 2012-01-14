<div data-role="page" id="{{page_id}}" data-backbtn="false" data-theme="c" class="choice-question">
   <div data-role="header">
      <h1>{{title}}</h1>
   </div>
   <div data-role="content" class="content">
      <p class="question-text">{{question}}</p>
      <div data-role="fieldcontain" class="question-choices">
         <fieldset data-role="controlgroup" data-type="horizontal">
            {{#choices}}
            <input type="radio" name="{{../name}}" id="{{../name}}_{{value}}" value="{{value}}" />
            <label for="{{../name}}_{{value}}">{{title}}</label>
            {{/choices}}
         </fieldset>
      </div>
   </div>
   <div data-role="footer" data-position="fixed" class="footer">
      <a href="#intro" data-icon="arrow-l" data-iconpos="left">Back to Start</a>
      {{#previous}}<a href="#{{this}}" data-icon="arrow-l" data-iconpos="left" class="previous-button">Previous</a>{{/previous}}
      {{#next}}
      <a href="#{{this}}" data-icon="arrow-r" data-iconpos="right" class="next-button">Next</a>
      {{/next}}
      <a href="#summary" data-icon="arrow-r" data-iconpos="right">Check and Submit</a>
   </div>
</div>
