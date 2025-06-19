// Main JavaScript for Prompt Library Website

document.addEventListener('DOMContentLoaded', function() {
    initializeSearch();
    initializeMobileMenu();
    initializeCategoryFilter();
    initializePromptCards();
});

// Search functionality
function initializeSearch() {
    const searchInput = document.getElementById('search-input');
    const searchBtn = document.getElementById('search-btn');
    const searchResults = document.getElementById('search-results');
    
    if (!searchInput || !searchResults) return;
    
    let searchTimeout;
    
    searchInput.addEventListener('input', function() {
        clearTimeout(searchTimeout);
        const query = this.value.trim();
        
        if (query.length < 2) {
            hideSearchResults();
            return;
        }
        
        searchTimeout = setTimeout(() => {
            performSearch(query);
        }, 300);
    });
    
    searchInput.addEventListener('focus', function() {
        const query = this.value.trim();
        if (query.length >= 2) {
            performSearch(query);
        }
    });
    
    // Hide search results when clicking outside
    document.addEventListener('click', function(e) {
        if (!e.target.closest('.navbar-search')) {
            hideSearchResults();
        }
    });
    
    if (searchBtn) {
        searchBtn.addEventListener('click', function() {
            const query = searchInput.value.trim();
            if (query) {
                window.location.href = `/search/?q=${encodeURIComponent(query)}`;
            }
        });
    }
    
    searchInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            const query = this.value.trim();
            if (query) {
                window.location.href = `/search/?q=${encodeURIComponent(query)}`;
            }
        }
    });
}

function performSearch(query) {
    const searchResults = document.getElementById('search-results');
    
    // Show loading state
    searchResults.innerHTML = '<div class="search-loading">Searching...</div>';
    searchResults.style.display = 'block';
    
    // Simulate search (in a real implementation, this would be an API call)
    setTimeout(() => {
        const results = searchPrompts(query);
        displaySearchResults(results, query);
    }, 200);
}

function searchPrompts(query) {
    // This is a mock search function
    // In a real implementation, you would search through your prompt data
    const mockResults = [
        {
            title: "Becoming An Expert In ChatGPT",
            description: "ChatGPT is like a personal DJ, but instead of playing music, it spins words like a pro!",
            url: "/prompts/becoming-expert-chatgpt/",
            categories: ["Business", "Marketing"]
        },
        {
            title: "Writing Blog Posts",
            description: "ChatGPT is the ultimate writing assistant when it comes to crafting killer blog posts.",
            url: "/prompts/writing-blog-posts/",
            categories: ["Business", "Marketing"]
        },
        {
            title: "Generating Content Ideas",
            description: "ChatGPT is the ultimate brainstorm buddy when it comes to generating content ideas.",
            url: "/prompts/generating-content-ideas/",
            categories: ["Marketing", "Business"]
        }
    ];
    
    // Filter results based on query
    return mockResults.filter(result => 
        result.title.toLowerCase().includes(query.toLowerCase()) ||
        result.description.toLowerCase().includes(query.toLowerCase()) ||
        result.categories.some(cat => cat.toLowerCase().includes(query.toLowerCase()))
    ).slice(0, 5);
}

function displaySearchResults(results, query) {
    const searchResults = document.getElementById('search-results');
    
    if (results.length === 0) {
        searchResults.innerHTML = `
            <div class="search-no-results">
                <p>No results found for "${query}"</p>
                <a href="/prompts/" class="search-all-link">Browse all prompts</a>
            </div>
        `;
    } else {
        const resultsHTML = results.map(result => `
            <a href="${result.url}" class="search-result-item">
                <h4 class="search-result-title">${highlightQuery(result.title, query)}</h4>
                <p class="search-result-description">${highlightQuery(result.description, query)}</p>
                <div class="search-result-categories">
                    ${result.categories.map(cat => `<span class="category-tag">${cat}</span>`).join('')}
                </div>
            </a>
        `).join('');
        
        searchResults.innerHTML = resultsHTML + `
            <div class="search-footer">
                <a href="/search/?q=${encodeURIComponent(query)}" class="search-all-link">
                    View all results for "${query}"
                </a>
            </div>
        `;
    }
    
    searchResults.style.display = 'block';
}

function highlightQuery(text, query) {
    const regex = new RegExp(`(${query})`, 'gi');
    return text.replace(regex, '<mark>$1</mark>');
}

function hideSearchResults() {
    const searchResults = document.getElementById('search-results');
    if (searchResults) {
        searchResults.style.display = 'none';
    }
}

// Mobile menu functionality
function initializeMobileMenu() {
    const toggleBtn = document.getElementById('mobile-menu-toggle');
    const navMenu = document.getElementById('navbar-nav');
    
    if (!toggleBtn || !navMenu) return;
    
    toggleBtn.addEventListener('click', function() {
        navMenu.classList.toggle('active');
        toggleBtn.classList.toggle('active');
        
        // Animate hamburger lines
        const lines = toggleBtn.querySelectorAll('.hamburger-line');
        if (toggleBtn.classList.contains('active')) {
            lines[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
            lines[1].style.opacity = '0';
            lines[2].style.transform = 'rotate(-45deg) translate(7px, -6px)';
        } else {
            lines[0].style.transform = 'none';
            lines[1].style.opacity = '1';
            lines[2].style.transform = 'none';
        }
    });
    
    // Close mobile menu when clicking on nav links
    const navLinks = navMenu.querySelectorAll('.nav-link');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            navMenu.classList.remove('active');
            toggleBtn.classList.remove('active');
            
            const lines = toggleBtn.querySelectorAll('.hamburger-line');
            lines[0].style.transform = 'none';
            lines[1].style.opacity = '1';
            lines[2].style.transform = 'none';
        });
    });
}

// Category filter functionality
function initializeCategoryFilter() {
    const categoryBtns = document.querySelectorAll('.category-btn');
    const promptCards = document.querySelectorAll('.prompt-card');
    
    if (categoryBtns.length === 0) return;
    
    categoryBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const category = this.dataset.category;
            
            // Update active state
            categoryBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // Filter prompt cards
            if (promptCards.length > 0) {
                filterPromptCards(category, promptCards);
            } else {
                // If we're not on a page with prompt cards, navigate to the category page
                if (category === 'all') {
                    window.location.href = '/prompts/';
                } else {
                    window.location.href = `/category/${category}/`;
                }
            }
        });
    });
}

function filterPromptCards(category, cards) {
    cards.forEach(card => {
        const cardCategories = card.dataset.categories ? card.dataset.categories.split(',') : [];
        
        if (category === 'all' || cardCategories.includes(category)) {
            card.style.display = 'block';
            card.style.animation = 'fadeIn 0.3s ease';
        } else {
            card.style.display = 'none';
        }
    });
}

// Prompt cards functionality
function initializePromptCards() {
    const promptCards = document.querySelectorAll('.prompt-card');
    
    promptCards.forEach(card => {
        // Add hover analytics
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-4px)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
        
        // Track clicks for analytics
        card.addEventListener('click', function(e) {
            const promptTitle = this.querySelector('.prompt-card-title')?.textContent;
            const promptCategory = this.dataset.categories;
            
            // Analytics tracking (implement your preferred analytics service)
            if (typeof gtag !== 'undefined') {
                gtag('event', 'prompt_click', {
                    'event_category': 'engagement',
                    'event_label': promptTitle,
                    'custom_parameter_1': promptCategory
                });
            }
        });
    });
}

// Utility functions
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

function throttle(func, limit) {
    let inThrottle;
    return function() {
        const args = arguments;
        const context = this;
        if (!inThrottle) {
            func.apply(context, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    }
}

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Lazy loading for images
if ('IntersectionObserver' in window) {
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });
    
    document.querySelectorAll('img[data-src]').forEach(img => {
        imageObserver.observe(img);
    });
}

// Add search results styles
const searchStyles = `
<style>
.search-loading {
    padding: 1rem;
    text-align: center;
    color: var(--text-muted);
}

.search-no-results {
    padding: 2rem;
    text-align: center;
}

.search-no-results p {
    margin-bottom: 1rem;
    color: var(--text-secondary);
}

.search-all-link {
    color: var(--primary-color);
    font-weight: 500;
    padding: 0.5rem 1rem;
    border: 1px solid var(--primary-color);
    border-radius: var(--radius-md);
    display: inline-block;
    transition: all 0.2s ease;
}

.search-all-link:hover {
    background: var(--primary-color);
    color: white;
}

.search-result-item {
    display: block;
    padding: 1rem;
    border-bottom: 1px solid var(--border-light);
    color: var(--text-primary);
    transition: background-color 0.2s ease;
}

.search-result-item:hover {
    background: var(--surface-color);
    color: var(--text-primary);
}

.search-result-title {
    font-size: 1rem;
    font-weight: 600;
    margin-bottom: 0.5rem;
}

.search-result-description {
    font-size: 0.875rem;
    color: var(--text-secondary);
    margin-bottom: 0.5rem;
}

.search-result-categories {
    display: flex;
    gap: 0.25rem;
    flex-wrap: wrap;
}

.search-footer {
    padding: 1rem;
    text-align: center;
    border-top: 1px solid var(--border-light);
    background: var(--surface-color);
}

mark {
    background: #fef08a;
    color: inherit;
    padding: 0 2px;
    border-radius: 2px;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>
`;

// Inject search styles
document.head.insertAdjacentHTML('beforeend', searchStyles);

