/** @type {import('next').NextConfig} */
const nextConfig = {
  // Habilita React Strict Mode para encontrar problemas durante o desenvolvimento
  reactStrictMode: true,
  
  // Compressão de imagens
  images: {
    domains: [
      'localhost',
      // Adicione aqui os domínios permitidos para imagens externas
      'images.unsplash.com',
      'picsum.photos',
    ],
    formats: ['image/avif', 'image/webp'],
  },
  
  // Configurações experimentais para otimizações
  experimental: {
    optimizeCss: true,      // Minifica CSS
    scrollRestoration: true, // Restaura posição de rolagem durante navegação
  },
  
  // Configuração para reduzir tamanho do pacote
  compiler: {
    // Remove console.logs em produção
    removeConsole: process.env.NODE_ENV === 'production',
  },
  
  // Configurações para PWA e mais
  // Descomentar e instalar o next-pwa para usar:
  /*
  pwa: {
    dest: 'public',
    disable: process.env.NODE_ENV === 'development',
    register: true,
  },
  */
  
  // Análise de pacotes (opcional)
  // Descomentar e instalar @next/bundle-analyzer para usar:
  /*
  webpack(config, { isServer }) {
    // Habilitar @next/bundle-analyzer
    const { BundleAnalyzerPlugin } = require('webpack-bundle-analyzer')
    if (process.env.ANALYZE === 'true') {
      config.plugins.push(
        new BundleAnalyzerPlugin({
          analyzerMode: 'server',
          analyzerPort: isServer ? 8888 : 8889,
          openAnalyzer: true,
        })
      )
    }
    return config
  },
  */
};

module.exports = nextConfig;
