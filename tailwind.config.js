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
      },
      animation: {
        "fade-in-fwd": "fade-in-fwd 0.5s cubic-bezier(0.390, 0.575, 0.565, 1.000)   both",
        "scale-out-horizontal": "scale-out-horizontal 0.5s cubic-bezier(0.550, 0.085, 0.680, 0.530)   both",
        "slide-in-right": "slide-in-right 0.5s cubic-bezier(0.250, 0.460, 0.450, 0.940)   both",
        "tracking-in-expand": "tracking-in-expand 1.5s cubic-bezier(0.215, 0.610, 0.355, 1.000)   both"
      },
      keyframes: {
        "fade-in-fwd": {
          "0%": {
            transform: "translateZ(-80px)",
            opacity: "0"
          },
          to: {
            transform: "translateZ(0)",
            opacity: "1"
          }
        },
        "scale-out-horizontal": {
          "0%": {
              transform: "scaleX(1)",
              opacity: "1"
          },
          to: {
              transform: "scaleX(0)",
              opacity: "1"
          }
        },
        "slide-in-right": {
          "0%": {
              transform: "translateX(1000px)",
              opacity: "0"
          },
          to: {
              transform: "translateX(0)",
              opacity: "1"
          }
        },
        "tracking-in-expand": {
          "0%": {
            "letter-spacing": "-.5em",
            opacity: "0"
          },
          "40%": {
            opacity: ".6"
          },
          to: {
            opacity: "1"
          }
        }
      }
    }
  }
}
