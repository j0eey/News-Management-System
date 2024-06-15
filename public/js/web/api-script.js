document.addEventListener("DOMContentLoaded", function() {
    fetch('/api/latest-news')
        .then(response => response.json())
        .then(data => updateNews(data))
        .catch(error => console.error('Error fetching news:', error));
});

function updateNews(news) {
    const mainCarousel = document.getElementById('main-carousel');
    const secondaryNews = document.getElementById('secondary-news');
    const announcementsCarousel = document.getElementById('announcements-carousel');

    mainCarousel.innerHTML = '';
    secondaryNews.innerHTML = '';
    announcementsCarousel.innerHTML = '';

    news.forEach((item, index) => {
        const isMainCarousel = item.tags.includes('Main Carousel');
        const isSecondaryNews = item.tags.includes('Secondary News');
        const isAnnouncement = item.tags.includes('Announcement');

        const newsHtml = `
            <div class="item position-relative overflow-hidden" style="height: ${isMainCarousel ? '500px' : '250px'};">
                <img class="img-fluid ${isMainCarousel ? 'h-100' : 'w-100 h-100'}" src="${item.image_url}" style="object-fit: cover;">
                <div class="overlay">
                    <div class="mb-2">
                        <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2" href="#">${item.category}</a>
                        <a class="text-white" href="#"><small>${item.custom_date}</small></a>
                    </div>
                    <a class="${isMainCarousel ? 'h2 m-0' : 'h6 m-0'} text-white text-uppercase font-weight-${isMainCarousel ? 'bold' : 'semi-bold'}" href="${item.link}">${item.title}</a>
                </div>
            </div>`;

        if (isMainCarousel) {
            mainCarousel.innerHTML += newsHtml;
        } else if (isSecondaryNews) {
            secondaryNews.innerHTML += `
                <div class="col-md-6 px-0">
                    ${newsHtml}
                </div>`;
        } else if (isAnnouncement) {
            announcementsCarousel.innerHTML += `
                <div class="text-truncate">
                    <a class="text-white text-uppercase font-weight-semi-bold" href="${item.link}">${item.title}</a>
                </div>`;
        }
    });

    // Initialize Owl Carousel after news items are added
    initializeOwlCarousel();
}

// Main News carousel
function initializeOwlCarousel() {
    $(".main-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        items: 1,
        dots: true,
        loop: true,
        center: true,
    });

    $(".tranding-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 2000,
        items: 1,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="fa fa-angle-left"></i>',
            '<i class="fa fa-angle-right"></i>'
        ]
    });
}
