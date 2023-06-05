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
  }
}
