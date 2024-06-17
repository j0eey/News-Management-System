document.addEventListener('DOMContentLoaded', function() {
    fetch('/latest-news')
        .then(response => response.json())
        .then(data => {
            const container = document.getElementById('news-detail-container');
            if (data.length > 0) {
                const news = data[0]; // Assuming you want the latest news
                const newsHtml = `
                    <div class="position-relative mb-3">
                        <img class="img-fluid w-100" src="${news.image_url}" style="object-fit: cover;">
                        <div class="bg-white border border-top-0 p-4">
                            <div class="mb-3">
                                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2"
                                    href="">${news.category}</a>
                                <a class="text-body" href="">${news.custom_date}</a>
                            </div>
                            <h1 class="mb-3 text-secondary text-uppercase font-weight-bold">${news.title}</h1>
                            <p>${news.description}</p>
                            <a href="${news.link}" class="btn btn-primary">Read More</a>
                        </div>
                        <div class="d-flex justify-content-between bg-white border border-top-0 p-4">
                            <div class="d-flex align-items-center">
                                <img class="rounded-circle mr-2" src="img/user.jpg" width="25" height="25" alt="">
                                <span>John Doe</span>
                            </div>
                        </div>
                    </div>`;
                container.innerHTML = newsHtml;
            } else {
                container.innerHTML = '<p>No news available.</p>';
            }
        })
        .catch(error => console.error('Error fetching news:', error));
});
