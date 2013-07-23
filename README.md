QR Code Generator for cfml.us
---

This code will create a QR code from the http://cfml.us URL shortener.


REQUIREMENTS
-------------
This code is tested on CF 9.0.2 and Railo 3.3
This uses the IText library to generate the QR Codes, but this could be swapped out with other libraries like Zing Library with some modifications to the QR Code generation.

Example Usage
--------------

```cfm
  <cfscript>
    QRCodeURL = new com.cftwins.QRCode();
    //pass URL through cfml.us to get short url and create qrcode
    qrcode = QRCodeURL.createQRCodeFromURL('http://www.cfml.us');
  </cfscript>
  
  <!---output to img tag--->
  <cfoutput>
    <img src="data:image/png;base64,#HTMLEditFormat(ToBase64(qrcode))#"/>
  </cfoutput>
  
  <!---write to browser--->
  <cfimage source="#qrcode#" action="writeToBrowser" format="png" >
  
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