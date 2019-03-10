layer = document.getElementById('layer-wrap')
if layer 
    console.log("Layer")
    layer.style.display = "initial"
    text = "<%= escape_javascript(render @micropost) %>"
    micropost_container = layer.querySelector('#micropost-wrap')
    micropost_container.innerHTML = text
    

