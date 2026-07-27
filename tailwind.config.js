/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{ts,tsx}'],
  theme: {
    extend: {
      colors: {
        bg: {
          900: '#0a0a0a',
          800: '#141414',
          700: '#1f1f1f',
          600: '#2a2a2a'
        },
        accent: {
          blue: '#3b82f6',
          orange: '#f97316'
        }
      },
      fontFamily: {
        sans: ['Inter', 'system-ui', 'sans-serif'],
        mono: ['JetBrains Mono', 'monospace']
      }
    }
  },
  plugins: []
}
