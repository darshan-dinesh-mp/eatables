/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./*.{html,js,php}"],
  theme: {
    extend: {
      colors: {
          brand: "#F9BB21",
          "off-brand": "rgb(255,255,255,39%)",
          "btn-black": "rgb(93,93,93,72%)",
          dense: "#000000",
          white: "#E9F3F8",
          "white-op": "rgb(255,255,255,50%)",
          "black-op": "rgb(0,0,0,50%)",
      },
      backgroundImage: {
          img: "url(../media/images/BgCover.webp)",
      },
      fontFamily: {
          poppy: ["Poppins", "sans-serif"],
          colvet: ["Coolvetica", "sans-serif"],
      },
  },
  },
  plugins: [],
}
