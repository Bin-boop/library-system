var path = $("#path").val();
var imgYes = "<img width='15px' src='"+path+"/static/img/y.png' />";
var imgNo = "<img width='15px' src='"+path+"/static/img/n.png' />";

function validateTip(element,css,tipString,status){
	
	element.css(css);
	element.html(tipString);
	
	element.prev().attr("validateStatus",status);
}
var referer = $("#referer").val();