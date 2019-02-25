tags = document.getElementById('microposts-container')
text = "<%= escape_javascript(render @microposts) %>"
tags.innerHTML = text
