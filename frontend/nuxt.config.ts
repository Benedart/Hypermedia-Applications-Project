// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
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
