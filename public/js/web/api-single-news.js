document.addEventListener('DOMContentLoaded', function() {
    function fetchSingleNews(newsId) {
        fetch(`/api/news/${newsId}`)
            .then(response => response.json())
            .then(data => {
                const container = document.getElementById('news-detail-container');
                const authorImageUrl = data.author_image_url ? `http://127.0.0.1:8000/storage/${data.author_image_url}` : 'img/user.jpg';
                const newsHtml = `
                    <div class="position-relative mb-3">
                        <img class="img-fluid w-100" src="${data.image_url}" style="object-fit: cover;">
                        <div class="bg-white border border-top-0 p-4">
                            <div class="mb-3">
                                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2"
                                    >${data.category}</a>
                                <a class="text-body" >${data.custom_date}</a>
                            </div>
                            <h1 class="mb-3 text-secondary text-uppercase font-weight-bold">${data.title}</h1>
                            <p>${data.description}</p>
                        </div>
                        <div class="d-flex justify-content-between bg-white border border-top-0 p-4">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle mr-2" src="${authorImageUrl}" width="30" height="30" alt="">
                                <span>${data.author}</span>
                            </div>
                        </div>
                    </div>`;
                container.innerHTML = newsHtml;
            })
            .catch(error => console.error('Error fetching news:', error));
    }

    // Extract news ID from the URL
    const urlParts = window.location.href.split('/');
    const newsId = urlParts[urlParts.length - 1]; // Get the last part of the URL

    // Fetch news details using extracted news ID
    fetchSingleNews(newsId);
});
