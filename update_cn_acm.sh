aws elbv2 remove-listener-certificates --listener-arn arn:aws-cn:elasticloadbalancing:cn-northwest-1:594599074856:listener/app/jira-confluence/601e1a6a9eb76428/86ab1c67364146d0 --certificates CertificateArn=arn:aws-cn:iam::594599074856:server-certificate/example.com.new
aws elb set-load-balancer-listener-ssl-certificate --load-balancer-name bitbucket --load-balancer-port 8443 --ssl-certificate-id CertificateArn="arn:aws-cn:iam::594599074856:server-certificate/example.com-20200315"
aws elb set-load-balancer-listener-ssl-certificate --load-balancer-name ldap --load-balancer-port 636 --ssl-certificate-id CertificateArn="arn:aws-cn:iam::594599074856:server-certificate/example.com-20200315"
aws elb set-load-balancer-listener-ssl-certificate --load-balancer-name ldap --load-balancer-port 8443 --ssl-certificate-id CertificateArn="arn:aws-cn:iam::594599074856:server-certificate/example.com-20200315"

echo remove old cert
sleep 20
aws elbv2 describe-listener-certificates --listener-arn  arn:aws-cn:elasticloadbalancing:cn-northwest-1:594599074856:listener/app/jira-confluence/601e1a6a9eb76428/86ab1c67364146d0
aws iam list-server-certificates
sleep 20
aws iam update-server-certificate --server-certificate-name example.com.new --new-server-certificate-name example.com.new-v2
echo update cert with a new name
sleep 30
aws iam update-server-certificate --server-certificate-name example.com.new-v2 --new-server-certificate-name example.com.new
aws iam list-server-certificates
echo update cert name
sleep 10
echo assign cert to listener
aws elbv2 add-listener-certificates --listener-arn arn:aws-cn:elasticloadbalancing:cn-northwest-1:594599074856:listener/app/jira-confluence/601e1a6a9eb76428/86ab1c67364146d0 --certificates CertificateArn=arn:aws-cn:iam::594599074856:server-certificate/example.com.new
sleep 10
aws elb set-load-balancer-listener-ssl-certificate --load-balancer-name bitbucket --load-balancer-port 8443 --ssl-certificate-id CertificateArn="arn:aws-cn:iam::594599074856:server-certificate/example.com.new"
aws elb set-load-balancer-listener-ssl-certificate --load-balancer-name ldap --load-balancer-port 636 --ssl-certificate-id CertificateArn="arn:aws-cn:iam::594599074856:server-certificate/example.com.new"
aws elb set-load-balancer-listener-ssl-certificate --load-balancer-name ldap --load-balancer-port 8443 --ssl-certificate-id CertificateArn="arn:aws-cn:iam::594599074856:server-certificate/example.com.new"
sleep 10
aws elbv2 describe-listener-certificates --listener-arn  arn:aws-cn:elasticloadbalancing:cn-northwest-1:594599074856:listener/app/jira-confluence/601e1a6a9eb76428/86ab1c67364146d0
