#Phpmyadmin paigaldus

#Kontrollib, kas tarkvara on juba olemas või vajab installeerimist
PMA=$(dpkg-query -W -f="${status}" phpmyadmin 2>/dev/null | grep -c "ok installed")

#Kui PMA väärtus = null siis ta installeerib ja paigaldab teenuse, ning annab sellest ka teada
if [ $PMA -eq 0 ]; then
echo "Phpmyadmin paigaldamine"
apt install phpmyadmin
echo "Phpmyadmin on paigaldatud"

#Kui PMA väärtus = 1, siis annab sellest teada
echo "Phpmyadmin on juba paigaldatud"
fi

#The End
