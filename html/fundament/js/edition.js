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
		let linkOfHeaderOfWindowFour = $("#paragraph-for-witness-4-header > a");
		$("#paragraph-for-witness-3-header").empty();
		$("#paragraph-for-witness-3-header").append(linkOfHeaderOfWindowFour);
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
		let linkOfHeaderOfWindowFour = $("#paragraph-for-witness-4-header > a");
		let linkOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header > a");
		$("#paragraph-for-witness-2-header").empty();
		$("#paragraph-for-witness-2-header").append(linkOfHeaderOfWindowThree);
		$("#paragraph-for-witness-3-header").empty();
		$("#paragraph-for-witness-3-header").append(linkOfHeaderOfWindowFour);
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
		configurationObject.windowFourHasText = false;
		configurationObject.windowFourUrlOfFragment = '';
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
			$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
			let linkOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header > a");
			$("#paragraph-for-witness-2-header").empty();
			$("#paragraph-for-witness-2-header").append(linkOfHeaderOfWindowThree);
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
		let linkOfHeaderOfWindowFour = $("#paragraph-for-witness-4-header > a");
		let linkOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header > a");
		let linkOfHeaderOfWindowTwo = $("#paragraph-for-witness-2-header > a");
		$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
		$("#paragraph-for-witness-1-header").empty()
		$("#paragraph-for-witness-1-header").append(linkOfHeaderOfWindowTwo);
		configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
		$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
		$("#paragraph-for-witness-2-header").empty();
		$("#paragraph-for-witness-2-header").append(linkOfHeaderOfWindowThree);
		configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
		$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
		$("#paragraph-for-witness-3-header").empty();
		$("#paragraph-for-witness-3-header").append(linkOfHeaderOfWindowFour);
		configurationObject.windowThreeUrlOfFragment = configurationObject.windowFourUrlOfFragment;
		$("#window-for-witnesses-4").removeClass("for-witness-visible").addClass("for-witness-hidden");
		configurationObject.windowFourHasText = false;
		configurationObject.windowFourUrlOfFragment = '';
	} else
		if($("#window-for-witnesses-3").hasClass("for-witness-visible")){
			let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
			let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
			let linkOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header > a");
			let linkOfHeaderOfWindowTwo = $("#paragraph-for-witness-2-header > a");
			$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
			$("#paragraph-for-witness-1-header").empty();
			$("#paragraph-for-witness-1-header").append(linkOfHeaderOfWindowTwo);
			configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
			$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
			$("#paragraph-for-witness-2-header").empty();
			$("#paragraph-for-witness-2-header").append(linkOfHeaderOfWindowThree);
			configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
			$("#window-for-witnesses-3").removeClass("for-witness-visible").addClass("for-witness-hidden");
			configurationObject.windowThreeHasText = false;
			configurationObject.windowThreeUrlOfFragment = '';
		} else 
			if($("#window-for-witnesses-2").hasClass("for-witness-visible")){
				let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
				let linkOfHeaderOfWindowTwo = $("#paragraph-for-witness-2-header > a");
				$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
				$("#paragraph-for-witness-1-header").empty();
				$("#paragraph-for-witness-1-header").append(linkOfHeaderOfWindowTwo);
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
			let urlOfCommentaryfragment = commentaryfragment._links.self.href;
			let commentaryfragmentId = commentaryfragment._embedded.commentaryfragment.id;
			let urlFragmentForLinkToTranscription = '';
			if (urlOfCommentaryfragment.includes('vat-gr-754')){ urlFragmentForLinkToTranscription = 'vat_gr_754.html'; }
			else if (urlOfCommentaryfragment.includes('ambr-b-106-sup')){ urlFragmentForLinkToTranscription = 'ambros_B_106_sup.html'; }
			else if (urlOfCommentaryfragment.includes('ambr-m-47-sup')){ urlFragmentForLinkToTranscription = 'ambr_m_47_sup.html'; }
			else if (urlOfCommentaryfragment.includes('athen-b-n-8')){ urlFragmentForLinkToTranscription = 'athen_b_n_8.html'; }
			else if (urlOfCommentaryfragment.includes('bodl-auct-d-4-1')){ urlFragmentForLinkToTranscription = 'bodl_auct_d_4_1.html'; }
			else if (urlOfCommentaryfragment.includes('coislin-10')){ urlFragmentForLinkToTranscription = 'coislin_10.html'; }
			else if (urlOfCommentaryfragment.includes('coislin-12')){ urlFragmentForLinkToTranscription = 'coislin_12.html'; }
			else if (urlOfCommentaryfragment.includes('franzon-3')){ urlFragmentForLinkToTranscription = 'franzon_3.html'; }
			else if (urlOfCommentaryfragment.includes('mosq-syn-194')){ urlFragmentForLinkToTranscription = 'mosq_syn_194.html'; }
			else if (urlOfCommentaryfragment.includes('oxon-s-trin-78')){ urlFragmentForLinkToTranscription = 'oxon_s_trin_78.html'; }
			else if (urlOfCommentaryfragment.includes('par-gr-139')){ urlFragmentForLinkToTranscription = 'par_gr_139.html'; }
			else if (urlOfCommentaryfragment.includes('par-gr-164')){ urlFragmentForLinkToTranscription = 'par_gr_164.html'; }
			else if (urlOfCommentaryfragment.includes('par-gr-166')){ urlFragmentForLinkToTranscription = 'par_gr_166.html'; }
			else if (urlOfCommentaryfragment.includes('plut-5-30')){ urlFragmentForLinkToTranscription = 'plut_5_30.html'; }
			else if (urlOfCommentaryfragment.includes('plut-6-3')){ urlFragmentForLinkToTranscription = 'plut_6_3.html'; }
			else if (urlOfCommentaryfragment.includes('vat-gr-1422')){ urlFragmentForLinkToTranscription = 'vat_gr_1422.html'; }
			let urlForLinkToTranscription = "./manuscripts/" + urlFragmentForLinkToTranscription + "#" + commentaryfragmentId;
			let linkToTranscription = $("<a href='" + urlForLinkToTranscription + "'>" + commentaryfragmentManuscriptName + "</a>");
			if (configurationObject.windowFourHasText === true){
				let textOfParagraphOfWindowFour = $("#paragraph-for-witness-4").text();
				let textOfParagraphOfWindowThree = $("#paragraph-for-witness-3").text();
				let textOfParagraphOfWindowTwo = $("#paragraph-for-witness-2").text();
				let linkOfHeaderOfWindowFour = $("#paragraph-for-witness-4-header > a");
				let linkOfHeaderOfWindowThree = $("#paragraph-for-witness-3-header > a");
				let linkOfHeaderOfWindowTwo = $("#paragraph-for-witness-2-header > a");
				$("#paragraph-for-witness-1").text(textOfParagraphOfWindowTwo);
				$("#paragraph-for-witness-1-header").empty();
				$("#paragraph-for-witness-1-header").append(linkOfHeaderOfWindowTwo);
				configurationObject.windowOneUrlOfFragment = configurationObject.windowTwoUrlOfFragment;
				$("#paragraph-for-witness-2").text(textOfParagraphOfWindowThree);
				$("#paragraph-for-witness-2-header").empty();
				$("#paragraph-for-witness-2-header").append(linkOfHeaderOfWindowThree);
				configurationObject.windowTwoUrlOfFragment = configurationObject.windowThreeUrlOfFragment;
				$("#paragraph-for-witness-3").text(textOfParagraphOfWindowFour);
				$("#paragraph-for-witness-3-header").empty();
				$("#paragraph-for-witness-3-header").append(linkOfHeaderOfWindowFour);
				configurationObject.windowThreeUrlOfFragment = configurationObject.windowFourUrlOfFragment;
				$("#paragraph-for-witness-4").text(commentaryfragmentText);
				$("#paragraph-for-witness-4-header").empty();
				$("#paragraph-for-witness-4-header").append(linkToTranscription);
				configurationObject.windowFourUrlOfFragment = link;
			} else
				if (configurationObject.windowThreeHasText === true){
					$("#paragraph-for-witness-4").text(commentaryfragmentText);
					$("#paragraph-for-witness-4-header").text("");
					$("#paragraph-for-witness-4-header").append(linkToTranscription);
					configurationObject.windowFourHasText = true;
					configurationObject.windowFourUrlOfFragment = link;
					$("#window-for-witnesses-4").removeClass("for-witness-hidden").addClass("for-witness-visible");
				} else
					if (configurationObject.windowTwoHasText === true){
						$("#paragraph-for-witness-3").text(commentaryfragmentText);
						$("#paragraph-for-witness-3-header").text("");
						$("#paragraph-for-witness-3-header").append(linkToTranscription);
						configurationObject.windowThreeHasText = true;
						configurationObject.windowThreeUrlOfFragment = link;
						$("#window-for-witnesses-3").removeClass("for-witness-hidden").addClass("for-witness-visible");
					} else
						if (configurationObject.windowOneHasText === true){
							$("#paragraph-for-witness-2").text(commentaryfragmentText);
							$("#paragraph-for-witness-2-header").text("");
							$("#paragraph-for-witness-2-header").append(linkToTranscription);
							configurationObject.windowTwoHasText = true;
							configurationObject.windowTwoUrlOfFragment = link;
							$("#window-for-witnesses-2").removeClass("for-witness-hidden").addClass("for-witness-visible");
						} else {
								$("#paragraph-for-witness-1").text(commentaryfragmentText);
								$("#paragraph-for-witness-1-header").text("");
								$("#paragraph-for-witness-1-header").append(linkToTranscription);
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

$(document).ready(function () {
    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

});