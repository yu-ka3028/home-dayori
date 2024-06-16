module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
  plugins: [require("daisyui")],
  daisyui: {
    themes: ["light", "dark", "cupcake"],
  },
  theme: {
    extend: {
      fontFamily: {
        'handwriting': ['"M PLUS Rounded 1c"', '"Zen Kaku Gothic New"', 'sans-serif']
      },
      animation: {
        "focus-in-expand": "focus-in-expand 1.8s cubic-bezier(0.250, 0.460, 0.450, 0.940) both"
      },
      keyframes: {
        "focus-in-expand": {
          "0%": {
            "letter-spacing": "-.100em",
            filter: "blur(12px)",
            opacity: "10"
          },
          to: {
            filter: "blur(0)",
            opacity: "20"
          }
        }
      }
    }
  }
}
