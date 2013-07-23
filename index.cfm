<cfscript>
	QRCodeURL= new com.cftwins.QRCode();
	qrcode = QRCodeURL.createQRCodeFromURL('http://www.cftwins.com');
</cfscript>

<!---output to img tag--->
<cfoutput>
	<img src="data:image/png;base64,#HTMLEditFormat(ToBase64(qrcode))#"/>
</cfoutput>

<!---write to browser--->
<cfimage source="#qrcode#" action="writeToBrowser" format="png" >

<!---using cfcontent--->
<!---<cfcontent reset="true" variable="#qrcode#" type="image/png">--->