certbot certonly  --dns-route53 --dns-route53-propagation-seconds 30 --agree-tos  -d *.example.com --config-dir cert/conf --work-dir cert/work --logs-dir cert/log


