import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'

import vue from '@vitejs/plugin-vue'

import FullReload from 'vite-plugin-full-reload'
import WindiCSS from "vite-plugin-windicss"

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    RubyPlugin(),
    vue(),
    WindiCSS({
      root: __dirname,
      scan: {
        fileExtensions: ['erb', 'haml', 'html', 'vue', 'js', 'ts', 'jsx', 'tsx'],
        dirs: ['app/views', 'app/frontend'], // or app/javascript, or app/packs
      },
    }),
    FullReload(['config/routes.rb', 'app/views/**/*']),
  ],
})
