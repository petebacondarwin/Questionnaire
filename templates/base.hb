<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>JQuery Mobile - Test</title>
      <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">

      <link rel="stylesheet" href="css/jquery.mobile-1.0b3.css">
      <link rel="stylesheet" href="css/style.css">
      <script src="js/jquery-1.6.2.js"></script>
      <script src="js/jquery.validate.min.js"></script>
      <script src="js/md5.js"></script>
      <script src="js/app.js"></script>
      <script src="js/couch.js"></script>
      <script src="js/jquery.mobile-1.0b3.js"></script>
   </head>
   <body>
      <form id="questionnaire_form" onsubmit="return false;">
         {{#document}}
         <input type="hidden" name="questionnaire" value="{{_id}}"/>
         {{/document}}
         {{#submission}}
         <input type="hidden" name="date" value="{{date}}"/>
         <input type="hidden" name="submission" value="{{time}}"/>
         {{/submission}}
         {{{content}}}
      </form>
   </body>
</html>
