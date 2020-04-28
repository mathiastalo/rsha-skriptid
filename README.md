# Automatiseeritud skriptid kasutamiseks.
## Paigaldamine
Siin on olemas erinevad automatiseeritud skriptid alates Apache serveri paigaldamisest lõpetades Wordpress paigaldusega.
Skripte saab käivitada käsuga
```
sh apache_paigaldus.sh
```
### Git paigaldamine ja seadistamine
```
apt install git
git config --global user.name "Ees Perenimi"
git confug --global user.email email@domeen.com
git config --global core.editor nano
```

Iga skripti eesmärk on installeerida või kontrollida mingi tarkvara olemasolu.

Skriptide paigaldamise järjekord
1. apache
2. mysql
3. php
4. phpmyadmin
5. Wordpress

---
Küsimuste korral kirjutada mathias.talo@khk.ee
---

Ansible skriptide vaatamiseks mine https://github.com/mathiastalo/ansible_skriptid
