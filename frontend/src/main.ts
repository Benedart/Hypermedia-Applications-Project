import { createApp } from 'vue'
import { createPinia } from 'pinia'
import App from './App.vue'

import { createRouter, createWebHashHistory } from 'vue-router'

import './assets/main.css'
import './utils/common'

import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"

import Home from './views/Home.vue'
import Projects from './views/Projects.vue'
import ProjectDetails from './views/ProjectDetails.vue'
import Areas from './views/Areas.vue'
import People from './views/People.vue'
import About from './views/About.vue'
import Contact from './views/Contacts.vue'
import Featured from './views/FeaturedProjects.vue'

const routes = [
    { path: '/', component: Home },
    { path: '/about', component: About },
    { path: '/contact', component: Contact },
    { path: '/projects', component: Projects },
    { path: '/project/:projectid', component: ProjectDetails },
    { path: '/areas', component: Areas },
    { path: '/people', component: People },
    { path: '/featured', component: Featured },
    { path: '/:pathMatch(.*)*', name: 'not-found', component: Home },
]

const router = createRouter({
    // 4. Provide the history implementation to use. We are using the hash history for simplicity here.
    history: createWebHashHistory(),
    routes, // short for `routes: routes`
})

// 5. Create and mount the root instance.
const app = createApp(App)
// Make sure to _use_ the router instance to make the
// whole app router-aware.
app.use(router)

app.use(createPinia())

app.mount('#app')