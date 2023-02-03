$("#close-button-4").click(function() {
	$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
});

$("#close-button-3").click(function() {
	if($("#window-for-witnesses-4").hasClass("for-witness-visible")){
		let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
		$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			$("#window-for-witnesses-3").removeClass("for-witness-visible").addClass("for-witness-hidden");
		}
});

$("#close-button-2").click(function() {
	if($("#window-for-witnesses-4").hasClass("for-witness-visible")){
		let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
		let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
		$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
		$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
			$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
			$("#window-for-witnesses-3").removeClass("for-witness-visible").addClass("for-witness-hidden");
		} else {
			$("#window-for-witnesses-2").removeClass("for-witness-visible").addClass("for-witness-hidden");
		}
});

$("#close-button-1").click(function() {
	if($("#window-for-witnesses-4").hasClass("for-witness-visible")){
		let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
		let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
		let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
		$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
		$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
		$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
			let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
			$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
			$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
			$("#window-for-witnesses-3").removeClass("for-witness-visible").addClass("for-witness-hidden");
		} else 
			if($("#window-for-witnesses-2").hasClass("for-witness-visible")){
				let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
				$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
				$("#window-for-witnesses-2").removeClass("for-witness-visible").addClass("for-witness-hidden");
		} else {
			$("#window-for-witnesses-1").removeClass("for-witness-visible").addClass("for-witness-hidden");
		}
});

$(".link-to-witness").click(function(event) {
	event.preventDefault();
	let link = event.target.href;
	axios({
			method: "get",
			url: link,
			responseType: "application/json"
		})
		.then(function (response) {
			let commentaryfragment = JSON.parse(response.data);
			let commentaryfragmentText = commentaryfragment._embedded.commentaryfragment.text;
			$("#paragraph-for-witness-1").text(commentaryfragmentText);
			$("#window-for-witnesses-1").removeClass("for-witness-hidden").addClass("for-witness-visible");
		});
});