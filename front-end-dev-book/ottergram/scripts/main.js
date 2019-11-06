'use strict';
var DETAIL_IMAGE_SELECTOR = '[data-image-role="target"]';
var DETAIL_TITLE_SELECTOR = '[data-image-role="title"]';
var THUMBNAIL_LINK_SELECTOR = '[data-image-role="trigger"]';


function setDetails(imageUrl, titleText){
    var detailImage = document.querySelector(DETAIL_IMAGE_SELECTOR);
    detailImage.setAttribute('src',imageUrl);

    var detailTitle = document.querySelector(DETAIL_TITLE_SELECTOR);
    detailTitle.textContent = titleText;
}

function imageFromThumb(thumbnail){
    return thumbnail.getAttribute('data-image-url');
}

function titleFromThum(thumbnail){
    return thumbnail.getAttribute('data-image-title');
}

function setDetailsFromThumb(thumbnail){
    setDetails(imageFromThumb(thumbnail), titleFromThum(thumbnail));
}

function addThumbClickedHandler(thumb){
    thumb.addEventListener('click',function (event) {
        event.preventDetault();
        setDetailsFromThumb(thumb);
    });
}

function getThumbnailsArray() {
    var thumbnials = document.querySelectorAll(THUMBNAIL_LINK_SELECTOR);
    var thumbnailsArray = [].slice.call(thumbnials);
    return thumbnailsArray;
}

function initializeEvents() {
    var thumbnials = getThumbnailsArray();
}