#Php paigaldus

#Kontroll
PHP=$(dpkg-query -W -f="${status}" php7.0 2>/dev/null | grep -c "ok installed")

#Kui = 0 siis annab teate ja installib Php ja vaatab olemasolu
if [ $PHP -eq 0 ]; then
echo "Php paigaldamine"
apt install php7.0 libapache2-mod-php7.0 php7.0-mysql
echo "Php on paigaldatud"
which php

#Kui Php väärtus = 1, siis teenus on paigaldatud ja kontrollib selle olemasolu
elif [ $PHP -eq 1]; then
echo "Php on paigaldatud"
which php
fi

#The End
