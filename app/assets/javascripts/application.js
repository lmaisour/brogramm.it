// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require angular
//= require angular-route
//= require angular-resource
//= require_tree .


$(document).ready(function () {

    $(".player").mb_YTPlayer();

});


//  var terms = $("ul li");

//  function rotateTerm() {

//    var ct = $("#rotate").data("term") || 0;

//    console.log(terms.eq([ct]).text());

//    $("#rotate").data("term", 
//     ct == terms.length -1 ? 0 : ct + 1).text(terms.eq([ct]).text())
//    .fadeIn().delay(0000).fadeOut(5000, rotateTerm);

//  }
//  $(rotateTerm);
// });

/* javascript for live video */

var videos = 1;
var publisherObj;

var subscriberObj = {};

var MAX_WIDTH_VIDEO = 264;
var MAX_HEIGHT_VIDEO = 400;

var MIN_WIDTH_VIDEO = 300;
var MIN_HEIGHT_VIDEO = 300;

var MAX_WIDTH_BOX = 800;
var MAX_HEIGHT_BOX = 600;

var CURRENT_WIDTH = MAX_WIDTH_VIDEO;
var CURRENT_HEIGHT = MAX_HEIGHT_VIDEO;

function layoutManager() {
  var estBoxWidth = MAX_WIDTH_BOX / videos;
  var width = Math.min(MAX_WIDTH_VIDEO, Math.max(MIN_WIDTH_VIDEO, 
    estBoxWidth));
  var height = 3*width/4;

  publisherObj.height = height;
  publisherObj.width = width;

  for(var subscriberDiv in subscriberObj) {
    subscriberDiv.height = height;
    subscriberDiv.width = width;
  }

  CURRENT_HEIGHT = height;
  CURRENT_WIDTH = width;
}

var apiKey =  44979352;
var sessionId = "<%= @room.sessionId %>";
var token = "<%= @tok_token %>";

var session;

TB.setLogLevel(TB.DEBUG);
    //session.connect(apiKey, token);
    var session = TB.initSession(sessionId);
    session.addEventListener('sessionConnected', sessionConnectedHandler);
    session.addEventListener('streamCreated', streamCreatedHandler);
    session.connect(apiKey, token);


    var publisher;
    function sessionConnectedHandler(event) {
      publisher = TB.initPublisher(apiKey, 'videobox');
      session.publish(publisher);

          // Subscribe to streams that were in the session when we connected
          subscribeToStreams(event.streams);
        }

        function streamCreatedHandler(event) {
          // Subscribe to any new streams that are created
          subscribeToStreams(event.streams);
        }

        function subscribeToStreams(streams) {
          for (var i = 0; i < streams.length; i++) {
            // Make sure we don't subscribe to ourself
            if (streams[i].connection.connectionId == session.connection.connectionId) {
              return;
            }

            // Create the div to put the subscriber element in to
            var div = document.createElement('div');
            div.setAttribute('id', 'stream' + streams[i].streamId);
            document.body.appendChild(div);

            // Subscribe to the stream
            session.subscribe(streams[i], div.id);
          }
        }

