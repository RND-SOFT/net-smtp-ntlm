#!/bin/bash

gem build net-smtp-ntlm.gemspec
ver=$(gem build --force net-smtp-ntlm.gemspec | grep "Version:" | awk '{print $2}')

curl -f -u $1:$2 --upload-file ./net-smtp-ntlm-${ver}.gem https://qlibrary.rnds.pro/repository/internal/gems/ || { echo 'Issue with uploading'; exit 1; }
echo 'Gem uploaded'
