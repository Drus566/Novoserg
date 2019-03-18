App.comments = App.cable.subscriptions.create "CommentsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    micropost_id = data['micropost_id']
    parent_comment_id = data['parent_comment_id']
    if micropost_id != null
      micropost = document.querySelector("#micropost_#{micropost_id}")
      if micropost != null
        if parent_comment_id != null
          parent_comment = micropost.querySelector("#micropost_comment_#{parent_comment_id}")
          comment_replies = parent_comment.querySelector('.comments-replies')
          if comment_replies != null
            comment_replies.innerHTML += data['comment']
          else 
            ul = document.createElement('ul')
            ul.classList.add('comments-replies')
            parent_comment.appendChild(ul)
            console.log(ul)
            comment_replies = parent_comment.querySelector('.comments-replies')
            comment_replies.innerHTML += data['comment']
        else 
          micropost_comments = micropost.querySelector('.micropost-comments')
          if micropost_comments != null
            micropost_comments_container = micropost_comments.querySelector('.micropost-comments-container')
            micropost_comments_container.innerHTML += data['comment']
          else
            mc = document.createElement('div')
            mc.classList.add('micropost-comments')
            mcc = document.createElement('div')
            mcc.classList.add('micropost-comments-container')
            mc.appendChild(mcc)
            mcc.innerHTML += data['comment']
            post = micropost.querySelector('.post')
            micropost.insertBefore(mc,post.nextSibling)
              
          
          


      
    
