(function() {
	"use strict";
	var doc = window.document;

	function findScriptNode() {
		var scripts,
			result = doc.currentScript;
		if (!result) {
			scripts = doc.getElementsByTagName('script');
			result = scripts[scripts.length - 1];
		}
		return result;
	}

	function createImage() {
		var SIZE = '300x250';
		var widthHeight = SIZE.split('x');
		var result = doc.createElement('img');
		result.src = 'https://static.adsafeprotected.com/IAS_PassbackAds_300x250.png';
		result.width = widthHeight[0];
		result.height = widthHeight[1];
		return result;
	}

	function findClickMacro(thisScriptNode) {
		var result, parsed;
		var rjssScript = thisScriptNode.previousSibling;

		// TODO: there's probably a more elegant way to write this
		while (rjssScript) {
			if (rjssScript.src && typeof rjssScript.src === 'string') {
				parsed = /ias_pb_click=([^&]+)/.exec(rjssScript.src);
				if (parsed && parsed[1]) {
					result = parsed[1];
					break;
				} else {
					rjssScript = rjssScript.previousSibling; // set to null when we run out of nodes
				}
			} else {
				rjssScript = rjssScript.previousSibling; // set to null when we run out of nodes
			}
		}

		return result;
	}

	function createAnchor(thisScriptNode) {
		var clickMacro = findClickMacro(thisScriptNode);
		var macroIsExpanded = typeof clickMacro === 'string' && clickMacro.indexOf('http') === 0;
		var LANDING_PAGE = 'https://go.integralads.com/ad-blocking-explainer/?utm_campaign=GLB-g&utm_medium=gdisplay&utm_source=gsites';
		var result = doc.createElement('a');
		result.href = (clickMacro && macroIsExpanded) ? decodeURIComponent(clickMacro) + encodeURIComponent(LANDING_PAGE) : LANDING_PAGE;
		result.target = '_blank';
		return result;
	}

	function loadBeacon(url) {
		if (url) {
			var img = new Image();
			img.src = url;
		}
	}

	function appendTag(thisScriptNode) {
		var img = createImage();
		var a = createAnchor(thisScriptNode);
		a.appendChild(img);
		thisScriptNode.parentNode.insertBefore(a, thisScriptNode);
		if (Math.random() <= 0.01) {
			loadBeacon('https://pixel.adsafeprotected.com/mon?anId=927087&advId=house-ad&campId=gdn&pubId=300x250&chanId=2' + getLoc());
			loadBeacon('');	
		}
	}

	function sendDiag(e) {
		try {
			var url = 'https://pixel.adsafeprotected.com/mon?anid=925116&advId=housead&campId=gdn&adsafe_jsinfo=';
			if (e && e.message) {
				url += 'derr:' + encodeURIComponent(e.message.toString().replace(/ /g, '-')).substring(0, 200);
			}
			url += ',dconfig:300x250';
			loadBeacon(url);
		} catch(err) {}
	}

	function getLoc() {
		var loc, ao, type;
		var result = '';
		try {
			loc = top.location.href;
			type = 'a';
		} catch(e) {}
		if (!loc && window.location.ancestorOrigins) {
			ao = window.location.ancestorOrigins;
			loc = ao[ao.length - 1];
			type = 'g';
		}
		if (loc) {
			result = '&adsafe_url=' + encodeURIComponent(loc) + '&adsafe_type=' + type;
		}
		return result;
	}

	try {
		appendTag(findScriptNode());
	} catch(e) {
		sendDiag(e);
	}

})();