sudo apt update
sudo apt upgrade -y

sudo apt install mysql-server -y

sudo systemctl start mysql

git clone https://github.com/josejuansanchez/iaw-practica-lamp.git
sudo rm -r src
sudo rm README.md
mv db/* /home/vagrant/
sudo rm -r db

sudo ip route del default

sudo sed -i 's/bind-address.*/bind-address = 192.168.10.3/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo systemctl restart mysql

sudo mysql -e "CREATE USER 'carlos'@'192.168.10.2' IDENTIFIED BY '12345';"
sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'carlos'@'192.168.10.2';"
sudo mysql -e "FLUSH PRIVILEGES;"

mysql -u carlos < database.sql

