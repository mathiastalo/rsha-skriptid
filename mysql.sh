#Mysql paigaldus

#Otsib ja vajadusel paigaldab Mysql serveri tarkvara
MYSQL=$(dpkg-query -W -f="${status}" mysql-server 2>/dev/null | grep -c "ok installed")

#Kui väärtus = 0 siis paigaldab Mysql-i, vajadusel annab teate ning paigaldab teenuse
echo "Mysql paigaldamine"
apt install mysql-server
echo "Mysql on paigaldatud"

#Lisame kasutaja Mysql ilma kasutaja ja parooli lisamata
touch $HOME/.my.cnf #Lisame vajalikud konfikuratsioonid faili kasutaja kodukausta
echo "[client]" >> $HOME/.my.cnf
echo "host = localhost" >> $HOME/.my.cnf
echo "user = root" >> $HOME/.my.cnf
echo "password = qwerty" >> $HOME/.my.cnf

#Kui Mysql väärtus = 1 siis annab teate, et teenus on paigaldatud
echo "Mysql on paigaldatud"
mysql
fi

#The End
