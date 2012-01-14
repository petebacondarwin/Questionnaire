<div data-role="page" id="summary" data-backbtn="false" data-theme="c">
   {{#questionnaire}}
   <div data-role="header">
      <h1>{{title}}</h1>
      <h2>{{description}}</h2>
   </div>
   <div data-role="content" class="content">
      <p>
         Check your answers to the questions below.<br/>
         If you wish to change any responses select the question and you will have opportunity to alter your answer.
      </p>
      <ul id="summary" data-role="listview" data-inset="true">
         {{#questions}}
         <li id="summary_{{page_id}}" data-icon="check">
            <a href="#{{page_id}}">
               <span class="question">{{title}}:&nbsp;</span>
               <span class="answer"><span class="error">No answer selected</span></span>
            </a>
         </li>
         {{/questions}}
      </ul>
   </div>
   {{/questionnaire}}
   <div data-role="footer" data-position="fixed" class="footer">
      {{#last}}<a href="#{{this}}" data-icon="arrow-l" data-iconpos="left" class="previous-button">Previous</a>{{/last}}
      <button id="submit-answers-button">Submit Answers</button>
   </div>
</div>