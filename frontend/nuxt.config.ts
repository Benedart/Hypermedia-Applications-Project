import { defineNuxtConfig } from 'nuxt/config';

// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    ssr: true,

    app: {
        head: {
            title: 'HyperMeow',

            meta: [
                { charset: 'utf-8' },
                { name: 'viewport', content: 'width=device-width,initial-scale=1' },
                { hid: 'description', name: 'description', content: 'HyperMeow' },
            ],

            link: [
                { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
                // bootstrap css
                { rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css' },
                { rel: 'stylesheet', href: 'https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css' }
            ],

            script: [
                // bootstrap js
                { src: 'https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js', type: 'text/javascript' },
            ],
        },

        pageTransition: {
            name: 'slide-left',
            mode: 'out-in',
        },
    },

    runtimeConfig: {
        apiSecret: '', // can be overridden by NUXT_API_SECRET environment variable
        public: {
            SERVER_URL: process.env.SERVER_URL || 'http://127.0.0.1:5000', // can be overridden by NUXT_PUBLIC_API_BASE environment variable
        }
    },

    css: [
        '@/assets/main.css',
    ],
})
