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
		let textOfHeaderOfWindowFour = $("#paragraph-for-witness-4-header").text();
		$("#paragraph-for-witness-3-header").text(textOfHeaderOfWindowFour);
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
		let textOfHeaderOfWindowFour = $("#paragraph-for-witness-4-header").text();
		let textOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header").text();
		$("#paragraph-for-witness-2-header").text(textOfHeaderOfWindowThree);
		$("#paragraph-for-witness-3-header").text(textOfHeaderOfWindowFour);
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
		configurationObject.windowFourHasText = false;
		configurationObject.windowFourUrlOfFragment = '';
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
			$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
			let textOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header").text();
			$("#paragraph-for-witness-2-header").text(textOfHeaderOfWindowThree);
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
		let textOfHeaderOfWindowFour = $("#paragraph-for-witness-4-header").text();
		let textOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header").text();
		let textOfHeaderOfWindowTwo = $("#paragraph-for-witness-2-header").text();
		$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
		$("#paragraph-for-witness-1-header").text(textOfHeaderOfWindowTwo);
		configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
		$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
		$("#paragraph-for-witness-2-header").text(textOfHeaderOfWindowThree);
		configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
		$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
		$("#paragraph-for-witness-3-header").text(textOfHeaderOfWindowFour);
		configurationObject.windowThreeUrlOfFragment = configurationObject.windowFourUrlOfFragment;
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
		configurationObject.windowFourHasText = false;
		configurationObject.windowFourUrlOfFragment = '';
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
			let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
			let textOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header").text();
			let textOfHeaderOfWindowTwo = $("#paragraph-for-witness-2-header").text();
			$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
			$("#paragraph-for-witness-1-header").text(textOfHeaderOfWindowTwo);
			configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
			$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
			$("#paragraph-for-witness-2-header").text(textOfHeaderOfWindowThree);
			configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
			$("#window-for-witnesses-3").removeClass("for-witness-visible").addClass("for-witness-hidden");
			configurationObject.windowThreeHasText = false;
			configurationObject.windowThreeUrlOfFragment = '';
		} else 
			if($("#window-for-witnesses-2").hasClass("for-witness-visible")){
				let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
				let textOfHeaderOfWindowTwo = $("#paragraph-for-witness-2-header").text();
				$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
				$("#paragraph-for-witness-1-header").text(textOfHeaderOfWindowTwo);
				configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
				$("#window-for-witnesses-2").removeClass("for-witness-visible").addClass("for-witness-hidden");
				configurationObject.windowTwoHasText = false;
				configurationObject.windowTwoUrlOfFragment = '';
		} else {
			$("#window-for-witnesses-1").removeClass("for-witness-visible").addClass("for-witness-hidden");
			configurationObject.windowOneHasText = false;
			configurationObject.windowOneUrlOfFragment = '';
			$("#window-for-links-of-witnesses").empty();
			$("#window-for-links-of-witnesses").removeClass("for-links-of-witnesses").addClass("for-links-of-witnesses-hidden");
		}
});

$(".link-to-witness").click(handleClickOnLinksForWitnesses);

function handleClickOnLinksForWitnesses(event) {
	handleClickOnLinksForWitnessesWithoutNavigation(event);
	
	let linkObject = event.target;
	$("#window-for-links-of-witnesses").empty();
	let linksOfParticularFragment = $(linkObject).siblings();
	let paragraphForFirstLink = $("<p>→ </p>");
	let linkObjectClone = $(linkObject).clone()
	let paragraphWithFirstLink = $(paragraphForFirstLink).append(linkObjectClone);
	$("#window-for-links-of-witnesses").append(paragraphWithFirstLink);
	$(linksOfParticularFragment).each(function(){
		let paragraph = $("<p>→ </p>");
		let actualLinkObject = $(this).clone();
		let paragraphWithLink = $(paragraph).append(actualLinkObject);
		$("#window-for-links-of-witnesses").append(paragraphWithLink);
	});
	$("#window-for-links-of-witnesses").removeClass("for-links-of-witnesses-hidden").addClass("for-links-of-witnesses");
	$("#window-for-links-of-witnesses p .link-to-witness").click(handleClickOnLinksForWitnessesWithoutNavigation);
};

function handleClickOnLinksForWitnessesWithoutNavigation(event){
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
			let commentaryfragmentManuscriptName = commentaryfragment._links.manuscript["manuscript-identifier"];
			if (configurationObject.windowFourHasText === true){
				let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
				let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
				let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
				let textOfHeaderOfWindowFour = $("#paragraph-for-witness-4-header").text();
				let textOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header").text();
				let textOfHeaderOfWindowTwo = $("#paragraph-for-witness-2-header").text();
				$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
				$("#paragraph-for-witness-1-header").text(textOfHeaderOfWindowTwo);
				configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
				$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
				$("#paragraph-for-witness-2-header").text(textOfHeaderOfWindowThree);
				configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
				$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
				$("#paragraph-for-witness-3-header").text(textOfHeaderOfWindowFour);
				configurationObject.windowThreeUrlOfFragment = configurationObject.windowFourUrlOfFragment;
				$("#paragraph-for-witness-4").text(commentaryfragmentText);
				$("#paragraph-for-witness-4-header").text(commentaryfragmentManuscriptName);
				configurationObject.windowFourUrlOfFragment = link;
			} else
				if (configurationObject.windowThreeHasText === true){
					$("#paragraph-for-witness-4").text(commentaryfragmentText);
					$("#paragraph-for-witness-4-header").text(commentaryfragmentManuscriptName);
					configurationObject.windowFourHasText = true;
					configurationObject.windowFourUrlOfFragment = link;
					$("#window-for-witnesses-4").removeClass("for-witness-hidden").addClass("for-witness-visible");
				} else
					if (configurationObject.windowTwoHasText === true){
						$("#paragraph-for-witness-3").text(commentaryfragmentText);
						$("#paragraph-for-witness-3-header").text(commentaryfragmentManuscriptName);
						configurationObject.windowThreeHasText = true;
						configurationObject.windowThreeUrlOfFragment = link;
						$("#window-for-witnesses-3").removeClass("for-witness-hidden").addClass("for-witness-visible");
					} else
						if (configurationObject.windowOneHasText === true){
							$("#paragraph-for-witness-2").text(commentaryfragmentText);
							$("#paragraph-for-witness-2-header").text(commentaryfragmentManuscriptName);
							configurationObject.windowTwoHasText = true;
							configurationObject.windowTwoUrlOfFragment = link;
							$("#window-for-witnesses-2").removeClass("for-witness-hidden").addClass("for-witness-visible");
						} else {
								$("#paragraph-for-witness-1").text(commentaryfragmentText);
								$("#paragraph-for-witness-1-header").text(commentaryfragmentManuscriptName);
								configurationObject.windowOneHasText = true;
								configurationObject.windowOneUrlOfFragment = link;
								$("#window-for-witnesses-1").removeClass("for-witness-hidden").addClass("for-witness-visible");
						}
		});
	}
};

	var that = {};
	return that;

}

window.onload = function(){
	let handleWitnessesClient = handleWitnesses();
}