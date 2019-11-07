'use strict';
var DETAIL_IMAGE_SELECTOR = '[data-image-role="target"]';
var DETAIL_TITLE_SELECTOR = '[data-image-role="title"]';
var THUMBNAIL_LINK_SELECTOR = '[data-image-role="trigger"]';
var DETAIL_FRAME_SELECTOR = '[data-image-role="frame"]'
var HIDDEN_DETAIL_CLASS = 'hidden-detail';
var ESC_KEY = 27;
var TINNY_EFFECT_CLASS = 'is-tiny';

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
    thumb.addEventListener('click', function(event){
        event.preventDefault();
        setDetailsFromThumb(thumb);
        showDetails();
    });
}

function getThumbnailsArray() {
    var thumbnials = document.querySelectorAll(THUMBNAIL_LINK_SELECTOR);
    var thumbnailsArray = [].slice.call(thumbnials);
    return thumbnailsArray;
}

function hideDetails() {
    document.body.classList.add(HIDDEN_DETAIL_CLASS);
}

function addKeyPressHandler() {
    document.body.addEventListener('keyup', function (event) {
        event.preventDefault();
        console.log('====================================');
        console.log(event.keyCode);
        console.log('====================================');
        if(event.keyCode === ESC_KEY){
            hideDetails();
        }
    });
}

function showDetails() {
    var frame = document.querySelector(DETAIL_FRAME_SELECTOR);
    document.body.classList.remove(HIDDEN_DETAIL_CLASS);
    frame.classList.add(TINNY_EFFECT_CLASS);
    setTimeout(function () {
        frame.classList.remove(TINNY_EFFECT_CLASS);
    });
}


(function (thumbnials) {
    thumbnials.forEach(addThumbClickedHandler);
    addKeyPressHandler();
})(getThumbnailsArray());

