sudo apt update
sudo apt upgrade -y

sudo apt install apache2 libapache2-mod-php openssl php-imagick php-common php-curl php-gd php-imap php-intl php-json php-ldap php-mbsstring php-mysql php-smbclient php-ssh2 php-sqlite3 php-xml php-zip -y
sudo apt install php -y

sudo systemctl start apache2

cd /var/www/html
sudo mkdir Gestion_Usuarios

cd Gestion_Usuarios
git clone https://github.com/josejuansanchez/iaw-practica-lamp.git

sudo mv iaw-practica-lamp/ /var/www/html/Gestion_Usuarios/
sudo rm -r db
sudo rm README.md

sudo chmod 755 -R /var/www/html/Gestion_Usuarios/src
sudo chown vagrant:vagrant -R /var/www/html/Gestion_Usuarios/src

cd /etc/apache2/sites-available/
sudo cp 000-default.conf gest-user.conf

sudo bash -c 'cat <<EOF > /etc/apache2/sites-available/gest-user.conf
<VirtualHost *:80>
    DocumentRoot /var/www/html/Gestion_Usuarios/src
    <Directory /var/www/html/Gestion_Usuarios/src>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF'

sudo a2dissite 000-default.conf
sudo a2ensite gest-user.conf

sudo systemctl restart apache2