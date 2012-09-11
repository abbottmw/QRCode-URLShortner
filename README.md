QR Code Generator for cfml.us
---

This code will create a QR code from the http://cfml.us URL shortener.
It parses the HTML returned after posting to the site.
An example file html.txt is provided as test data.

REQUIREMENTS
-------------
This code is written for Coldfusion 10 because it uses the new javaSettings to load Jars.  
It can be easily made to work with ACF9/Railo
by putting the jar files in the WEB-INF/lib directory of the web server.

Example Usage
--------------

```cfm
  <cfscript>
    Parser = new com.cftwins.Parser();
    //pass URL through cfml.us to get short url and create qrcode
    qrcode = Parser.createQRCodeFromURL('http://www.cfml.us');
  </cfscript>
  
  <!---output to img tag--->
  <cfoutput>
    <img src="data:image/png;base64,#HTMLEditFormat(ToBase64(qrcode))#"/>
  </cfoutput>
  
  <!---write to browser--->
  <cfimage source="#qrcode#" action="writeToBrowser" format="jpg" >
  
  <!---using cfcontent--->
  <!---<cfcontent reset="true" variable="#qrcode#" type="image/png">--->
  
```

License
---
Copyright 2012 Matthew Abbott

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.