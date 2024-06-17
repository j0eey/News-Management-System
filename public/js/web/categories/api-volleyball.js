document.addEventListener("DOMContentLoaded", function() {
    fetch('/api/latest-news')
        .then(response => response.json())
        .then(data => filterAndDisplayVolleyballNews(data))
        .catch(error => console.error('Error fetching news:', error));
});

function filterAndDisplayVolleyballNews(news) {
    const volleyballNews = news.filter(item => item.category.toLowerCase() === 'volleyball');

    const volleyballCategory = document.getElementById('volleyball_category');

    if (volleyballCategory) {
        volleyballCategory.innerHTML = '';

        let newsRow; 
        let newsCount = 0; 

        volleyballNews.forEach(item => {
            if (newsCount >= 6) return; 

            const truncatedTitle = truncateTitle(item.title, 8);
            const truncatedDescription = truncateDescription(item.description, 20);

            const newsHtml = `
                <div class="col-lg-6 position-relative mb-3">
                    <img class="img-fluid w-100" src="${item.image_url}" style="object-fit: cover;">
                    <div class="bg-white border border-top-0 p-4">
                        <div class="mb-2">
                            <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" >${item.category}</a>
                            <a class="text-body" ><small>${item.custom_date}</small></a>
                        </div>
                        <a class="h4 d-block mb-3 text-secondary text-uppercase font-weight-bold" href="${item.link}">${truncatedTitle}</a>
                        <p class="m-0">${truncatedDescription}</p>
                    </div>
                </div>`;

            if (!newsRow || newsRow.children.length >= 2) {
                newsRow = document.createElement('div');
                newsRow.classList.add('row');
                volleyballCategory.appendChild(newsRow);
            }

            newsRow.innerHTML += newsHtml;
            newsCount++;
        });
    }
}