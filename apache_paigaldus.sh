#Apache kontroll ja paigaldus


#Kontrollib, kas apache on olemas
APACHE2=$(dpkg-query -W -f="${Status}" apache2 2>/dev/null | grep -c "ok installed")

#Kui väärus on 0, siis ei ole Apache installitud
if [ $APACHE2 -eq 0 ]; then

#Väljastab teate, et paigaldab apache
echo "Apache paigaldamine"
apt install apache2
echo "Apache paigaldamine oli edukas"

#Käivitab service, kui on isntallitud ja näitab ka staatust
service apache2 start
service apache2 status

#Kui väärtus = 1 siis on Apache olemas ja selle kohta väljastame ka teate
elif [ $APACHE2 -eq 1 ]; then
echo "Apache on juba paigaldatud"

#Näitab, kas Apache töötab
service apache2 start
service apache2 status
fi

#The End
