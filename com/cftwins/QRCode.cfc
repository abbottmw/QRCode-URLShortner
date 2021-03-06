component 
{

	
	
	QRCode function init(){
		return this;	
	}
	
	
	
	public any function createQRCodeFromURL(string uri){
		
		var shorturi = getShortURL(ARGUMENTS.uri);
		return createQRCode(shorturi);
		
	}
	
	
	private string function getShortURL(string uri){
		
		var result = '';
		var httpService = new http(method='GET', url='http://cfml.us');
		
		if(!Len(trim(ARGUMENTS.uri))){
			throw(message="No Data Found!");
		}
		
		httpService.setCharset("utf-8");
		httpService.addParam(name="User-Agent", type="header",value="Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.0; Trident/5.0)");
		httpService.addParam(name="url", type="URL",value="#ARGUMENTS.uri#");
		
		result = httpService.send().getPrefix().FileContent;
		
		return result;
	}
	
	

	private any function createQRCode(string data){
		
		//QRCode creation using the iText library
		
		var Color = createObject("java","java.awt.Color");
		var w = 150;
		var h = 150;
		var qrcode = createObject('java','com.itextpdf.text.pdf.BarcodeQRCode').init(ARGUMENTS.data,w,h,JavaCast('null',''));
		var bg = Color.init(JavaCast("int",255),JavaCast("int",255),JavaCast("int",255),JavaCast("int",0));
		var imgAWT = qrcode.createAwtImage(Color.BLACK, bg);
		//writeDump(imgAWT);
	
		var cfCompatible = ImageNew("", w, h,"argb");
		var graphics = ImageGetBufferedImage(cfCompatible).getGraphics();
		var baos = createObject("java", "java.io.ByteArrayOutputStream").init();
		var ImageIO = createObject("java","javax.imageio.ImageIO");
		var bytes = '';
	
		
		graphics.drawImage(imgAWT, 0, 0, javacast("null", ""));
		graphics.dispose();
		
	
		ImageIO.write(ImageGetBufferedImage(cfCompatible),'png',baos);
		bytes = baos.toByteArray();
		baos.close();
		baos.reset();
		
		return bytes;
		
	}
	
}