// Get current date in GMT+3
let currentDate = new Date();
currentDate.setHours(currentDate.getHours() + 3); // Adding 3 hours for GMT+3

// Format the date as "Day, Month Date, Year" like "Monday, January 1, 2045"
let days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

let day = days[currentDate.getUTCDay()];
let month = months[currentDate.getUTCMonth()];
let date = currentDate.getUTCDate();
let year = currentDate.getUTCFullYear();

let formattedDate = `${day}, ${month} ${date}, ${year}`;

// Replace the default date in HTML
document.querySelector('.nav-item.border-right.border-secondary a.nav-link.text-body.small').textContent = formattedDate;
