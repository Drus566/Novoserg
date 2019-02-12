tags = document.getElementById('tags-all')
text = "<%= escape_javascript(render(:partial => 'shared/tag', locals: { tag: @tag } )) %>"
tags.innerHTML += text
