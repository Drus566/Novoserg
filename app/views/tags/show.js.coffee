tags = document.getElementsByClassName('microposts-container')[0]
text = "<%= escape_javascript(render @microposts) %>"
tags.innerHTML = text
