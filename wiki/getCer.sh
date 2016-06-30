#!/bin/bash
 
#Required
domain=$1
commonname=$domain
 
#Change to your company details
country=US
state=North Carolina
locality=Winston-Salem
organization=TeamFairmont
organizationalunit=TeamFairmont
email=dstich@commercev3.com
 
#Optional
password=b
 
if [ -z "$domain" ]
then
    echo "Argument not present."
    echo "Useage $0 [common name]"
 
    exit 99
fi
 
echo "Generating key request for $domain"
 
#Generate a key
openssl genrsa -des3 -passout pass:$password -out key.pem 2048 -noout
 
#Remove passphrase from the key. Comment the line out to keep the passphrase
echo "Removing passphrase from key"
openssl rsa -in key.pem -passin pass:$password -out key.pem
 
#Create the request
echo "Creating cert"
openssl req -new -key key.pem -out cert.pem -passin pass:$password \
    -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
 
echo "---------------------------"
echo "-----Below is your cert.pem-----"
echo "---------------------------"
echo
cat cert.pem
 
echo
echo "---------------------------"
echo "-----Below is your Key-----"
echo "---------------------------"
echo
cat key.pem

