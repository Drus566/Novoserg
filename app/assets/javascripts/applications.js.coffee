document.addEventListener 'turbolinks:load', ->
    account = document.getElementById('account')
    if account 
        drop = document.getElementById('closed')

        account.addEventListener 'click', (event) ->
            event.preventDefault()
            if drop.id is "closed"
                drop.id = "opened"
            else 
                drop.id = "closed"

        document.addEventListener 'click', (event) ->
            unless event.target is account
                if event.target is drop or drop.contains(event.target)
                    return
                drop.id = 'closed'
    
    
        
