# Hash Array Mask

Deeply delete a complex hash/array structure.

<h2>Latest Releases</h2>
<ul id="releases"></ul>
<div id="no-releases-message" style="display:none;">
  No releases found. <a href="https://github.com/DaneWeber/hash_array_mask/releases/new" target="_blank">Create a new Release</a>.
</div>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
fetch('https://api.github.com/repos/DaneWeber/hash_array_mask/releases')
  .then(response => response.json())
  .then(data => {
    const ul = document.getElementById('releases');
    if (Array.isArray(data) && data.length > 0) {
      data.forEach(release => {
        const li = document.createElement('li');
        li.innerHTML = `<a href="${release.html_url}">${release.name}</a>:<div>${marked.parse(release.body || '')}</div>`;
        ul.appendChild(li);
      });
    } else {
      document.getElementById('no-releases-message').style.display = 'block';
    }
  });
</script>
