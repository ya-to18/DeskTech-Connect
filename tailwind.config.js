module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  plugins: [
    require('daisyui')
  ],
  theme: {
    extend: {
      height: {
        '576': '36rem',
      },
      width: {
        '928': '58rem',
        '640': '40rem'
      }
    }
  }
}
