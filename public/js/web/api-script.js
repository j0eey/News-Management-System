document.addEventListener("DOMContentLoaded", function() {
    fetch('/api/latest-news')
        .then(response => response.json())
        .then(data => updateNews(data))
        .catch(error => console.error('Error fetching news:', error));
});

function updateNews(news) {
    const mainCarousel = document.getElementById('main-carousel');
    const secondaryNews = document.getElementById('secondary-news');

    mainCarousel.innerHTML = '';
    secondaryNews.innerHTML = '';

    news.forEach((item, index) => {
        const newsHtml = `
            <div class="position-relative overflow-hidden" style="height: ${index < 3 ? '500px' : '250px'};">
                <img class="img-fluid ${index < 3 ? 'h-100' : 'w-100 h-100'}" src="${item.image_url}" style="object-fit: cover;">
                <div class="overlay">
                    <div class="mb-2">
                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" href="">${item.category}</a>
                        <a class="text-white" href=""><small>${item.custom_date}</small></a>
                    </div>
                    <a class="${index < 3 ? 'h2 m-0' : 'h6 m-0'} text-white text-uppercase font-weight-${index < 3 ? 'bold' : 'semi-bold'}" href="${item.link}">${item.title}</a>
                </div>
            </div>`;

        if (index < 3) {
            mainCarousel.innerHTML += newsHtml;
        } else {
            secondaryNews.innerHTML += `
                <div class="col-md-6 px-0">
                    ${newsHtml}
                </div>`;
        }
    });
}