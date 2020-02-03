FROM httpd:2.4.41

RUN htpasswd -b -c /usr/local/apache2/.htpasswd admin 123456 &&\
    cat /usr/local/apache2/.htpasswd

RUN cd /usr/local/apache2/conf/ &&\
    touch my.conf &&\
    echo "<Directory \"/usr/local/apache2/htdocs/\">" >> ./my.conf &&\
    echo "    AuthType Basic" >> ./my.conf &&\
    echo "    AuthName \"Restricted Content\"" >> ./my.conf &&\
    echo "    AuthUserFile /usr/local/apache2/.htpasswd" >> ./my.conf &&\
    echo "    Require valid-user" >> ./my.conf &&\
    echo "</Directory>" >> ./my.conf &&\
    echo "Include conf/my.conf" >> ./httpd.conf







