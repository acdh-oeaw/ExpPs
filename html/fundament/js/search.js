function jsonClient(){
	let configurationObject = {};
	configurationObject.baseUrl = '';
	configurationObject.url = '';
	configurationObject.message = {};
	configurationObject.object = "home";
	configurationObject.acceptMimeType = "application/json";
	configurationObject.manuscriptPaths = {};
	
	configurationObject.actions = {};
	configurationObject.actions.home = {
		manuscripts : {
			target : "search-page",
			func : "httpGet",
			href : "/manuscripts"
		}
	};
	configurationObject.actions.items = {
		commentaryfragments : {
			target : "search-page",
			func : "httpGet",
			href : "/manuscripts/{id}/commentaryfragments"
		},
		hexaplaricVariants : {
			target : "search-page",
			func : "httpGet",
			href : "/manuscripts/{id}/hexaplaric-variants"
		},
		glosses : {
			target : "search-page",
			func : "httpGet",
			href : "manuscripts/{id}/glosses"
		},
		psalmtexts : {
			target : "search-page",
			func : "httpGet",
			href : "/manuscripts/{id}/psalmtexts"
		}
	};
	
	function initialize(baseUrl,url){
		if(url === null || url === ''){
			console.log("Missing start url");
		}
		else {
			configurationObject.baseUrl = baseUrl;
			configurationObject.url = url;
			if(configurationObject.url === "/manuscripts"){
				request(configurationObject.baseUrl + "/manuscripts","get");
				configurationObject.object = "home";
			}
		}
	}
	
	function processMessage(){
		configureForm();
		setItems();
	}

	function request(url,method){
		axios({
			method: method,
			url: url,
			responseType: configurationObject.acceptMimeType
		})
		.then(function (response) {
			configurationObject.message = JSON.parse(response.data);
			processMessage();
		})
		.catch(function (error) { console.log(error); });
	}

	function configureForm(){
		if(configurationObject.object === "home"){
			let listOfManuscripts = configurationObject.message;
			let namesOfManuscriptsAndPath = new Map();
			for (let n = 0; n < listOfManuscripts._embedded.manuscripts.length; n++){
				let nameOfManuscript = listOfManuscripts._embedded.manuscripts[n]["manuscript-name"];
				let optionAsText = "<option value='" + nameOfManuscript + "'>" + nameOfManuscript + "</option>";
				let optionAsObject = $(optionAsText);
				$('#name-of-manuscript-select').append(optionAsObject);
				let pathOfManuscript = listOfManuscripts._embedded.manuscripts[n]["manuscript-path"];
				namesOfManuscriptsAndPath.set(nameOfManuscript,pathOfManuscript);
			}
			configurationObject.manuscriptPaths = namesOfManuscriptsAndPath;
		}
	}
	
	function setItems(){
		let divForMessage = document.getElementById("search-result-messages");
		let divForItems = document.getElementById("search-result-content");
		$(divForMessage).empty();
		$(divForItems).empty();
		if (configurationObject.object === "commentaryfragments"){
			let commentaryfragments = configurationObject.message;
			let numberOfItems = commentaryfragments._embedded.commentaryfragments.length;
			let message = "";
			if(numberOfItems === 0){
				message = "No commentaryfragments found";
			}
			if(numberOfItems === 1){
				message = "One commentaryfragment found";
			}
			if(numberOfItems > 1){
				message = numberOfItems + " commentaryfragments found";
			}
			$(divForMessage).append($("<p>" + message + "</p>"));
			for (let n = 0; n < commentaryfragments._embedded.commentaryfragments.length; n++){
				let attribution = commentaryfragments._embedded.commentaryfragments[n]["attribution"];
				let authorCritical = commentaryfragments._embedded.commentaryfragments[n]["author-critical"];
				let urlOfCommentaryfragment = configurationObject.baseUrl + commentaryfragments._embedded.commentaryfragments[n]["_links"]["self"]["href"].substring("/psalmcatenae-server".length);
				let positionOfId = commentaryfragments._embedded.commentaryfragments[n]["_links"]["self"]["href"].lastIndexOf('/');
				let idOfLink = commentaryfragments._embedded.commentaryfragments[n]["_links"]["self"]["href"].substring(positionOfId + 1);
				$(divForItems).append(
					$("<div class='search-result-item'></div>").append(
					$("<a class='link-to-commentaryfragment' href='" + urlOfCommentaryfragment + "' id='" + idOfLink + "'/>").append($("<span class='search-result-item-attribution'>" + attribution + " - " + authorCritical + "</span>")))
					.append("<div class='commentaryfragment-details-hidden' id='commentaryfragment-details-hidden-" + idOfLink + "'></div>"));
				addEventForCommentaryfragments(idOfLink,urlOfCommentaryfragment);
			}
		}
		if (configurationObject.object === "glosses"){
			let glosses = configurationObject.message;
			let numberOfItems = glosses._embedded.glosses.length;
			let message = "";
			if(numberOfItems === 0){
				message = "No glosses found";
			}
			if(numberOfItems === 1){
				message = "One glosse found";
			}
			if(numberOfItems > 1){
				message = numberOfItems + " glosses found";
			}
			$(divForMessage).append($("<p>" + message + "</p>"));
			for (let n = 0; n < glosses._embedded.glosses.length; n++){
				let attribution = glosses._embedded.glosses[n]["attribution"];
				let authorCritical = glosses._embedded.glosses[n]["author-critical"];
				let urlOfGloss = configurationObject.baseUrl + glosses._embedded.glosses[n]["_links"]["self"]["href"].substring("/psalmcatenae-server".length);
				let positionOfId = glosses._embedded.glosses[n]["_links"]["self"]["href"].lastIndexOf('/');
				let idOfLink = glosses._embedded.glosses[n]["_links"]["self"]["href"].substring(positionOfId + 1);
				$(divForItems).append(
					$("<div class='search-result-item'></div>").append(
					$("<a class='link-to-commentaryfragment' href='" + urlOfGloss + "' id='" + idOfLink + "'/>").append($("<span class='search-result-item-attribution'>" + attribution + " - " + authorCritical + "</span>")))
					.append("<div class='commentaryfragment-details-hidden' id='commentaryfragment-details-hidden-" + idOfLink + "'></div>"));
				addEventForGlosses(idOfLink,urlOfGloss);
			}
		}
		if (configurationObject.object === "hexaplaricVariants"){
			let hexaplaricVariants = configurationObject.message;
			console.log(hexaplaricVariants);
			let numberOfItems = hexaplaricVariants._embedded["hexaplaric-variants"].length;
			let message = "";
			if(numberOfItems === 0){
				message = "No hexaplaric variants found";
			}
			if(numberOfItems === 1){
				message = "One hexaplaric variant found";
			}
			if(numberOfItems > 1){
				message = numberOfItems + " hexaplaric variants found";
			}
			$(divForMessage).append($("<p>" + message + "</p>"));
			for (let n = 0; n < hexaplaricVariants._embedded["hexaplaric-variants"].length; n++){
				let attribution = hexaplaricVariants._embedded["hexaplaric-variants"][n]["attribution"];
				let urlOfHexaplaricVariant = configurationObject.baseUrl + hexaplaricVariants._embedded["hexaplaric-variants"][n]["_links"]["self"]["href"].substring("/psalmcatenae-server".length);
				let positionOfId = hexaplaricVariants._embedded["hexaplaric-variants"][n]["_links"]["self"]["href"].lastIndexOf('/');
				let idOfLink = hexaplaricVariants._embedded["hexaplaric-variants"][n]["_links"]["self"]["href"].substring(positionOfId + 1);
				$(divForItems).append(
					$("<div class='search-result-item'></div>").append(
					$("<a class='link-to-commentaryfragment' href='" + urlOfHexaplaricVariant + "' id='" + idOfLink + "'/>").append($("<span class='search-result-item-attribution'>" + attribution + "</span>")))
					.append("<div class='commentaryfragment-details-hidden' id='commentaryfragment-details-hidden-" + idOfLink + "'></div>"));
				addEventForHexaplaricVariants(idOfLink,urlOfHexaplaricVariant);
			}
		}
	}
	
	const addEventForCommentaryfragments = (id, urlOfCommentaryfragment, event = 'click') => {
		document.getElementById(id).addEventListener(event, function(event) {
			event.preventDefault();
			let idOfResultDiv = "commentaryfragment-details-hidden-" + id;
			let resultDiv = document.getElementById(idOfResultDiv);
			if($(resultDiv).hasClass("commentaryfragment-details-hidden")){
				axios({
					method: "get",
					url: urlOfCommentaryfragment,
					responseType: configurationObject.acceptMimeType
				})
				.then(function (response) {
					let commentaryfragment = JSON.parse(response.data);
					let commentaryfragmentText = commentaryfragment._embedded.commentaryfragment.text;
					$(resultDiv).text(commentaryfragmentText);
				})
				.catch(function (error) { console.log(error); });
				$(resultDiv).removeClass("commentaryfragment-details-hidden").addClass("commentaryfragment-details-visible");
			}
			else{
				$(resultDiv).removeClass("commentaryfragment-details-visible").addClass("commentaryfragment-details-hidden");
			}
	})};
	
	const addEventForGlosses = (id, urlOfGloss, event = 'click') => {
		document.getElementById(id).addEventListener(event, function(event) {
			event.preventDefault();
			let idOfResultDiv = "commentaryfragment-details-hidden-" + id;
			let resultDiv = document.getElementById(idOfResultDiv);
			if($(resultDiv).hasClass("commentaryfragment-details-hidden")){
				axios({
					method: "get",
					url: urlOfGloss,
					responseType: configurationObject.acceptMimeType
				})
				.then(function (response) {
					let gloss = JSON.parse(response.data);
					let glossText = gloss._embedded.glosse.text;
					$(resultDiv).text(glossText);
				})
				.catch(function (error) { console.log(error); });
				$(resultDiv).removeClass("commentaryfragment-details-hidden").addClass("commentaryfragment-details-visible");
			}
			else{
				$(resultDiv).removeClass("commentaryfragment-details-visible").addClass("commentaryfragment-details-hidden");
			}
	})};
	
	const addEventForHexaplaricVariants = (id, urlOfHexaplaricVariant, event = 'click') => {
		document.getElementById(id).addEventListener(event, function(event) {
			event.preventDefault();
			let idOfResultDiv = "commentaryfragment-details-hidden-" + id;
			let resultDiv = document.getElementById(idOfResultDiv);
			if($(resultDiv).hasClass("commentaryfragment-details-hidden")){
				axios({
					method: "get",
					url: urlOfHexaplaricVariant,
					responseType: configurationObject.acceptMimeType
				})
				.then(function (response) {
					let hexaplaricVariant = JSON.parse(response.data);
					let hexaplaricVariantText = hexaplaricVariant._embedded["hexaplaric-variant"].text;
					$(resultDiv).text(hexaplaricVariantText);
				})
				.catch(function (error) { console.log(error); });
				$(resultDiv).removeClass("commentaryfragment-details-hidden").addClass("commentaryfragment-details-visible");
			}
			else{
				$(resultDiv).removeClass("commentaryfragment-details-visible").addClass("commentaryfragment-details-hidden");
			}
	})};
	
	$("#search-submit").click(function(event){
		event.preventDefault();
		let selectedManuscript = document.getElementById("name-of-manuscript-select").selectedOptions[0].value;
		let commentaryfragmentsSelected = document.getElementById("commentaryfragment-radio").checked;
		let glossesSelected = document.getElementById("gloss-radio").checked;
		let hexaplaricVariantsSelected = document.getElementById("hexaplaric-variant-radio").checked;
		let psalmtextsSelected = document.getElementById("psalmtext-radio").checked;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		if (commentaryfragmentsSelected === true){
			configurationObject.object = "commentaryfragments";
			url = url + "/commentaryfragments";
		}
		if (glossesSelected === true){
			configurationObject.object = "glosses";
			url = url + "/glosses";
		}
		if (hexaplaricVariantsSelected === true){
			configurationObject.object = "hexaplaricVariants";
			url = url + "/hexaplaric-variants";
		}
		if (psalmtextsSelected === true){
			configurationObject.object = "psalmtexts";
			url = url + "/psalmtexts";
		}
		request(url,"get")
	});
	
	$("#gloss-radio").change(function(){
		let attributionField = document.getElementById("input-attribution");
		attributionField.disabled = true;
		let authorCriticalField = document.getElementById("input-author-critical");
		authorCriticalField.disabled = true;
		let psalmverseField = document.getElementById("psalmverse");
		psalmverseField.disabled = true;
	});
	
	$("#commentaryfragment-radio").change(function(){
		let attributionField = document.getElementById("input-attribution");
		attributionField.disabled = false;
		let authorCriticalField = document.getElementById("input-author-critical");
		authorCriticalField.disabled = false;
		let psalmverseField = document.getElementById("psalmverse");
		psalmverseField.disabled = false;
	});
	
	$("#hexaplaric-variant-radio").change(function(){
		let attributionField = document.getElementById("input-attribution");
		attributionField.disabled = true;
		let authorCriticalField = document.getElementById("input-author-critical");
		authorCriticalField.disabled = true;
		let psalmverseField = document.getElementById("psalmverse");
		psalmverseField.disabled = false;
	});
	
	$("#psalmtext-radio").change(function(){
		let attributionField = document.getElementById("input-attribution");
		attributionField.disabled = true;
		let authorCriticalField = document.getElementById("input-author-critical");
		authorCriticalField.disabled = true;
		let psalmverseField = document.getElementById("psalmverse");
		psalmverseField.disabled = false;
	});
	
	var that = {};
	that.initialize = initialize;
	return that;
}

window.onload = function(){
	let searchClient = jsonClient();
	searchClient.initialize("https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server","/manuscripts");
}