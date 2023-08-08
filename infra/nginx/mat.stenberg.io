server {
  listen 80;
  listen [::]:80;

  server_name mat.stenberg.io;

  if ($host = mat.stenberg.io) {
    return 301 https://$host$request_uri;
  }

  return 404;
}

server {
  listen 443 ssl http2;

  ssl_certificate /etc/letsencrypt/live/mat.stenberg.io/fullchain.pem;
  ssl_certificate_key /etc/letsencrypt/live/mat.stenberg.io/privkey.pem;

  server_name mat.stenberg.io;

  location / {
    proxy_pass http://127.0.0.1:3000; # nextjs
  }

  location /api/v1 {
    rewrite ^/api/v1/(.*)$ /$1 break;
    proxy_pass http://127.0.0.1:3001; # postgrest
  }

  location /images/ {
    autoindex on;
    alias /var/mat.stenberg.io/uploads/;
  }

  add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
  add_header X-XSS-Protection "1; mode=block";
  add_header X-Content-Type-Options nosniff;
  add_header X-Frame-Options "SAMEORIGIN";
  add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline'; img-src 'self' blob: data:; font-src 'self' https://fonts.googleapis.com;";
  add_header 'Referrer-Policy' 'strict-origin';
  add_header Permissions-Policy "fullscreen=(self)";

  proxy_pass_request_headers on;
}
