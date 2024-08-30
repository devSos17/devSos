/** @type {import('tailwindcss').Config} */
export default {
  content: ["./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}"],
  theme: {
    extend: {
      colors: {
        content: "hsl(var(--content))",
        primary: "hsl(var(--primary))",
        secondary: "hsl(var(--secondary))",
        accent: {
          1: "hsl(var(--accent1))",
          2: "hsl(var(--accent2))",
          3: "hsl(var(--accent3))",
        },
        accent_gradient:
          "linear-gradient( 45deg, rgb(var(--accent1)), rgb(var(--accent2)) 30%, white 60%)",
      },
    },
  },
  plugins: [],
};
