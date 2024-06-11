// Disable right-click
document.addEventListener('contextmenu', function(e) {
    e.preventDefault();
}, false);

// Disable specific key combinations
document.addEventListener('keydown', function(e) {
    // Check for Ctrl+Shift+C
    if (e.ctrlKey && e.shiftKey && e.key === 'C') {
        e.preventDefault();
        e.stopPropagation();
    }
}, false);
