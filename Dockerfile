# Servidor web leve para site estático (Complementare)
FROM nginx:stable-alpine

# Remove a config padrão e usa a nossa
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Páginas
COPY index.html /usr/share/nginx/html/index.html
COPY portfolio.html /usr/share/nginx/html/portfolio.html
COPY artigos.html /usr/share/nginx/html/artigos.html
COPY cases/ /usr/share/nginx/html/cases/
COPY artigos/ /usr/share/nginx/html/artigos/

# Imagens do site
COPY img/ /usr/share/nginx/html/img/

# Ícones (favicon)
COPY favicon.ico /usr/share/nginx/html/favicon.ico
COPY favicon-32.png /usr/share/nginx/html/favicon-32.png
COPY apple-touch-icon.png /usr/share/nginx/html/apple-touch-icon.png

# SEO: sitemap, robots e imagens de compartilhamento
COPY sitemap.xml /usr/share/nginx/html/sitemap.xml
COPY robots.txt /usr/share/nginx/html/robots.txt
COPY og-image.jpg /usr/share/nginx/html/og-image.jpg
COPY og-portfolio.jpg /usr/share/nginx/html/og-portfolio.jpg

EXPOSE 80
