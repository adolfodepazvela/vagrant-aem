#!/bin/bash
echo "Provisioning Publisher virtual machine..."
AEM_PATH="/aem/publisher"

if [ ! -f "/aem/publisher/installed.aem" ]; then
	echo "set Locale"
	sudo locale-gen en_US en_US.UTF-8
	sudo dpkg-reconfigure locales
 
	./quickstart &>/dev/null
else
	cd $AEM_PATH/crx-quickstart/bin
	./quickstart &>/dev/null
fi

echo "Finished provisioning."