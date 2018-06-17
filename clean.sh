#!/bin/sh

UPDATE=false
UPGRADE=false
AUTOCLEAN=false
CLEAN=false
AUTOREMOVE=false
AUTOPURGE=false
THUMBS=false
CORBEILLE=false
HOMETEMP=false
OLDERRORS=false
HELP=false

sudo echo ""
echo "*************************************************"
echo "***  --------------------------------------   ***"
echo "***   \033[1;5mSCRIPT DE MAINTENANCE JOURNALIER v0.1\033[0m   ***"
echo "***  --------------------------------------   ***"
echo "***                                           ***"
echo "*** \033[32mupdate, upgrade, clean, autoremove, purge\033[0m ***"
echo "***      \033[32mcookies, temporary files, ect\033[0m        ***"
echo "***                                           ***"
echo "*************************************************"
echo ""
echo "       ║  [\033[32m01\033[0m]     \033[32mAll Setings\033[0m"
echo "       ║  [\033[32m02\033[0m]     \033[32mUpdate & Upgrade\033[0m"
echo "       ║  [\033[32m03\033[0m]     \033[32mClean\033[0m"
echo "       ║  [\033[32m04\033[0m]     \033[32mHelp\033[0m"
echo "       ║  [\033[32m05\033[0m]     \033[32mExit\033[0m"
echo "       ║  "
read -p "       ╚═══► " prog


if [ $prog -eq 04 ] ; then
	HELP=true
elif [ $prog -eq 01 ] ;  then
	UPDATE=true
	UPGRADE=true
	AUTOCLEAN=true
	CLEAN=true
	AUTOREMOVE=true
	AUTOPURGE=true
	THUMBS=true
	CORBEILLE=true
	HOMETEMP=true
	OLDERRORS=true
elif [ $prog -eq 02 ] ; then
	UPDATE=true
	UPGRADE=true
elif [ $prog -eq 03 ] ; then
	AUTOCLEAN=true
	CLEAN=true
	AUTOREMOVE=true
	AUTOPURGE=true
	THUMBS=true
	CORBEILLE=true
	HOMETEMP=true
	OLDERRORS=true
elif [ $prog -eq 05 ] ; then
	exit
else 
	exit
fi

if [ "$HELP" = true ] ; then
	echo ""
	echo "      \033[1m                HELP                 \033[0m"
	echo ""
	echo "  Ce script a pour but de reunir les commandes"
	echo "  consacré aux mises à jour et au nettoyage de"  
	echo "  l'OS, détaillés sur le site web de la documentation"
	echo "  de Ubuntu, ainsi que de les executer."
	echo ""
	echo "  Les commandes prises en charge par ce script sont :"
	echo ""
	echo "      \033[33m$ sudo apt-get update -y\033[0m"
	echo "      \033[33m$ sudo apt-get upgrade -y\033[0m"
	echo "      \033[33m$ sudo apt-get autoclean -y\033[0m"
	echo "      \033[33m$ sudo apt-get clean -y\033[0m"
	echo "      \033[33m$ sudo apt-get autoremove -y\033[0m"
	echo "      \033[33m$ sudo aptitude purge '~c' -y\033[0m"
	echo "      \033[33m$ find ~/.thumbnails -type f -atime +7 -delete\033[0m"
	echo "      \033[33m$ rm -rf ~/.local/share/Trash/*\033[0m"
	echo "      \033[33m$ find ~/ -name '*~' -exec rm {} \;\033[0m"
	echo "      \033[33m$ sudo rm /var/crash/*\033[0m"
	echo ""
	echo "   Pour plus de détails :"
	echo "   - https://doc.ubuntu-fr.org/gestionnaire_de_mises_a_jour"
	echo "   - https://doc.ubuntu-fr.org/nettoyer_ubuntu"
	echo ""
	read -p "  Souhaitez-vous relancer le programme ? [O/n] " ans
	if [ $ans = 'O' -o $ans = 'o' ] ; then
		ScriptLoc=$(readlink -f "$0")
		exec "$ScriptLoc"
	else
		exit
	fi
fi

echo ""
echo "*************************************************"
echo "***                                           ***"
echo "***       \033[31mrunning script in 10 seconds...\033[0m     ***"
echo "***           \033[31mpress CTRL+Z to cancel\033[0m          ***"
echo "***                                           ***"
echo "*************************************************"
sleep 4
echo "\033[32mMise à jour du Système...\033[0m"
sleep 1
echo "\033[32mMise à jour du Système... ... >> 5\033[0m"
sleep 1
echo "\033[32mMise à jour du Système... ... ... >> 4\033[0m"
sleep 1
echo "\033[32mMise à jour du Système... ... ... ... >> 3\033[0m"
sleep 1
echo "\033[32mMise à jour du Système... ... ... ... ... >> 2\033[0m"
sleep 1
echo "\033[32mMise à jour du Système... ... ... ... ... ... >> 1\033[0m"
sleep 1


if [ "$UPDATE" = true ] ; then
	echo "\033[32m>> MISE À JOUR DE L'INDEX DES LIBRAIRIES\033[0m"
	echo "\033[33msudo apt-get update -y\033[0m"
	sleep 1
	sudo apt update -y
	sudo apt-get update -y
fi

if [ "$UPGRADE" = true ] ; then
	echo "\033[32m>> MISE À JOUR DES PAQUETS\033[0m"
	echo "\033[33msudo apt-get upgrade -y\033[0m"
	sleep 1
	sudo apt upgrade -y
	sudo apt-get upgrade -y
fi

if [ "$AUTOCLEAN" = true ] ; then
	echo "\033[32m>> SUPPRESSION DU CACHE DES PAQUETS PÉRIMÉS\033[0m"
	echo "\033[33msudo apt-get autoclean -y\033[0m"
	sleep 1
	sudo apt-get autoclean -y
fi

if [ "$CLEAN" = true ] ; then
	echo "\033[32m>> SUPPRESSION DU CACHE\033[0m"
	echo "\033[33msudo apt-get clean -y\033[0m"
	sleep 1
	sudo apt-get clean -y
fi

if [ "$AUTOREMOVE" = true ] ; then
	echo "\033[32m>> SUPPRESSION DES DÉPENDANCES OBSOLÈTES\033[0m"
	echo "\033[33msudo apt-get autoremove -y\033[0m"
	sleep 1
	sudo apt-get autoremove -y
fi

if [ "$AUTOPURGE" = true ] ; then
	echo "\033[32m>> SUPPRESSION DES FICHIERS DE PAQUETS AYANT ÉTÉ SUPPRIMÉS MAIS NON PURGÉS\033[0m"
	echo "\033[33msudo aptitude purge '~c' -y\033[0m"
	sleep 1
	sudo aptitude purge '~c' -y
fi

if [ "$THUMBS" = true ] ; then
	echo "\033[32m>> SUPPRESSION DES MINIATURES\033[0m"
	echo "\033[33mfind ~/.thumbnails -type f -atime +7 -delete\033[0m"
	sleep 1
	find ~/.thumbnails -type f -atime +7 -delete
fi


if [ "$CORBEILLE" = true ] ; then
	echo "\033[32m>> SUPPRESSION DE LA CORBEILLE\033[0m"
	echo "\033[33mrm -rf ~/.local/share/Trash/*\033[0m"
	sleep 1
	rm -rf ~/.local/share/Trash/*
fi

if [ "$HOMETEMP" = true ] ; then
	echo "\033[32m>> SUPPRESSION DES FICHIERS TEMPORAIRES DU DOSSIER HOME\033[0m"
	echo "\033[33mfind ~/ -name '*~' -exec rm {} \;\033[0m"
	sleep 1
	find ~/ -name '*~' -exec rm {} \;
fi

if [ "$OLDERRORS" = true ] ; then
	echo "\033[32m>> SUPPRESSION DES LOGS D'ANCIENNES ERREURS\033[0m"
	echo "\033[33msudo rm /var/crash/*\033[0m"
	sleep 1
	sudo rm /var/crash/*
fi

echo "\033[32m... OK.\033[0m"
read -p "Appuyez sur une touche pour continuer." xd


