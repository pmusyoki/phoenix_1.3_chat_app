// Brunch automatically concatenates all files in your watched paths. Those
// paths can be configured at config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if explicitly imported. The only
// exception are files in vendor, which are never wrapped in imports and
// therefore are always executed. Import dependencies
//
// If you no longer want to use a dependency, remember to also remove its path
// from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths "./socket" or full
// ones "web/static/js/socket".

import socket from "./socket"

let channel = socket.channel('chat_room:lobby', {});
let list = $('#message-list');
let message = $('#msg');
let name = $('#name');
let inserted_at = srvTime();

message.on('keypress', event => {
    if (event.keyCode == 13) {
        channel.push('shout', {
            name: name.val(),
            message: message.val(),
            published_at: inserted_at
        });
        message.val('');
    }
});

channel.on('shout', payload => {
    list.append(`<div class="message">${payload.name || 'new_user'}:</b> ${payload.message}<span class="date_time"> ${payload.published_at} </span></div><br>`);
    list.prop({
        scrollTop: list.prop('scrollHeight')
    });
});

channel
    .join()
    .receive('ok', resp => {
        console.log('Joined successfully', resp);
    })
    .receive('error', resp => {
        console.log('Unable to join', resp);
    });

var xmlHttp;
function srvTime(){
try {
    //FF, Opera, Safari, Chrome
    xmlHttp = new XMLHttpRequest();
}
catch (err1) {
    //IE
    try {
        xmlHttp = new ActiveXObject('Msxml2.XMLHTTP');
    }
    catch (err2) {
        try {
            xmlHttp = new ActiveXObject('Microsoft.XMLHTTP');
        }
        catch (eerr3) {
            //AJAX not supported, use CPU time.
            alert("AJAX not supported");
        }
    }
}
xmlHttp.open('HEAD',window.location.href.toString(),false);
xmlHttp.setRequestHeader("Content-Type", "text/html");
xmlHttp.send('');
return xmlHttp.getResponseHeader("Date");
}

var st = srvTime();
var date = new Date(st);