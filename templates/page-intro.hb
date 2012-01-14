<div data-role="page" id="intro" data-backbtn="false" data-theme="c">
   <div data-role="header">
      <h1>{{title}}</h1>
      <h2>{{description}}</h2>
   </div>
   <div data-role="content" class="content">
      <p>Please enter the following information.</p>
      <div data-role="fieldcontain">
         <label for="nhs_number">NHS Number:</label>
         <input type="text" name="nhs_number" id="nhs_number" value="" />
      </div>
      <div data-role="fieldcontain">
         <label for="dob">Date of Birth (dd/mm/yyyy):</label>
         <input type="text" name="dob" id="dob" value="" />
      </div>
   </div>
   <div data-role="footer" data-position="fixed" class="footer">
      <a href="#question_1" data-icon="arrow-r" data-iconpos="right" class="next-button">Next</a>
   </div>
</div>