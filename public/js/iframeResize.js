var script = document.createElement('script');
script.src = 'http://code.jquery.com/jquery-1.11.0.min.js';
script.type = 'text/javascript';
document.getElementsByTagName('head')[0].appendChild(script);

function getDocWidth() {
    var D = document;
    return Math.max(
    Math.max(D.body.scrollWidth, D.documentElement.scrollWidth),
    Math.max(D.body.offsetWidth, D.documentElement.offsetWidth),
    Math.max(D.body.clientWidth, D.documentElement.clientWidth)
    );
}
function getDocHeight() {
    var D = document;
    return Math.max(
    Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
    Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
    Math.max(D.body.clientHeight, D.documentElement.clientHeight)
    );
}

var isFullScreen = false;
var orgDimensions = new Array();

function toggleFullScreen() {
    var div = document.getElementById("templateData");
    var ifr = document.getElementById("builderIFrame");
    var parent =ifr.parentNode.parentNode;
    if (!isFullScreen) {
        div.style.display = 'none';
        orgDimensions[0] = ifr.style.width;
        orgDimensions[1] = ifr.style.height;
        orgParentWidth = parent.style.width;
        var size = parseInt(ifr.style.width);
        ifr.style.width = (size * 2) + "px";
        parent.style.width = (getDocWidth() - 185) + "px";
    }
    else {
        div.style.display = 'block';
        ifr.style.width = orgDimensions[0];
        ifr.style.height = orgDimensions[1];
        parent.style.width = orgParentWidth;
    }
    isFullScreen = !isFullScreen;
}