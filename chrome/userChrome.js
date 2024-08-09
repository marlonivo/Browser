document.addEventListener('keydown', function(event) {
    if (event.ctrlKey && event.shiftKey && event.key === 'V') {
        document.documentElement.classList.toggle('hidden-toolbars');
    }
});
