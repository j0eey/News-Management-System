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
    const featuredNewsCarousel = document.getElementById('featured-news-carousel');
    const latestNews = document.getElementById('latest-news');
    const trendingNews = document.getElementById('trending-news');

    if (mainCarousel) mainCarousel.innerHTML = '';
    if (secondaryNews) secondaryNews.innerHTML = '';
    if (announcementsCarousel) announcementsCarousel.innerHTML = '';
    if (featuredNewsCarousel) featuredNewsCarousel.innerHTML = '';
    if (latestNews) latestNews.innerHTML = '';
    if (trendingNews) trendingNews.innerHTML = '';

    let latestNewsRow;
    let mainCarouselCount = 0;
    let secondaryNewsCount = 0;
    let announcementCount = 0;
    let featuredNewsCount = 0;
    let latestNewsCount = 0;
    let trendingNewsCount = 0;

    news.forEach((item) => {
        try {
            const isMainCarousel = item.tags.includes('Main Carousel');
            const isSecondaryNews = item.tags.includes('Secondary News');
            const isAnnouncement = item.tags.includes('Announcement');
            const isFeaturedNews = item.tags.includes('Featured News');
            const isLatestNews = item.tags.includes('Latest News');
            const isTrendingNews = item.tags.includes('Trending News');

            const truncatedTitle = isMainCarousel || isAnnouncement ? item.title : truncateTitle(item.title, 8);
            const truncatedDescription = truncateDescription(item.description, 20);

            const newsHtml = `
                <div class="item position-relative overflow-hidden" style="height: ${isMainCarousel ? '500px' : '250px'};">
                    <img class="img-fluid ${isMainCarousel ? 'h-100' : 'w-100 h-100'}" src="${item.image_url}" style="object-fit: cover;">
                    <div class="overlay">
                        <div class="mb-2">
                            <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2">${item.category}</a>
                            <a class="text-white"><small>${item.custom_date}</small></a>
                        </div>
                        <a class="${isMainCarousel ? 'h2 m-0' : 'h6 m-0'} text-white text-uppercase font-weight-${isMainCarousel ? 'bold' : 'semi-bold'}" href="${item.link}">${truncatedTitle}</a>
                    </div>
                </div>`;

            const latestNewsHtml = `
                <div class="col-lg-6 mb-3">
                    <div class="position-relative">
                        <img class="img-fluid w-100" src="${item.image_url}" style="object-fit: cover;">
                        <div class="bg-white border border-top-0 p-4">
                            <div class="mb-2">
                                <a class="badge badge-primary text-uppercase font-weight-semi-bold p-2 mr-2">${item.category}</a>
                                <a class="text-body"><small>${item.custom_date}</small></a>
                            </div>
                            <a class="h4 d-block mb-3 text-secondary text-uppercase font-weight-bold" href="${item.link}">${truncatedTitle}</a>
                            <p class="m-0">${truncatedDescription}</p>
                        </div>
                    </div>
                </div>`;

            const trendingNewsHtml = `
                <div class="d-flex align-items-center bg-white mb-3" style="height: 110px;">
                    <img class="img-fluid" src="${item.image_url}" alt="" style="width: 110px; height: 110px; object-fit: cover;">
                    <div class="w-100 h-100 px-3 d-flex flex-column justify-content-center border border-left-0">
                        <div class="mb-2">
                            <a class="badge badge-primary text-uppercase font-weight-semi-bold p-1 mr-2">${item.category}</a>
                            <a class="text-body"><small>${item.custom_date}</small></a>
                        </div>
                        <a class="h6 m-0 text-secondary text-uppercase font-weight-bold" href="${item.link}">${isTrendingNews ? truncateTitle(item.title, 6) : truncatedTitle}</a>
                    </div>
                </div>`;

            if (isMainCarousel && mainCarouselCount < 3 && mainCarousel) {
                mainCarousel.innerHTML += newsHtml;
                mainCarouselCount++;
            }
            if (isSecondaryNews && secondaryNewsCount < 4 && secondaryNews) {
                secondaryNews.innerHTML += `
                    <div class="col-md-6 px-0">
                        ${newsHtml}
                    </div>`;
                secondaryNewsCount++;
            }
            if (isAnnouncement && announcementCount < 4 && announcementsCarousel) {
                announcementsCarousel.innerHTML += `
                    <div class="text-truncate">
                        <a class="text-white text-uppercase font-weight-semi-bold" href="${item.link}">${item.title}</a>
                    </div>`;
                announcementCount++;
            }
            if (isFeaturedNews && featuredNewsCount < 5 && featuredNewsCarousel) {
                featuredNewsCarousel.innerHTML += newsHtml;
                featuredNewsCount++;
            }
            if (isLatestNews && latestNewsCount < 4 && latestNews) {
                if (!latestNewsRow || latestNewsRow.children.length >= 2) {
                    latestNewsRow = document.createElement('div');
                    latestNewsRow.classList.add('row');
                    latestNews.appendChild(latestNewsRow);
                }
                latestNewsRow.innerHTML += latestNewsHtml;
                latestNewsCount++;
            }
            if (isTrendingNews && trendingNewsCount < 5 && trendingNews) {
                trendingNews.innerHTML += trendingNewsHtml;
                trendingNewsCount++;
            }
        } catch (error) {
            console.error('Error processing news item:', item, error);
        }
    });

    initializeOwlCarousel();
}

function truncateTitle(title, wordLimit) {
    const words = title.split(' ');
    if (words.length > wordLimit) {
        return words.slice(0, wordLimit).join(' ') + '...';
    }
    return title;
}

function truncateDescription(description, wordLimit) {
    const words = description.split(' ');
    if (words.length > wordLimit) {
        return words.slice(0, wordLimit).join(' ') + '...';
    }
    return description;
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

    // Carousel item 1
    $(".carousel-item-1").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        items: 1,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="fa fa-angle-left" aria-hidden="true"></i>',
            '<i class="fa fa-angle-right" aria-hidden="true"></i>'
        ]
    });

    

    // Carousel item 3
    $(".carousel-item-3").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 30,
        dots: true,
        loop: true,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });

    // Carousel item 4
    $(".carousel-item-4").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 30,
        dots: true,
        loop: true,
        responsive: {
            0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:2
            },
            992:{
                items:3
            }
        }
    });
}


document.addEventListener('DOMContentLoaded', function() {
    const backToTopButton = document.querySelector('.back-to-top');

    window.addEventListener('scroll', function() {
        if (window.scrollY > 300) {
            backToTopButton.style.display = 'block';
        } else {
            backToTopButton.style.display = 'none';
        }
    });

    backToTopButton.addEventListener('click', function(event) {
        event.preventDefault();
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
});

// Dropdown on mouse hover
$(document).ready(function () {
    function toggleNavbarMethod() {
        if ($(window).width() > 992) {
            $('.navbar .dropdown').on('mouseover', function () {
                $('.dropdown-toggle', this).trigger('click');
            }).on('mouseout', function () {
                $('.dropdown-toggle', this).trigger('click').blur();
            });
        } else {
            $('.navbar .dropdown').off('mouseover').off('mouseout');
        }
    }
    toggleNavbarMethod();
    $(window).resize(toggleNavbarMethod);
});