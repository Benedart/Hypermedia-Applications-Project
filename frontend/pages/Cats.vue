<template>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>Cats</h1>
                <div class="cat-grid">
                    <div v-for="cat in cats" class="cat-item">
                        <img class="cat-image" :src="cat.url" alt="cat" />
                    </div>
                </div>
                <div ref="scrollMarker" class="scroll-marker"></div>
            </div>
        </div>
    </div>
</template>
  
<script>
export default {
    data() {
        return {
            cats: [],
            page: 1,
        };
    },
    methods: {
        loadMoreCats() {
            const url = `https://api.thecatapi.com/v1/images/search?limit=10&page=${this.page}`;
            fetch(url)
                .then(response => response.json())
                .then(data => {
                    this.cats = this.cats.concat(data);
                    this.page++;
                })
                .catch(error => {
                    console.error('Error fetching cats:', error);
                });
        },
        handleScroll() {
            const scrollMarker = this.$refs.scrollMarker;
            const scrollOffset = scrollMarker.getBoundingClientRect().top;
            const windowHeight = window.innerHeight;

            if (scrollOffset - windowHeight <= 0) {
                this.loadMoreCats();
            }
        },
    },
    mounted() {
        this.loadMoreCats();
        window.addEventListener('scroll', this.handleScroll);
        this.handleScroll()
    },
    destroyed() {
        window.removeEventListener('scroll', this.handleScroll);
    },
};
</script>
  
<style scoped>
h1 {
    font-size: 5rem;
    font-weight: 300;
    line-height: 1.2;
    margin-bottom: 1rem;
    text-align: center;
    margin-top: 4rem;
}

.cat-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    grid-gap: 20px;
    margin: 20px;
}

.cat-item {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 200px;
    background-color: #f2f2f2;
}

.scroll-marker {
    height: 1px;
}

.cat-image {
    max-width: 100%;
    max-height: 100%;
}
</style>