*** Connections ***
** Security groups **
1. vpn sg
2. mongodb sg
3. catalogue sg
4. web_alb
5. Private ALB sg ==> app alb
6. Public ALB sg ==> web alb

*** Rules ***
1. mongodb_catalogue = mongodb is accepting connections from catalogue 
2. mongodb_vpn = mongodb is accepting connections from vpn

3. catalogue_vpn
4. catalogue_private_lb

5. private_lb_web
6. private_lb_vpn

7. web_vpn
8. web_public_lb

9. public_lb_internet