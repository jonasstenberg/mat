// next.config.js
module.exports = {
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'mat.old.stenberg.io',
        port: '',
        pathname: '/images/**'
      }
    ]
  }
}
