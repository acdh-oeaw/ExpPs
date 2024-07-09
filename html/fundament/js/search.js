function jsonClient(){
	let configurationObject = {};
	configurationObject.baseUrl = '';
	configurationObject.url = '';
	configurationObject.message = {};
	configurationObject.object = "commentaryfragments";
	configurationObject.mode = "form";
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
				configurationObject.object = "commentaryfragments";
				configurationObject.mode = "form";
			}
		}
	}
	
	function processMessage(){
		configureForm();
		setItems()
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
		if((configurationObject.object === "commentaryfragments") && (configurationObject.mode === "form")){
			let listOfManuscripts = configurationObject.message;
			let namesOfManuscriptsAndPath = new Map();
			$("#name-of-manuscript-select-form-commentaryfragments").empty();
			for (let n = 0; n < listOfManuscripts._embedded.manuscripts.length; n++){
				let nameOfManuscript = listOfManuscripts._embedded.manuscripts[n]["manuscript-name"];
				let optionAsText = "<option value='" + nameOfManuscript + "'>" + nameOfManuscript + "</option>";
				let optionAsObject = $(optionAsText);
				$('#name-of-manuscript-select-form-commentaryfragments').append(optionAsObject);
				let pathOfManuscript = listOfManuscripts._embedded.manuscripts[n]["manuscript-path"];
				namesOfManuscriptsAndPath.set(nameOfManuscript,pathOfManuscript);
			}
			configurationObject.manuscriptPaths = namesOfManuscriptsAndPath;
			configureFormCommentaryfragmentsSubfields();
		}
		if((configurationObject.object === "glosses") && (configurationObject.mode === "form")){
			let listOfManuscripts = configurationObject.message;
			let namesOfManuscriptsAndPath = new Map();
			$("#name-of-manuscript-select-form-glosses").empty();
			for (let n = 0; n < listOfManuscripts._embedded.manuscripts.length; n++){
				let nameOfManuscript = listOfManuscripts._embedded.manuscripts[n]["manuscript-name"];
				let optionAsText = "<option value='" + nameOfManuscript + "'>" + nameOfManuscript + "</option>";
				let optionAsObject = $(optionAsText);
				$('#name-of-manuscript-select-form-glosses').append(optionAsObject);
				let pathOfManuscript = listOfManuscripts._embedded.manuscripts[n]["manuscript-path"];
				namesOfManuscriptsAndPath.set(nameOfManuscript,pathOfManuscript);
			}
			configurationObject.manuscriptPaths = namesOfManuscriptsAndPath;
			configureFormGlossesSubfields();
		}
		if((configurationObject.object === "hexaplaricvariants") && (configurationObject.mode === "form")){
			let listOfManuscripts = configurationObject.message;
			let namesOfManuscriptsAndPath = new Map();
			$("#name-of-manuscript-select-form-hexaplaric-variants").empty();
			for (let n = 0; n < listOfManuscripts._embedded.manuscripts.length; n++){
				let nameOfManuscript = listOfManuscripts._embedded.manuscripts[n]["manuscript-name"];
				let optionAsText = "<option value='" + nameOfManuscript + "'>" + nameOfManuscript + "</option>";
				let optionAsObject = $(optionAsText);
				$('#name-of-manuscript-select-form-hexaplaric-variants').append(optionAsObject);
				let pathOfManuscript = listOfManuscripts._embedded.manuscripts[n]["manuscript-path"];
				namesOfManuscriptsAndPath.set(nameOfManuscript,pathOfManuscript);
			}
			configurationObject.manuscriptPaths = namesOfManuscriptsAndPath;
			configureFormHexaplaricVariantsSubfields();
		}
	}
	
	function configureFormCommentaryfragmentsSubfields(){
		let selectedManuscript = document.getElementById("name-of-manuscript-select-form-commentaryfragments").selectedOptions[0].value;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		let urlAttribution = url + "/commentaryfragments/authors-distinct";
		axios({
			method: "get",
			url: urlAttribution,
			responseType: configurationObject.acceptMimeType
		})
		.then(function (response){
			let authorsDistinct = JSON.parse(response.data);
			$("#input-attribution-form-commentaryfragments").empty();
			$("#input-attribution-form-commentaryfragments").append($("<option value='empty'>empty</option>"));
			for (let n = 0; n < authorsDistinct._embedded.authors.length; n++){
				let nameOfAuthor = authorsDistinct._embedded.authors[n]["author"];
				let optionAttributionAsText = "<option value='" + nameOfAuthor + "'>" + nameOfAuthor + "</option>";
				let optionAttributionAsObject = $(optionAttributionAsText);
				$("#input-attribution-form-commentaryfragments").append(optionAttributionAsObject);
			}
		})
		.catch(function (error) { console.log(error); });
		
		let urlAuthorsCriticalNormalized = url + "/commentaryfragments/authors-critical-normalized";
		axios({
			method: "get",
			url: urlAuthorsCriticalNormalized,
			responseType: configurationObject.acceptMimeType
		})
		.then(function (response){
			let authorsCriticalNormalized = JSON.parse(response.data);
			$("#input-author-critical-form-commentaryfragments").empty();
			$("#input-author-critical-form-commentaryfragments").append($("<option value='empty'>empty</option>"));
			for (let n = 0; n < authorsCriticalNormalized._embedded["authors-critical-normalized"].length; n++){
				let nameOfAuthorCriticalNormalized = authorsCriticalNormalized._embedded["authors-critical-normalized"][n]["author-critical-normalized"];
				let optionAuthorCriticalAsText = "<option value = '" + nameOfAuthorCriticalNormalized + "'>" + nameOfAuthorCriticalNormalized + "</option>";
				let optionAuthorCriticalAsObject = $(optionAuthorCriticalAsText);
				$("#input-author-critical-form-commentaryfragments").append(optionAuthorCriticalAsObject);
			}
		})
		.catch(function (error) { console.log(error); });
		
		let urlReference = url + "/commentaryfragments/references";
		axios({
			method: "get",
			url: urlReference,
			responseType: configurationObject.acceptMimeType
		})
		.then(function (response){
			let references = JSON.parse(response.data);
			$("#psalmverse-form-commentaryfragments").empty();
			$("#psalmverse-form-commentaryfragments").append($("<option value='empty'>empty</option>"));
			for (let n = 0; n < references._embedded.references.length; n++){
				let reference = references._embedded.references[n]["psalmverse"];
				let optionReferenceAsText = "<option value='" + reference + "'>" + reference + "</option>";
				let optionReferenceAsObject = $(optionReferenceAsText);
				$("#psalmverse-form-commentaryfragments").append(optionReferenceAsObject);
			}
		})
		.catch(function(error){ console.log(error); });
	}
	
	function configureFormGlossesSubfields(){
		let selectedManuscript = document.getElementById("name-of-manuscript-select-form-glosses").selectedOptions[0].value;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		let urlAttribution = url + "/glosses/authors-distinct";
		axios({
			method: "get",
			url: urlAttribution,
			responseType: configurationObject.acceptMimeType
		})
		.then(function (response){
			let authorsDistinct = JSON.parse(response.data);
			$("#input-attribution-form-glosses").empty();
			$("#input-attribution-form-glosses").append($("<option value='empty'>empty</option>"));
			for (let n = 0; n < authorsDistinct._embedded.authors.length; n++){
				let nameOfAuthor = authorsDistinct._embedded.authors[n]["author"];
				let optionAttributionAsText = "<option value='" + nameOfAuthor + "'>" + nameOfAuthor + "</option>";
				let optionAttributionAsObject = $(optionAttributionAsText);
				$("#input-attribution-form-glosses").append(optionAttributionAsObject);
			}
		})
		.catch(function (error) { console.log(error); });
		
		let urlAuthorsCriticalNormalized = url + "/glosses/authors-critical-normalized";
		axios({
			method: "get",
			url: urlAuthorsCriticalNormalized,
			responseType: configurationObject.acceptMimeType
		})
		.then(function (response){
			let authorsCriticalNormalized = JSON.parse(response.data);
			$("#input-author-critical-form-glosses").empty();
			$("#input-author-critical-form-glosses").append($("<option value='empty'>empty</option>"));
			for (let n = 0; n < authorsCriticalNormalized._embedded["authors-critical-normalized"].length; n++){
				let authorCriticalNormalized = authorsCriticalNormalized._embedded["authors-critical-normalized"][n]["author-critical-normalized"];
				let optionAuthorCriticalAsText = "<option value='" + authorCriticalNormalized + "'>" + authorCriticalNormalized + "</option>";
				let optionAuthorCriticalAsObject = $(optionAuthorCriticalAsText);
				$("#input-author-critical-form-glosses").append(optionAuthorCriticalAsObject);
			}
		})
		.catch(function (error) { console.log(error); });
		
		let urlReference = url + "/glosses/references";
		axios({
			method: "get",
			url: urlReference,
			responseType: configurationObject.acceptMimeType
		})
		.then(function (response){
			let references = JSON.parse(response.data);
			$("#psalmverse-form-glosses").empty();
			$("#psalmverse-form-glosses").append($("<option value='empty'>empty</option>"));
			for (let n = 0; n < references._embedded.references.length; n++){
				let reference = references._embedded.references[n]["psalmverse"];
				let optionReferenceAsText = "<option value='" + reference + "'>" + reference + "</option>";
				let optionReferenceAsObject = $(optionReferenceAsText);
				$("#psalmverse-form-glosses").append(optionReferenceAsObject);
			}
		})
		.catch(function(error){ console.log(error); });
	}
	
	function configureFormHexaplaricVariantsSubfields(){
		let selectedManuscript = document.getElementById("name-of-manuscript-select-form-hexaplaric-variants").selectedOptions[0].value;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		let urlReference = url + "/hexaplaric-variants/references";
		axios({
			method: "get",
			url: urlReference,
			responseType: configurationObject.acceptMimeType
		})
		.then(function (response){
			let references = JSON.parse(response.data);
			$("#psalmverse-form-hexaplaric-variants").empty();
			$("#psalmverse-form-hexaplaric-variants").append($("<option value='empty'>empty</option>"));
			for (let n = 0; n < references._embedded.references.length; n++){
				let reference = references._embedded.references[n]["psalmverse"];
				let optionReferenceAsText = "<option value='" + reference + "'>" + reference + "</option>";
				let optionReferenceAsObject = $(optionReferenceAsText);
				$("#psalmverse-form-hexaplaric-variants").append(optionReferenceAsObject);
			}
		})
		.catch(function(error){ console.log(error); });
	}
	
	$("#name-of-manuscript-select-form-commentaryfragments").on("change",function(){
		configureFormCommentaryfragmentsSubfields();
	});
	
	$("#name-of-manuscript-select-form-glosses").on("change",function(){
		configureFormGlossesSubfields();
	});
	
	$("#name-of-manuscript-select-form-hexaplaric-variants").on("change",function(){
		configureFormHexaplaricVariantsSubfields();
	});
	
	function setItems(){
		let divForMessage = document.getElementById("search-result-messages");
		let divForItems = document.getElementById("search-result-content");
		$(divForMessage).empty();
		$(divForItems).empty();
		if ((configurationObject.object === "commentaryfragments") && (configurationObject.mode === "data")){
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
		if ((configurationObject.object === "searchResults") && (configurationObject.mode === "data")){
			let segments = configurationObject.message;
			let searchString = segments.searchstring;
			$(divForMessage).append($("<p>" + searchString + "</p>"));
			for (let n = 0; n < segments._embedded.length; n++){
				let typeOfSegment = segments._embedded[n]._embedded.type;
				if (typeOfSegment === 'commentaryfragment'){
					let commentaryfragment = segments._embedded[n]._embedded.data;
					let attribution = commentaryfragment.commentaryfragment.attribution;
					let source = commentaryfragment.commentaryfragment.source;
					let textOfCommentaryfragment = commentaryfragment.commentaryfragment.text;
					let textOfCommentaryfragmentHighlighted = textOfCommentaryfragment.replace(
						new RegExp(searchString,'gi'),'<span style="background-color: #ffc107;">$&</span>');
					$(divForItems).append(
					$("<div class='search-result-item'></div>").append(
					$("<p>" + "Commentary fragment: " + "<b>" + attribution + " - " + source + "</b></p>")
					).append(
					$("<p>" + textOfCommentaryfragmentHighlighted + "</p>")
					));
				}
				if (typeOfSegment === 'glosse'){
					let glosse = segments._embedded[n]._embedded.data;
					let attribution = glosse.glosse.attribution;
					let source = glosse.glosse.source;
					let textOfGlosse = glosse.glosse.text;
					let textOfGlosseHighlighted = textOfGlosse.replace(
						new RegExp(searchString,'gi'),'<span style="background-color: #ffc107;">$&</span>');
					$(divForItems).append(
					$("<div class='search-result-item'></div>").append(
					$("<p>" + "Glosse: " + "<b>" + attribution + " - " + source + "</b></p>")
					).append(
					$("<p>" + textOfGlosseHighlighted + "</p>")
					));
				}
				if (typeOfSegment === 'hexaplaric'){
					let hexaplaricVariant = segments._embedded[n]._embedded.data;
					let attribution = hexaplaricVariant["hexaplaric-variant"].attribution;
					let textOfHexaplaricVariant = hexaplaricVariant["hexaplaric-variant"].text;
					let textOfHexaplaricVariantHighlighted = textOfHexaplaricVariant.replace(
						new RegExp(searchString,'gi'),'<span style="background-color: #ffc107;">$&</span>');
					$(divForItems).append(
					$("<div class='search-result-item'></div>").append(
					$("<p>" + "Hexaplaric variant: " + "<b>" + attribution + "</b></p>")
					).append(
					$("<p>" + textOfHexaplaricVariantHighlighted + "</p>")
					));
				}
			}
		}
		if ((configurationObject.object === "glosses") && (configurationObject.mode === "data")){
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
		if ((configurationObject.object === "hexaplaricVariants") && (configurationObject.mode === "data")){
			let hexaplaricVariants = configurationObject.message;
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
				let attribution = hexaplaricVariants._embedded["hexaplaric-variants"][n]["critical-attribution"];
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
					let commentaryfragmentId = commentaryfragment._embedded.commentaryfragment.id;
					let commentaryfragmentManuscript = commentaryfragment._links.manuscript["manuscript-identifier"];
					let urlOfCommentaryfragment = commentaryfragment._links.self.href;
					let urlFragmentForLinkToTranscription = '';
					if (urlOfCommentaryfragment.includes('vat-gr-754')){ urlFragmentForLinkToTranscription = 'vat_gr_754.html'; }
					else if (urlOfCommentaryfragment.includes('ambr-b-106-sup')){ urlFragmentForLinkToTranscription = 'ambros_B_106_sup.html'; }
					else if (urlOfCommentaryfragment.includes('ambr-m-47-sup')){ urlFragmentForLinkToTranscription = 'ambr_m_47_sup.html'; }
					else if (urlOfCommentaryfragment.includes('athen-b-n-8')){ urlFragmentForLinkToTranscription = 'athen_b_n_8.html'; }
					else if (urlOfCommentaryfragment.includes('bodl-auct-d-4-1')){ urlFragmentForLinkToTranscription = 'bodl_auct_d_4_1.html'; }
					else if (urlOfCommentaryfragment.includes('coislin-10')){ urlFragmentForLinkToTranscription = 'coislin_10.html'; }
					else if (urlOfCommentaryfragment.includes('coislin-12')){ urlFragmentForLinkToTranscription = 'coislin_12.html'; }
					else if (urlOfCommentaryfragment.includes('coislin-187')){ urlFragmentForLinkToTranscription = 'coislin-187.html'; }
					else if (urlOfCommentaryfragment.includes('franzon-3')){ urlFragmentForLinkToTranscription = 'franzon_3.html'; }
					else if (urlOfCommentaryfragment.includes('mosq-syn-194')){ urlFragmentForLinkToTranscription = 'mosq_syn_194.html'; }
					else if (urlOfCommentaryfragment.includes('oxon-s-trin-78')){ urlFragmentForLinkToTranscription = 'oxon_s_trin_78.html'; }
					else if (urlOfCommentaryfragment.includes('par-gr-139')){ urlFragmentForLinkToTranscription = 'par_gr_139.html'; }
					else if (urlOfCommentaryfragment.includes('par-gr-164')){ urlFragmentForLinkToTranscription = 'par_gr_164.html'; }
					else if (urlOfCommentaryfragment.includes('par-gr-166')){ urlFragmentForLinkToTranscription = 'par_gr_166.html'; }
					else if (urlOfCommentaryfragment.includes('plut-5-30')){ urlFragmentForLinkToTranscription = 'plut_5_30.html'; }
					else if (urlOfCommentaryfragment.includes('plut-6-3')){ urlFragmentForLinkToTranscription = 'plut_6_3.html'; }
					else if (urlOfCommentaryfragment.includes('vat-gr-1422')){ urlFragmentForLinkToTranscription = 'vat_gr_1422.html'; }
					let linkToTranscription = "./manuscripts/" + urlFragmentForLinkToTranscription + "#" + commentaryfragmentId;
					let idOfFirstButton = "buttonForId" + commentaryfragmentId;
					let idOfSecondButton = "buttonForURL" + commentaryfragmentId;
					let idOfThirdButton = "buttonForQuote" + commentaryfragmentId;
					$(resultDiv).append("<p class='search-result-item-commentaryfragment'>" + commentaryfragmentText + "</p>")
						.append("<p class='search-result-item-link-to-transcription'><a target='_blank' href='" + linkToTranscription + "'>→ " + commentaryfragmentManuscript + "</a></p>")
						.append("<p class='search-result-item-details'><button type='button' id='" + idOfFirstButton + "' class='btn btn-sm btn-outline-dark' data-toggle='popover' title='Identifier:' data-placement='bottom' data-content='" + commentaryfragmentId + "'>Id</button> <button type='button' id='" + idOfSecondButton + "' class='btn btn-sm btn-outline-dark' data-toggle='popover' data-placement='bottom' title='URL: ' data-content='https://expps.acdh-dev.oeaw.ac.at" + urlOfCommentaryfragment + "'>URL</button> <button type='button' id='" + idOfThirdButton + "' class='btn btn-sm btn-outline-dark' data-toggle='popover' data-placement='bottom' title='Quotation: ' data-content='Heil, Uta; Panthegini, Sebastiano, Transcription of " + commentaryfragmentManuscript + ". Fragment " + commentaryfragmentId + ", URL: https://expps.acdh-dev.oeaw.ac.at" + urlOfCommentaryfragment + ".'>Quote</button></p>");
					$(function(){ $("#" + idOfFirstButton).popover() })
					$(function(){ $("#" + idOfSecondButton).popover() })
					$(function(){ $("#" + idOfThirdButton).popover() })
					
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
	
	$("#search-commentaryfragments-submit").click(function(event){
		event.preventDefault();
		let selectedManuscript = document.getElementById("name-of-manuscript-select-form-commentaryfragments").selectedOptions[0].value;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		configurationObject.object = "commentaryfragments";
		configurationObject.mode = "data";
		url = url + "/commentaryfragments";
		url = url + "/search";
		let attributionFieldValue = document.getElementById("input-attribution-form-commentaryfragments").value;
		let authorCriticalFieldValue = document.getElementById("input-author-critical-form-commentaryfragments").value;
		let psalmverseFieldValue = document.getElementById("psalmverse-form-commentaryfragments").value;
		if (attributionFieldValue != "empty"){
			url = url + "?author=" + attributionFieldValue;
		}
		if (authorCriticalFieldValue != "empty"){
			if (attributionFieldValue === "empty"){
				url = url + "?author-critical=" + authorCriticalFieldValue;
			}
			else{
				url = url + "&author-critical=" + authorCriticalFieldValue;
			}
		}
		if (psalmverseFieldValue != "empty"){
			if (attributionFieldValue === "empty" && authorCriticalFieldValue === "empty"){
				url = url + "?reference=" + psalmverseFieldValue;
			}
			else{
				url = url + "&reference=" + psalmverseFieldValue;
			}
		}
		request(url,"get");
	});
	
	$("#search-glosses-submit").click(function(event){
		event.preventDefault();
		let selectedManuscript = document.getElementById("name-of-manuscript-select-form-commentaryfragments").selectedOptions[0].value;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		configurationObject.object = "glosses";
		configurationObject.mode = "data";
		url = url + "/glosses";
		url = url + "/search";
		let attributionFieldValue = document.getElementById("input-attribution-form-glosses").value;
		let authorCriticalFieldValue = document.getElementById("input-author-critical-form-glosses").value;
		let psalmverseFieldValue = document.getElementById("psalmverse-form-glosses").value;
		if (attributionFieldValue != "empty"){
			url = url + "?author=" + attributionFieldValue;
		}
		if (authorCriticalFieldValue != "empty"){
			if (attributionFieldValue === "empty"){
				url = url + "?author-critical=" + authorCriticalFieldValue;
			}
			else{
				url = url + "&author-critical=" + authorCriticalFieldValue;
			}
		}
		if (psalmverseFieldValue != "empty"){
			if (attributionFieldValue === "empty" && authorCriticalFieldValue === "empty"){
				url = url + "?reference=" + psalmverseFieldValue;
			}
			else{
				url = url + "&reference=" + psalmverseFieldValue;
			}
		}
		request(url,"get");
	});
	
	$("#search-hexaplaric-variants-submit").click(function(event){
		event.preventDefault();
		let selectedManuscript = document.getElementById("name-of-manuscript-select-form-commentaryfragments").selectedOptions[0].value;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		configurationObject.object = "hexaplaricVariants";
		configurationObject.mode = "data";
		url = url + "/hexaplaric-variants";
		url = url + "/search";
		let psalmverseFieldValue = document.getElementById("psalmverse-form-hexaplaric-variants").value;
		if (psalmverseFieldValue != "empty"){
			url = url + "?reference=" + psalmverseFieldValue;
		}
		request(url,"get");
	});
	
	$("#search-full-text-submit").click(function(event){
		event.preventDefault();
		let searchString = document.getElementById("full-text-search-input").value;
		let url = configurationObject.baseUrl + "/manuscripts/search?searchstring=" + searchString;
		configurationObject.object = "searchResults";
		configurationObject.mode = "data";
		request(url,"get");
	});
	
	$("#commentary-fragments-tab").bind('click',function(){
		configurationObject.object = "commentaryfragments";
		request(configurationObject.baseUrl + "/manuscripts","get");
		configurationObject.mode = "form";
	});
	
	$("#glosses-tab").bind('click',function(){
		configurationObject.object = "glosses";
		request(configurationObject.baseUrl + "/manuscripts","get");
		configurationObject.mode = "form";
	});
	
	$("#hexaplaric-variants-tab").bind('click',function(){
		configurationObject.object = "hexaplaricvariants";
		request(configurationObject.baseUrl + "/manuscripts","get");
		configurationObject.mode = "form";
	});
	
	$("#enable-psalmverse-range-commentaryfragments").change(function(){
		let isChecked = document.getElementById("enable-psalmverse-range-commentaryfragments").checked;
		if (isChecked === true){
			let fromField = document.getElementById("psalmverse-from-value-form-commentaryfragments");
			fromField.disabled = false;
			let toField = document.getElementById("psalmverse-to-value-form-commentaryfragments");
			toField.disabled = false;
			let psalmverseField = document.getElementById("psalmverse-form-commentaryfragments");
			psalmverseField.disabled = true;
		}
		if (isChecked === false){
			let fromField = document.getElementById("psalmverse-from-value-form-commentaryfragments");
			fromField.disabled = true;
			let toField = document.getElementById("psalmverse-to-value-form-commentaryfragments");
			toField.disabled = true;
			let psalmverseField = document.getElementById("psalmverse-form-commentaryfragments");
			psalmverseField.disabled = false;
		}
	});
	
	$("#enable-psalmverse-range-glosses").change(function(){
		let isChecked = document.getElementById("enable-psalmverse-range-glosses").checked;
		if (isChecked === true){
			let fromField = document.getElementById("psalmverse-from-value-form-glosses");
			fromField.disabled = false;
			let toField = document.getElementById("psalmverse-to-value-form-glosses");
			toField.disabled = false;
			let psalmverseField = document.getElementById("psalmverse-form-glosses");
			psalmverseField.disabled = true;
		}
		if (isChecked === false){
			let fromField = document.getElementById("psalmverse-from-value-form-glosses");
			fromField.disabled = true;
			let toField = document.getElementById("psalmverse-to-value-form-glosses");
			toField.disabled = true;
			let psalmverseField = document.getElementById("psalmverse-form-glosses");
			psalmverseField.disabled = false;
		}
	});
	
	$("#enable-psalmverse-range-hexaplaric-variants").change(function(){
		let isChecked = document.getElementById("enable-psalmverse-range-hexaplaric-variants").checked;
		if (isChecked === true){
			let fromField = document.getElementById("psalmverse-from-value-form-hexaplaric-variants");
			fromField.disabled = false;
			let toField = document.getElementById("psalmverse-to-value-form-hexaplaric-variants");
			toField.disabled = false;
			let psalmverseField = document.getElementById("psalmverse-form-hexaplaric-variants");
			psalmverseField.disabled = true;
		}
		if (isChecked === false){
			let fromField = document.getElementById("psalmverse-from-value-form-hexaplaric-variants");
			fromField.disabled = true;
			let toField = document.getElementById("psalmverse-to-value-form-hexaplaric-variants");
			toField.disabled = true;
			let psalmverseField = document.getElementById("psalmverse-form-hexaplaric-variants");
			psalmverseField.disabled = false;
		}
	});
	
	var that = {};
	that.initialize = initialize;
	return that;
}

window.onload = function(){
	let searchClient = jsonClient();
	searchClient.initialize("https://expps.acdh-dev.oeaw.ac.at/psalmcatenae-server","/manuscripts");
}