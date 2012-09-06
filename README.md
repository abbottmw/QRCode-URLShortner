QR Code Generator for cfml.us
---

This code will create a QR code from the http://cfml.us URL shortener.
It parses the HTML returned after posting to the site.
An example file html.txt is provided as test data.

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