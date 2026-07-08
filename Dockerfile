# Servidor web leve para site estático (Complementare)
FROM nginx:stable-alpine

# Remove a config padrão e usa a nossa
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copia as páginas do site
COPY index.html /usr/share/nginx/html/index.html
COPY portfolio.html /usr/share/nginx/html/portfolio.html

# Copia os ícones (favicon)
COPY favicon.ico /usr/share/nginx/html/favicon.ico
COPY favicon-32.png /usr/share/nginx/html/favicon-32.png
COPY apple-touch-icon.png /usr/share/nginx/html/apple-touch-icon.png

EXPOSE 80
