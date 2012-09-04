<cfscript>
	Parser = new com.cftwins.Parser();
	html = fileRead(ExpandPath('data/html.txt'));
	uri = Parser.getShortURL(html);
	qrcode = Parser.createQRCode(uri);
	
	//pass URL through cfml.us to get short url and create qrcode
	//qrcode = Parser.createQRCodeFromURL('http://www.foxnews.com/tech/2012/09/03/5-easy-tricks-to-boost-your-home-wi-fi/?intcmp=features');
</cfscript>

<!---output to img tag--->
<cfoutput>
	<img src="data:image/png;base64,#HTMLEditFormat(ToBase64(qrcode))#"/>
</cfoutput>

<!---write to browser--->
<cfimage source="#qrcode#" action="writeToBrowser" format="jpg" >

<!---using cfcontent--->
<!---<cfcontent reset="true" variable="#qrcode#" type="image/png">--->


