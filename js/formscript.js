function log(obj){
	$('response').text(JSON.stringify(obj));
}

var m = new mandrill.Mandrill('ynLg2epHdEe4AxV5YCXdLA');
var mysubject = "";
var _name;
var _email;
var _phone;
var _linkedin;
var _domain;
var _careerpath;
var _other;
var _summary;
var _skills5;
var _achievements3;
var _nextstep;
var _fewyears;



function sendTheMail(){
	_name = document.getElementById("name");
	_email = document.getElementById("email");
	_phone = document.getElementById("phone");
	_linkedin = document.getElementById("linkedin");
	_domain = document.getElementById("domain");
	_careerpath = document.getElementById("careerpath");
	_other = document.getElementById("other");
	_summary = document.getElementById("summary");
	_skills5 = document.getElementById("skills5");
	_achievements3 = document.getElementById("achievements3");
	_nextstep = document.getElementById("nextstep");
	_fewyears = document.getElementById("fewyears");
	mysubject = "hi my subject";
	var params = {
"message": {
	"from_email": "recsyteam@gmail.com",
	"to": [{"email": "recsyteam@gmail.com"}],
	"subject": "NEW ORDER: " + _name.value,
	"html": "NEW ORDER: " + _name.value + " <br/>Email: " + _email.value + "  <br/>Phone Number: " + _phone.value + "  <br/>LinkedIn Profile: "
	+ _linkedin.value + " <br/>Top Three Choices for a Domain Name: " + _domain.value + " <br/>Intended Career Path: " + careerpath.value +
	 "<br/><br>*If Other, What Intended Career?: " + _other.value + "<br/>Front Page Summary: " + _summary.value
	+ "<br/>Top Three Achievements: " + _achievements3.value + "<br/>Next Anticipated Career Step: " +  _nextstep.value + "<br/><br/>"
	+"Where do you want to be in a few years? " + _fewyears.value

}
};

	m.messages.send(params, function(res){
		log(res);
	}, function(err){
		log(err);
	});
}
