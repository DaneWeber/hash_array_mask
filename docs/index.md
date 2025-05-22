# Hash Array Mask

Deeply delete a complex hash/array structure.

## Guides

{% for guide in site.guides %}
### [{{ guide.title }}]({{ guide.url }})
{{ guide.description }}
{% endfor %}

<h2>Latest Releases</h2>
<ul id="releases"></ul>
<div id="no-releases-message" style="display:none;">
  No releases found. <a id="new-release-link" href="#" target="_blank">Create a new Release</a>.
</div>
<script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
<script>
''
const repo = 'DaneWeber/hash_array_mask';
const apiBase = 'https://api.github.com/repos/' + repo;
const releasesApi = `${apiBase}/releases`;
const newReleaseUrl = `https://www.github.com/${repo}/releases/new`;

document.getElementById('new-release-link').href = newReleaseUrl;

fetch(releasesApi)
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
