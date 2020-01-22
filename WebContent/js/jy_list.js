/*
for this pen i used the jquery skeleton loader


full documentation and download:
https://www.npmjs.com/package/jquery.skeleton.loader

the project on github
https://github.com/enbifa/jquery.skeleton.loader

for tips and features you consider useful for the plugin write me on enbifaforfun@gmail.com
*/










  var instance = $('#picked').scheletrone({
                    replaceImageWith: 'bg-image',
                    onComplete: function() {
        var str = '<div class="card"><figure class="card_header"><a href="#"><img src="https://source.unsplash.com/category/people/800x600"></a></figure><div class="card_text"><h2 class="card_title"><a href="#">Lore Ipsum.</a></h2><p class="card_desc">Merequi san dolor sit dafares et muli tuli - setam tu yavai. Lorem ipsum dolor sit amet, cetera en bas equi.</p></div></div></div>';
                      
 //for debug
var loaderVar;
var milliseconds = 2000;        
                      
                      
    loaderVar = setTimeout(function(){ 
$.ajax({
    url: "https://codepen.io/picks/feed/?page=1",
    dataType: "xml",
    type: "GET",
    error: function (request, error) {
        console.log(arguments);
        alert(" Can't do because: " + error);
    },
    success: function(xml) {
        var processedXML = xmlToJson(xml);
        $( "#picked" ).html('')
        
        for (var i = 0, len = 3; i < len; i++) {

            var str = '<div class="card"><figure class="card_header"><a href="'+processedXML.rss.channel.item[i].link["#text"]+'" target="_parent"><img src="'+processedXML.rss.channel.item[i].link["#text"]+'/image/small.png"></a></figure><div class="card_text"><h2 class="card_title"><a href="#">'+processedXML.rss.channel.item[i].title["#text"]+'</a></h2><p class="card_desc">Author: '+processedXML.rss.channel.item[i]["dc:creator"]["#text"]+'<br><small>Date: '+processedXML.rss.channel.item[i]["dc:date"]["#text"]+'</small></p><br><br><a href="'+processedXML.rss.channel.item[i].link["#text"]+'" target="_parent">See the Code</a></div></div></div>';
           $("#picked").append(str);
        }
       
        
    }
});
      
      clearTimeout(loaderVar);
        }, milliseconds);
                        
                    }
                    }
);


 // Changes XML to JSON
function xmlToJson(xml) {
	
	// Create the return object
	var obj = {};

	if (xml.nodeType == 1) { // element
		// do attributes
		if (xml.attributes.length > 0) {
		obj["@attributes"] = {};
			for (var j = 0; j < xml.attributes.length; j++) {
				var attribute = xml.attributes.item(j);
				obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
			}
		}
	} else if (xml.nodeType == 3) { // text
		obj = xml.nodeValue;
	}

	// do children
	if (xml.hasChildNodes()) {
		for(var i = 0; i < xml.childNodes.length; i++) {
			var item = xml.childNodes.item(i);
			var nodeName = item.nodeName;
			if (typeof(obj[nodeName]) == "undefined") {
				obj[nodeName] = xmlToJson(item);
			} else {
				if (typeof(obj[nodeName].push) == "undefined") {
					var old = obj[nodeName];
					obj[nodeName] = [];
					obj[nodeName].push(old);
				}
				obj[nodeName].push(xmlToJson(item));
			}
		}
	}
	return obj;
};