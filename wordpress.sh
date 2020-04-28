#Wordpress paigaldus

#Kontrollib, kas Apache on olemas, vajadusel paigaldab
APACHE2=$(dpkg-query -W -f="${Status}" apache2 2>/dev/null | grep -c "ok installed")
if [ $APACHE2 -eq 0 ]; then
echo "Apache paigaldamine"
apt install apache2
echo "Apache on paigaldatud"
service apache2 start
elif [ $APACHE2 -eq 1 ]; then
echo "Apache on seadmes juba olemas"
service apache2 start
fi

#Kontrollib Mysql olemasolu, vajadusel paigaldab
MYSQL=$(dpkg-query -W -f="${status}" mysql-server 2>/dev/null | grep -c "ok installed")
echo "Mysql paigaldamine"
apt install mysql-server
echo "Mysql on paigaldatud"
touch $HOME/.my.cnf
echo "[client]" >> $HOME/.my.cnf
echo "host = localhost" >> $HOME/.my.cnf
echo "user = root" >> $HOME/.my.cnf
echo "password = qwerty" >> $HOME/.my.cnf
echo "Mysql on juba olemas"

#Kontrollib Php olemasolu, vajadusel paigaldab
PHP=$(dpkg-query -W -f="${status}" php7.0 2>/dev/null | grep -c "ok installed")
if [ $PHP -eq 0 ]; then
echo "Php paigaldamine"
apt install php7.0 libapache2-mod-php7.0 php7.0-mysql
echo "Php on paigaldatud"
which php
elif [ $PHP -eq 1]; then
echo "Php on juba olemas"
which php
fi

#Wordpress installeerimine
wget https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp wordpress/wp-config-sample.php wordpress/wp-config.php
mv wordpress /var/www/html

#Andmebaasi tegemine
CREATE DATABASE wordpress;
CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';
FLUSH PRIVILEGES;

#The End
