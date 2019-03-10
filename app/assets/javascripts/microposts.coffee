# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

document.addEventListener 'turbolinks:load', ->
#     layer = document.getElementById('layer-wrap')
#     if layer 
#         closer = layer.querySelector('.close-layer')
#         layer.addEventListener 'click', (event) ->
#             obj = event.target
#             if obj.className == 'tag' or obj.className == 'close-layer' or obj.innerHTML == "Редактировать" or obj.innerHTML == "Удалить"
#                 layer.style.display = "none"
#                 microposts_container = layer.querySelector('#micropost-wrap')
#                 microposts_container.innerHTML = ''

#         # if closer 
#         #     closer.addEventListener 'click', (event) -> 
#         #         event.preventDefault()
#         #         layer.style.display = "none"
#         #         microposts_container = layer.querySelector('#micropost-wrap')
#         #         microposts_container.innerHTML = ''

#     microposts_container = document.getElementsByClassName('microposts-container')[0]
#     if microposts_container
#         # layer = document.getElementById('layer-wrap')
#         # token = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
#         microposts_container.addEventListener 'click', (event) ->
#             if event.target.className is 'post-poll'
#                 url = event.target.getAttribute("data-url")
#                 # csrf_token = event.target.querySelector("#form_token").getAttribute("value")
#                 xmlHttp = new XMLHttpRequest();
#                 xmlHttp.onreadystatechange = () ->
#                     if xmlHttp.readyState == XMLHttpRequest.DONE
#                         if xmlHttp.status == 200
#                             # console.log("200")
#                             # console.log(xmlHttp.getAllResponseHeaders())
#                             eval(xmlHttp.response)
#                             # eval(xmlHttp.response)
#                         else if xmlHttp.status == 400
#                             # console.log("400")
#                         else
#                             # console.log(xmlHttp.status)
#                             # console.log(xmlHttp.statusText)
#                 xmlHttp.open("GET", url, true)
#                 # console.log(csrf_token)
#                 # xmlHttp.setRequestHeader('authenticity_token', csrf_token)
#                 # xmlHttp.setRequestHeader('X-CSRF-Token', token)
#                 xmlHttp.setRequestHeader("Accept", "application/javascript");
#                 xmlHttp.responseType = "text"
#                 xmlHttp.send()
        
#                 # xmlHttp.setRequestHeader('Origin', 'http://localhost:3000')
#                 # xmlHttp.setRequestHeader('Content-Type', 'application/js')
#                 # xmlHttp.setRequestHeader('Access-Control-Allow-Origin', '*')
#                 # xmlHttp.setRequestHeader('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
#                 # xmlHttp.setRequestHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization')
#                 # console.log(csrf_token)
#                 # xmlHttp.setRequestHeader('X-CSRF-Token', csrf_token)
#                 # xmlHttp.setRequestHeader('X-CSRF-Token', token)
#                 # xmlHttp.setRequestHeader('Content-Type', 'application/javascript');
#                 # xmlHttp.setRequestHeader('Content-Type', 'text/js');
#                 # xmlHttp.setRequestHeader('Content-Type', 'text/javascript');
#                 # xmlHttp.setRequestHeader('Content-Type', 'charset=utf-8');
#                 # xmlHttp.overrideMimeType("application/js");
#                 # xmlHttp.overrideMimeType("application/javascript");
#                 # xmlHttp.overrideMimeType("text/javascript");
#                 # xmlHttp.overrideMimeType("text/js");  

# Закрыть форму для ввода сообщения

document.addEventListener 'click', (event) ->
    if event.target.className == "close-micropost-comment-form"
        obj = event.target
        
        if obj.getAttribute('data-reply') == 'false' 
            form = obj.parentNode.parentNode
            if form.className == 'new_comment'
                str = form.getAttribute('action')
                id = str.split('/')[2]
                micropost = document.getElementById("micropost_#{id}")
                new_comment = micropost.querySelector(".create-new-comment")
                new_comment.setAttribute('href', "/microposts/#{id}/comments/new")
                micropost.lastChild.remove()
            else if form.className == 'edit_comment'
                comment = form.parentNode.parentNode
                edit_link = comment.querySelector(".edit-comment-link")
                delete_link = comment.querySelector(".delete-comment-link")
                link = delete_link.getAttribute('href')
                form.parentNode.remove()
                edit_link.setAttribute('href', "#{link}/edit")

        if obj.getAttribute('data-reply') == 'true'
            form = obj.parentNode.parentNode
            comment = form.parentNode.parentNode
            reply_link = comment.querySelector(".reply-comment-link")
            delete_link = comment.querySelector(".delete-comment-link")
            link = delete_link.getAttribute('href')
            form.parentNode.remove()
            reply_link.setAttribute('href', "#{link}/reply")

    #  if event.target.className == "create-new-comment"
    #     obj = event.target 
    #     console.log(obj)
    #     unless obj.getAttribute('href')
    #         c = obj.parentNode.firstChild
    #         str = c.getAttribute('href')
    #         id = str.split('/')[2]
    #         micropost = document.getElementById("micropost_#{id}")
    #         micropost.querySelector(".micropost-comment-form").remove();
    #         micropost.querySelector(".create-new-comment").setAttribute('href', "/microposts/#{id}/comments/new")


                

