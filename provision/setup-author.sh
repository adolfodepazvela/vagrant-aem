#!/bin/bash
echo "Provisioning Author virtual machine..."
AEM_PATH="/aem/author"

if [ ! -f "/aem/author/installed.aem" ]; then
	echo "set Locale"
	sudo locale-gen en_US en_US.UTF-8
	sudo dpkg-reconfigure locales
	sudo aptitude install ffmpeg

	./quickstart &>/dev/null
else
	cd $AEM_PATH/crx-quickstart/bin
	./quickstart &>/dev/null
fi

echo "Finished provisioning."