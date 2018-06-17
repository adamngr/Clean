# LinuxClean

Ce script a pour but de reunir les commandes consacrés aux mises à jour et au nettoyage de l'OS, détaillés sur le site web de la documentation de Ubuntu, ainsi que de les executer.

Pour lancer le script :

      $ chmod +x clean.sh
      $ ./clean.sh

<p align="center">
  <src="https://image.noelshack.com/fichiers/2018/24/7/1529262812-capture-du-2018-06-17-21-12-24.png">
</p>

Les commandes prises en charge par ce script sont :

      $ sudo apt-get update -y
      $ sudo apt-get upgrade -y
      $ sudo apt-get autoclean -y
      $ sudo apt-get clean -y
      $ sudo apt-get autoremove -y
      $ sudo aptitude purge '~c' -y
      $ find ~/.thumbnails -type f -atime +7 -delete
      $ rm -rf ~/.local/share/Trash/*
      $ find ~/ -name '*~' -exec rm {} \;
      $ sudo rm /var/crash/*

Pour plus de détails :
   - https://doc.ubuntu-fr.org/gestionnaire_de_mises_a_jour
   - https://doc.ubuntu-fr.org/nettoyer_ubuntu
