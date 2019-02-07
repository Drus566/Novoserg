# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->
    tags_post = document.getElementById('tags-post')
    tags_all = document.getElementById('tags-all')

    if tags_post 
        tags_post.addEventListener 'click', (event) ->
            event.preventDefault()
            tag = event.target
            if tag.className is 'tag'
                tag.className = 'tag-inactive'
            else if tag.className is ('tag-inactive')
                tag.className = 'tag'
    
    if tags_all 
        tags_all.addEventListener 'click', (event) ->
            event.preventDefault()
            tag = event.target
            if tag.className is 'tag'
                tag.className = 'tag-active'
            else if tag.className is 'tag-active'
                tag.className = 'tag'
   
                
                

