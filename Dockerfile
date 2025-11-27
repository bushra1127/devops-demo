FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Remove default nginx landing page
RUN rm -f /usr/share/nginx/html/*

COPY index.html .
COPY index.css .

# If you have images like logo.svg or assets, copy them:
#COPY logo.svg .



EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
