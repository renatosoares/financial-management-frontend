module.exports = {
    css: {
        loaderOptions: {
            css: {
                // options here will be passed to css-loader
            },
            scss: {
                prependData: `@import "~@/styles/main.scss";`
            },
        }
    }
}
