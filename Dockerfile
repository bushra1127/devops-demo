FROM nginx:alpine

WORKDIR /usr/share/nginx/html

COPY index.html .
COPY index.css .
COPY message.txt .

# If you have images or other assets, copy them too
# COPY assets/ ./assets/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
