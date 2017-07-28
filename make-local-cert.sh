#! /bin/sh
openssl genrsa -out localhost.key 1024
# if you get a message: unable to write 'random state'
# sudo chown socketwiz:staff ~/.rnd
# where socketwiz is your account name not mine ;)
# then run the command again

chmod 600 localhost.key

# most important field is COMMON NAME, make it "localhost" without the quotes
openssl req -new -key localhost.key -out localhost.csr

#
openssl genrsa -out ca.key 1024
openssl req -new -x509 -days 365 -key ca.key -out ca.crt

curl http://www.opensource.apple.com/source/apache_mod_ssl/apache_mod_ssl-679/mod_ssl/pkg.contrib/sign.sh?txt > sign.sh
chmod 744 sign.sh
./sign.sh localhost.csr
