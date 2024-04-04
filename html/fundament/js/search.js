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
		if(configurationObject.object === "commentaryfragments" && configurationObject.mode === "form"){
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
			configureFormCommentaryfragmentsSubfields()
		}
		if(configurationObject.object === "glosses" && configurationObject.mode === "form"){
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
		}
		if(configurationObject.object === "hexaplaricvariants" && configurationObject.mode === "form"){
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
		}
	}
	
	function configureFormCommentaryfragmentsSubfields(){
		let selectedManuscript = document.getElementById("name-of-manuscript-select-form-commentaryfragments").selectedOptions[0].value;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		let urlAttribution = url + "/authors-distinct";
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
		let urlReference = url + "/references";
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
	
	$("#name-of-manuscript-select-form-commentaryfragments").on("change",function(){
		configureFormCommentaryfragmentsSubfields();
	});
	
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
	
	$("#search-submit").click(function(event){
		event.preventDefault();
		let selectedManuscript = document.getElementById("name-of-manuscript-select").selectedOptions[0].value;
		let commentaryfragmentsSelected = document.getElementById("commentaryfragment-radio").checked;
		let glossesSelected = document.getElementById("gloss-radio").checked;
		let hexaplaricVariantsSelected = document.getElementById("hexaplaric-variant-radio").checked;
		let psalmtextsSelected = document.getElementById("psalmtext-radio").checked;
		let inputSelected = document.getElementById("input-selected").checked;
		let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
		let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
		if (commentaryfragmentsSelected === true){
			configurationObject.object = "commentaryfragments";
			url = url + "/commentaryfragments";
			if (inputSelected === true){
				url = url + "/search";
				let attributionFieldValue = document.getElementById("input-attribution").value;
				let authorCriticalFieldValue = document.getElementById("input-author-critical").value;
				let psalmverseFieldValue = document.getElementById("psalmverse").value;
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
			}
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
	
	$("#gloss-radio").change(function(){
		let inputSelected = document.getElementById("input-selected").checked;
		if (inputSelected === true){
			$("#input-attribution").empty();
			$("#input-author-critical").empty();
			$("#psalmverse").empty();
			let attributionField = document.getElementById("input-attribution");
			attributionField.disabled = true;
			let authorCriticalField = document.getElementById("input-author-critical");
			authorCriticalField.disabled = true;
			let psalmverseField = document.getElementById("psalmverse");
			psalmverseField.disabled = true;
		}
	});
	
	$("#commentaryfragment-radio").change(function(){
		let inputSelected = document.getElementById("input-selected").checked;
		if (inputSelected === true){
			let attributionField = document.getElementById("input-attribution");
			attributionField.disabled = false;
			let authorCriticalField = document.getElementById("input-author-critical");
			authorCriticalField.disabled = false;
			let psalmverseField = document.getElementById("psalmverse");
			psalmverseField.disabled = false;
			let selectedManuscript = document.getElementById("name-of-manuscript-select").selectedOptions[0].value;
			let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
			let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
			let urlAttribution = url + "/authors-distinct";
			axios({
				method: "get",
				url: urlAttribution,
				responseType: configurationObject.acceptMimeType
			})
			.then(function (response){
				let authorsDistinct = JSON.parse(response.data);
				$("#input-attribution").empty();
				$("#input-attribution").append($("<option value='empty'>empty</option>"));
				for (let n = 0; n < authorsDistinct._embedded.authors.length; n++){
					let nameOfAuthor = authorsDistinct._embedded.authors[n]["author"];
					let optionAttributionAsText = "<option value='" + nameOfAuthor + "'>" + nameOfAuthor + "</option>";
					let optionAttributionAsObject = $(optionAttributionAsText);
					$("#input-attribution").append(optionAttributionAsObject);
				}
			})
			.catch(function (error) { console.log(error); });
			let urlAuthorCritical = url + "/authors-critical-distinct";
			axios({
			method: "get",
				url: urlAuthorCritical,
				responseType: configurationObject.acceptMimeType
			})
			.then(function (response){
				let authorsCriticalDistinct = JSON.parse(response.data);
				$("#input-author-critical").empty();
				$("#input-author-critical").append($("<option value='empty'>empty</option>"));
				for (let n = 0; n < authorsCriticalDistinct._embedded.authors.length; n++){
					let nameOfAuthorCritical = authorsCriticalDistinct._embedded.authors[n]["author-critical"];
					let optionAuthorCriticalAsText = "<option value='" + nameOfAuthorCritical + "'>" + nameOfAuthorCritical + "</option>";
					let optionAuthorCriticalAsObject = $(optionAuthorCriticalAsText);
					$("#input-author-critical").append(optionAuthorCriticalAsObject);
				}
			})
			.catch(function(error){ console.log(error); });
			let urlReference = url + "/references";
			axios({
				method: "get",
				url: urlReference,
				responseType: configurationObject.acceptMimeType
			})
			.then(function (response){
				let references = JSON.parse(response.data);
				$("#psalmverse").empty();
				$("#psalmverse").append($("<option value='empty'>empty</option>"));
				for (let n = 0; n < references._embedded.references.length; n++){
					let reference = references._embedded.references[n]["psalmverse"];
					let optionReferenceAsText = "<option value='" + reference + "'>" + reference + "</option>";
					let optionReferenceAsObject = $(optionReferenceAsText);
					$("#psalmverse").append(optionReferenceAsObject);
				}
			})
			.catch(function(error){ console.log(error); });
		}
	});
	
	$("#hexaplaric-variant-radio").change(function(){
		let inputSelected = document.getElementById("input-selected").checked;
		if (inputSelected === true){
			$("#input-attribution").empty();
			$("#input-author-critical").empty();
			$("#psalmverse").empty();
			let attributionField = document.getElementById("input-attribution");
			attributionField.disabled = true;
			let authorCriticalField = document.getElementById("input-author-critical");
			authorCriticalField.disabled = true;
			let psalmverseField = document.getElementById("psalmverse");
			psalmverseField.disabled = false;
			let selectedManuscript = document.getElementById("name-of-manuscript-select").selectedOptions[0].value;
			let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
			let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
			let urlReferences = url + "/hexaplaric-variants/references";
			axios({
				method: "get",
				url: urlReferences,
				responseType: configurationObject.acceptMimeType
			})
			.then(function (response){
				let referencesOfHexaplaricVariants = JSON.parse(response.data);
				$("#psalmverse").empty();
				$("#psalmverse").append($("<option value='empty'>empty</option>"));
				for (let n = 0; n < referencesOfHexaplaricVariants._embedded.references.length; n++){
					let nameOfPsalm = referencesOfHexaplaricVariants._embedded.references[n]["psalmverse"];
					let optionAttributionAsText = "<option value='" + nameOfPsalm + "'>" + nameOfPsalm + "</option>";
					let optionAttributionAsObject = $(optionAttributionAsText);
					$("#psalmverse").append(optionAttributionAsObject);
				}
			})
			.catch(function (error) { console.log(error); });
		}
	});
	
	$("#psalmtext-radio").change(function(){
		let inputSelected = document.getElementById("input-selected").checked;
		if (inputSelected === true){
			$("#input-attribution").empty();
			$("#input-author-critical").empty();
			$("#psalmverse").empty();
			let attributionField = document.getElementById("input-attribution");
			attributionField.disabled = true;
			let authorCriticalField = document.getElementById("input-author-critical");
			authorCriticalField.disabled = true;
			let psalmverseField = document.getElementById("psalmverse");
			psalmverseField.disabled = false;
		}
	});
	
	$("#input-selected").change(function(){
		let inputSelected = document.getElementById("input-selected").checked;
		let attributionField = document.getElementById("input-attribution");
		let authorCriticalField = document.getElementById("input-author-critical");
		let psalmverseField = document.getElementById("psalmverse");
		if (inputSelected === false){
			let attributionField = document.getElementById("input-attribution");
			let authorCriticalField = document.getElementById("input-author-critical");
			let psalmverseField = document.getElementById("psalmverse");
			$("#input-attribution").empty();
			$("#input-author-critical").empty();
			$("#psalmverse").empty();
			attributionField.disabled = true;
			authorCriticalField.disabled = true;
			psalmverseField.disabled = true;
		}
		if (inputSelected === true){
			let commentaryfragmentRadioChecked = document.getElementById("commentaryfragment-radio").checked;
			let glossesRadioChecked = document.getElementById("gloss-radio").checked;
			let hexaplaricVariantRadioChecked = document.getElementById("hexaplaric-variant-radio").checked;
			let psalmtextRadioChecked = document.getElementById("psalmtext-radio").checked;
			if (commentaryfragmentRadioChecked === true){
				attributionField.disabled = false;
				authorCriticalField.disabled = false;
				psalmverseField.disabled = false;
				let selectedManuscript = document.getElementById("name-of-manuscript-select").selectedOptions[0].value;
				let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
				let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
				let urlAttribution = url + "/authors-distinct";
				axios({
					method: "get",
					url: urlAttribution,
					responseType: configurationObject.acceptMimeType
				})
				.then(function (response){
					let authorsDistinct = JSON.parse(response.data);
					$("#input-attribution").empty();
					$("#input-attribution").append($("<option value='empty'>empty</option>"));
					for (let n = 0; n < authorsDistinct._embedded.authors.length; n++){
						let nameOfAuthor = authorsDistinct._embedded.authors[n]["author"];
						let optionAttributionAsText = "<option value='" + nameOfAuthor + "'>" + nameOfAuthor + "</option>";
						let optionAttributionAsObject = $(optionAttributionAsText);
						$("#input-attribution").append(optionAttributionAsObject);
					}
				})
				.catch(function (error) { console.log(error); });
				let urlAuthorCritical = url + "/authors-critical-distinct";
				axios({
					method: "get",
					url: urlAuthorCritical,
					responseType: configurationObject.acceptMimeType
				})
				.then(function (response){
					let authorsCriticalDistinct = JSON.parse(response.data);
					$("#input-author-critical").empty();
					$("#input-author-critical").append($("<option value='empty'>empty</option>"));
					for (let n = 0; n < authorsCriticalDistinct._embedded.authors.length; n++){
						let nameOfAuthorCritical = authorsCriticalDistinct._embedded.authors[n]["author-critical"];
						let optionAuthorCriticalAsText = "<option value='" + nameOfAuthorCritical + "'>" + nameOfAuthorCritical + "</option>";
						let optionAuthorCriticalAsObject = $(optionAuthorCriticalAsText);
						$("#input-author-critical").append(optionAuthorCriticalAsObject);
					}
				})
				.catch(function(error){ console.log(error); });
				let urlReference = url + "/references";
				axios({
					method: "get",
					url: urlReference,
					responseType: configurationObject.acceptMimeType
				})
				.then(function (response){
					let references = JSON.parse(response.data);
					$("#psalmverse").empty();
					$("#psalmverse").append($("<option value='empty'>empty</option>"));
					for (let n = 0; n < references._embedded.references.length; n++){
						let reference = references._embedded.references[n]["psalmverse"];
						let optionReferenceAsText = "<option value='" + reference + "'>" + reference + "</option>";
						let optionReferenceAsObject = $(optionReferenceAsText);
						$("#psalmverse").append(optionReferenceAsObject);
					}
				})
				.catch(function(error){ console.log(error); });
			}
			if (glossesRadioChecked === true){
				attributionField.disabled = true;
				authorCriticalField.disabled = true;
				psalmverseField.disabled = true;
			}
			if (hexaplaricVariantRadioChecked === true){
				attributionField.disabled = true;
				authorCriticalField.disabled = true;
				psalmverseField.disabled = false;
				let selectedManuscript = document.getElementById("name-of-manuscript-select").selectedOptions[0].value;
				let manuscriptPath = configurationObject.manuscriptPaths.get(selectedManuscript);
				let url = configurationObject.baseUrl + "/manuscripts/" + manuscriptPath;
				let urlReferences = url + "/hexaplaric-variants/references";
				axios({
					method: "get",
					url: urlReferences,
					responseType: configurationObject.acceptMimeType
				})
				.then(function (response){
					let referencesOfHexaplaricVariants = JSON.parse(response.data);
					$("#psalmverse").empty();
					$("#psalmverse").append($("<option value='empty'>empty</option>"));
					for (let n = 0; n < referencesOfHexaplaricVariants._embedded.references.length; n++){
						let nameOfPsalm = referencesOfHexaplaricVariants._embedded.references[n]["psalmverse"];
						let optionAttributionAsText = "<option value='" + nameOfPsalm + "'>" + nameOfPsalm + "</option>";
						let optionAttributionAsObject = $(optionAttributionAsText);
						$("#psalmverse").append(optionAttributionAsObject);
					}
				})
				.catch(function (error) { console.log(error); });
			}
			if (psalmtextRadioChecked === true){
				attributionField.disabled = true;
				authorCriticalField.disabled = true;
				psalmverseField.disabled = false;
			}
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