#!/bin/bash

echo "Creation d une virtual box"
echo 'Creation du Vagrantfile'

echo 'Entrer le nom de votre nouvelle VM'
read  VMName
 while [[ $VMName = '' ]]
 do
 echo 'champ invalide'
 read VMName 
done

echo 'Entrer un nombre afin de remplacer xx pour personaliser votre ip ( 192.168.33.xx )'
read  IPnbr
 while [[ $IPnbr -le "10" ||  $IPnbr -ge "255" ]]
 do
 echo 'Vous n avez pas donner une valeur comprise entre 10 et 255 comprie'
 read  IPnbr
done

echo 'Entrer le nom de votre fichier commun/passerelle'
read nomdata
 while [[ $nomdata = '' ]]
 do
 echo 'champ invalide'
 read nomdata
done

echo 'creation du fichier commun'
mkdir $nomdata

echo 'creation du scripte Apache2 dans le dossier commun'
ApacheScript="$nomdata/ApacheScript"
/bin/cat <<EOM >$nomdata/ApacheScript
#!/bin/bash

sudo apt update
sudo apt install apache2 -y
EOM


echo 'creation du Vagrantfil'
Vagrantfile="./Vagrantfile"
/bin/cat <<EOM >Vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "192.168.33.$IPnbr"
  config.vm.synced_folder "./$nomdata", "/var/www/html/"
  config.vm.provider "virtualbox" do |v|
    v.name = "$VMName"
  end
end
EOM

echo 'Allumage de la machine'
vagrant up

echo 'Entrée dans la Matris'
vagrant ssh
