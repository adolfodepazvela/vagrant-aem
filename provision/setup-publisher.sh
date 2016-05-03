#!/bin/bash
echo "Provisioning Publisher virtual machine..."
AEM_PATH="/aem/publisher"

if [ ! -f "/aem/publisher/installed.aem" ]; then
	echo "Updating"
	rsync -a -v --ignore-existing /tmp/install/aem-61.jar $AEM_PATH/cq-publish-4503.jar
	rsync -a -v --ignore-existing /tmp/install/license.properties $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/oak-run-1.2.2.jar $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/compaction.sh $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/aemInstaller.py $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/resources-pub/postInstallHook.py $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/resources-pub/packagelist.txt $AEM_PATH
	cd $AEM_PATH
	java -Djava.awt.headless=true -Xmx2048m -jar cq-publish-4503.jar -unpack -r nosamplecontent
	mkdir $AEM_PATH/crx-quickstart/install
	cp -f /tmp/install/org.apache.sling.commons.log.LogManager.config $AEM_PATH/crx-quickstart/install/org.apache.sling.commons.log.LogManager.config
	cp -f /tmp/install/org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService.cfg $AEM_PATH/crx-quickstart/install/org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService.cfg
	cp -f /tmp/install/resources-pub/start $AEM_PATH/crx-quickstart/bin
	sudo update-rc.d aemStart remove
	sudo cp -f /tmp/install/resources-pub/aemStart /etc/init.d/
	sudo chmod +x /etc/init.d/aemStart
	sudo update-rc.d aemStart defaults
	
	python aemInstaller.py -i cq-publish-4503.jar -r publish -p 4503
	cat > $AEM_PATH/installed.aem
	cd $AEM_PATH/crx-quickstart/bin
	./quickstart &>/dev/null
else
	cd $AEM_PATH/crx-quickstart/bin
	./quickstart &>/dev/null
fi

echo "Finished provisioning."