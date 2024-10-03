/** @type {import('tailwindcss').Config} */
export default {
  content: ["./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}"],
  theme: {
    extend: {
      colors: {
        main: "var(--main)",
        content: "var(--content)",
        primary: {
          10: "color-mix(in srgb, var(--primary), transparent 90%)",
          20: "color-mix(in srgb, var(--primary), transparent 80%)",
          30: "color-mix(in srgb, var(--primary), transparent 70%)",
          40: "color-mix(in srgb, var(--primary), transparent 60%)",
          50: "color-mix(in srgb, var(--primary), transparent 50%)",
          60: "color-mix(in srgb, var(--primary), transparent 40%)",
          70: "color-mix(in srgb, var(--primary), transparent 30%)",
          80: "color-mix(in srgb, var(--primary), transparent 20%)",
          90: "color-mix(in srgb, var(--primary), transparent 10%)",
          100: "var(--primary)",
        },
        secondary: "var(--secondary)",
        accent: {
          1: "var(--accent1)",
          2: "var(--accent2)",
          3: "var(--accent3)",
        },
        accent_gradient: "var(--accent-gradient)",
      },
    },
  },
  plugins: [],
};
