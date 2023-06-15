// next.config.js
module.exports = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'mat.stenberg.io',
        port: '',
        pathname: '/images/**'
      }
    ]
  },
  headers:
    process.env.NODE_ENV === 'development'
      ? () => [
        {
          source: '/_next/static/css/_app-client_src_app_globals_css.css',
          headers: [{ key: 'Vary', value: '*' }]
        }
      ]
      : undefined,
}

