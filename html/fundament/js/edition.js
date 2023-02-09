function handleWitnesses(){
	
	configurationObject = {};
	configurationObject.windowOneHasText = false;
	configurationObject.windowTwoHasText = false;
	configurationObject.windowThreeHasText = false;
	configurationObject.windowFourHasText = false;
	configurationObject.windowOneUrlOfFragment = '';
	configurationObject.windowTwoUrlOfFragment = '';
	configurationObject.windowThreeUrlOfFragment = '';
	configurationObject.windowFourUrlOfFragment = '';
	
$("#close-button-4").click(function() {
	$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
	configurationObject.windowFourHasText = false;
	configurationObject.windowFourUrlOfFragment = '';
});

$("#close-button-3").click(function() {
	if($("#window-for-witnesses-4").hasClass("for-witness-visible")){
		let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
		$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
		configurationObject.windowThreeUrlOfFragment = configurationObject.windowFourUrlOfFragment;
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
		configurationObject.windowFourHasText = false;
		configurationObject.windowFourUrlOfFragment = '';
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			$("#window-for-witnesses-3").removeClass("for-witness-visible").addClass("for-witness-hidden");
			configurationObject.windowThreeHasText = false;
			configurationObject.windowThreeUrlOfFragment = '';
		}
});

$("#close-button-2").click(function() {
	if($("#window-for-witnesses-4").hasClass("for-witness-visible")){
		let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
		let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
		$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
		configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
		$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
		configurationObject.windowThreeUrlOfFragment = configurationObject.windowFourUrlOfFragment;
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
		configurationObject.windowFourHasText = false;
		configurationObject.windowFourUrlOfFragment = '';
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
			$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
			configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
			$("#window-for-witnesses-3").removeClass("for-witness-visible").addClass("for-witness-hidden");
			configurationObject.windowThreeHasText = false;
			configurationObject.windowThreeUrlOfFragment = '';
		} else {
			$("#window-for-witnesses-2").removeClass("for-witness-visible").addClass("for-witness-hidden");
			configurationObject.windowTwoHasText = false;
			configurationObject.windowTwoUrlOfFragment = '';
		}
});

$("#close-button-1").click(function() {
	if($("#window-for-witnesses-4").hasClass("for-witness-visible")){
		let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
		let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
		let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
		$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
		configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
		$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
		configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
		$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
		configurationObject.windowThreeUrlOfFragment = configurationObject.windowFourUrlOfFragment;
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
		configurationObject.windowFourHasText = false;
		configurationObject.windowFourUrlOfFragment = '';
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
			let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
			$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
			configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
			$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
			configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
			$("#window-for-witnesses-3").removeClass("for-witness-visible").addClass("for-witness-hidden");
			configurationObject.windowThreeHasText = false;
			configurationObject.windowThreeUrlOfFragment = '';
		} else 
			if($("#window-for-witnesses-2").hasClass("for-witness-visible")){
				let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
				$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
				configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
				$("#window-for-witnesses-2").removeClass("for-witness-visible").addClass("for-witness-hidden");
				configurationObject.windowTwoHasText = false;
				configurationObject.windowTwoUrlOfFragment = '';
		} else {
			$("#window-for-witnesses-1").removeClass("for-witness-visible").addClass("for-witness-hidden");
			configurationObject.windowOneHasText = false;
			configurationObject.windowOneUrlOfFragment = '';
		}
});

$(".link-to-witness").click(function(event) {	
	event.preventDefault();
	let link = event.target.href;
	if (!((configurationObject.windowOneUrlOfFragment === link) || (configurationObject.windowTwoUrlOfFragment === link) || (configurationObject.windowThreeUrlOfFragment === link) || (configurationObject.windowFourUrlOfFragment === link))){
		axios({
			method: "get",
			url: link,
			responseType: "application/json"
		})
		.then(function (response) {
			let commentaryfragment = JSON.parse(response.data);
			let commentaryfragmentText = commentaryfragment._embedded.commentaryfragment.text;
			if (configurationObject.windowFourHasText === true){
				let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
				let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
				let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
				$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
				configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
				$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
				configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
				$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
				configurationObject.windowThreeUrlOfFragment = configurationObject.windowFourUrlOfFragment;
				$("#paragraph-for-witness-4").text(commentaryfragmentText);
				configurationObject.windowFourUrlOfFragment = link;
			} else
				if (configurationObject.windowThreeHasText === true){
					$("#paragraph-for-witness-4").text(commentaryfragmentText);
					configurationObject.windowFourHasText = true;
					configurationObject.windowFourUrlOfFragment = link;
					$("#window-for-witnesses-4").removeClass("for-witness-hidden").addClass("for-witness-visible");
				} else
					if (configurationObject.windowTwoHasText === true){
						$("#paragraph-for-witness-3").text(commentaryfragmentText);
						configurationObject.windowThreeHasText = true;
						configurationObject.windowThreeUrlOfFragment = link;
						$("#window-for-witnesses-3").removeClass("for-witness-hidden").addClass("for-witness-visible");
					} else
						if (configurationObject.windowOneHasText === true){
							$("#paragraph-for-witness-2").text(commentaryfragmentText);
							configurationObject.windowTwoHasText = true;
							configurationObject.windowTwoUrlOfFragment = link;
							$("#window-for-witnesses-2").removeClass("for-witness-hidden").addClass("for-witness-visible");
						} else {
								$("#paragraph-for-witness-1").text(commentaryfragmentText);
								configurationObject.windowOneHasText = true;
								configurationObject.windowOneUrlOfFragment = link;
								$("#window-for-witnesses-1").removeClass("for-witness-hidden").addClass("for-witness-visible");
						}
		});
	}
});

	var that = {};
	return that;

}

window.onload = function(){
	let handleWitnessesClient = handleWitnesses();
}