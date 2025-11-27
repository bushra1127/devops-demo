FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY index.html .
COPY index.css .

# If you have images like logo.svg or assets, copy them:
COPY logo.svg .

# Remove default nginx index page
RUN rm -f /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
