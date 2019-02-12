# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
document.addEventListener 'turbolinks:load', ->
    tags_post = document.getElementById('tags-post')
    tags_all = document.getElementById('tags-all')

    if tags_post 
        inactive_tags = document.getElementById('inactive_tags')
        inactive_ids = []
        tags_post.addEventListener 'click', (event) ->
            event.preventDefault()
            tag = event.target
            if tag.className is 'tag'
                tag.className = 'tag-inactive'
                inactive_ids.push(tag.id)
            else if tag.className is ('tag-inactive')
                tag.className = 'tag'
                inactive_ids.splice(inactive_ids.indexOf(tag.id),1)
            inactive_tags.value = inactive_ids.join(',')
    
    if tags_all 
        active_tags = document.getElementById('active_tags')
        active_ids = []
        tags_all.addEventListener 'click', (event) ->
            event.preventDefault()
            tag = event.target
            if tag.className is 'tag'
                tag.className = 'tag-active'
                active_ids.push(tag.id)
            else if tag.className is 'tag-active'
                tag.className = 'tag'
                active_ids.splice(active_ids.indexOf(tag.id),1)
            active_tags.value = active_ids.join(',')