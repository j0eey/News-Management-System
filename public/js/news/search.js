document.addEventListener('DOMContentLoaded', function () {
    const searchInput = document.getElementById('search');
    const searchResults = document.getElementById('search-results');

    if (searchInput) {
        searchInput.addEventListener('input', performSearch);
    }

    function performSearch() {
        const searchQuery = searchInput.value.trim();
        console.log('Search input detected:', searchQuery); // Log search input

        fetch(`/news/search?search=${encodeURIComponent(searchQuery)}`) // Change query to search
            .then(response => {
                console.log('Fetch response received', response);
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Search results:', data);
                renderSearchResults(data);
            })
            .catch(error => console.error('Error:', error));
    }

    function renderSearchResults(results) {
        searchResults.innerHTML = ''; // Clear previous results
        if (results.length > 0) {
            // Render search results
            results.forEach(item => {
                // Create elements to display search results
                const resultItem = document.createElement('div');
                resultItem.classList.add('search-result');
                resultItem.innerHTML = `
                    <a href="/news/${item.id}">${item.title}</a>
                    <p>${item.description}</p>
                    <!-- Add more details as needed -->
                `;
                searchResults.appendChild(resultItem);
            });
        } else {
            // Handle no results case
            searchResults.innerHTML = '<p>No results found</p>';
        }
    }
});
