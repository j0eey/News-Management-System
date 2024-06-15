document.addEventListener("DOMContentLoaded", function() {
    fetch('/api/latest-news')
        .then(response => response.json())
        .then(data => updateNews(data))
        .catch(error => console.error('Error fetching news:', error));
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

function updateNews(news) {
    const mainCarousel = document.getElementById('main-carousel');
    const secondaryNews = document.getElementById('secondary-news');
    const announcementsCarousel = document.getElementById('announcements-carousel');
    const featuredNewsCarousel = document.getElementById('featured-news-carousel');

    mainCarousel.innerHTML = '';
    secondaryNews.innerHTML = '';
    announcementsCarousel.innerHTML = '';
    featuredNewsCarousel.innerHTML = '';

    news.forEach((item, index) => {
        const isMainCarousel = item.tags.includes('Main Carousel');
        const isSecondaryNews = item.tags.includes('Secondary News');
        const isAnnouncement = item.tags.includes('Announcement');
        const isFeaturedNews = item.tags.includes('Featured News');

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
        } else if (isFeaturedNews) {
            featuredNewsCarousel.innerHTML += newsHtml;
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

    // Carousel item 2
    $(".carousel-item-2").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 30,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="fa fa-angle-left" aria-hidden="true"></i>',
            '<i class="fa fa-angle-right" aria-hidden="true"></i>'
        ],
        responsive: {
            0:{
                items:1
            },
            576:{
                items:1
            },
            768:{
                items:2
            }
        }
    });


    // Carousel item 3
    $(".carousel-item-3").owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        margin: 30,
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="fa fa-angle-left" aria-hidden="true"></i>',
            '<i class="fa fa-angle-right" aria-hidden="true"></i>'
        ],
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
        dots: false,
        loop: true,
        nav : true,
        navText : [
            '<i class="fa fa-angle-left" aria-hidden="true"></i>',
            '<i class="fa fa-angle-right" aria-hidden="true"></i>'
        ],
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
            },
            1200:{
                items:4
            }
        }
    });
}
