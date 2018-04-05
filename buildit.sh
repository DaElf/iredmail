sudo mkdir -p /usr/local/etc/ssl/{keys,certs}
sudo openssl genrsa -out /usr/local/etc/ssl/keys/poudriere.key 4096
sudo openssl rsa -in /usr/local/etc/ssl/keys/poudriere.key -pubout -out /usr/local/etc/ssl/certs/poudriere.cert

sudo rsync -av fbsd_ports/ /usr/local/poudriere/ports/default/mail/iRedMail-packages/
sudo  cp fbsd_make.conf /usr/local/etc/poudriere.d/default-make.conf

sudo mkdir /usr/ports/distfiles
sudo poudriere bulk -j freebsd_11-1x64 -f p_build | & tee OUT
