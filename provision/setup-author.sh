#!/bin/bash
echo "Provisioning Author virtual machine..."
AEM_PATH="/aem/author"

if [ ! -f "/aem/author/installed.aem" ]; then
	echo "Updating"
	rsync -a -v --ignore-existing /tmp/install/aem-61.jar $AEM_PATH/cq-author-4502.jar
	rsync -a -v --ignore-existing /tmp/install/license.properties $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/oak-run-1.2.2.jar $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/compaction.sh $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/aemInstaller.py $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/resources-auth/postInstallHook.py $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/resources-auth/packagelist.txt $AEM_PATH
	cd $AEM_PATH
	java -Djava.awt.headless=true -Xmx2048m -jar cq-author-4502.jar -unpack -r nosamplecontent
	mkdir $AEM_PATH/crx-quickstart/install
	cp -f /tmp/install/org.apache.sling.commons.log.LogManager.config $AEM_PATH/crx-quickstart/install/org.apache.sling.commons.log.LogManager.config
	cp -f /tmp/install/org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService.cfg $AEM_PATH/crx-quickstart/install/org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService.cfg
	cp -f /tmp/install/resources-auth/start $AEM_PATH/crx-quickstart/bin
	sudo update-rc.d -f aemStart remove
	sudo cp -f /tmp/install/resources-auth/aemStart /etc/init.d/
	sudo chmod +x /etc/init.d/aemStart
	sudo update-rc.d aemStart start 30 2 3 4 5 . stop 20 0 1 6 .
	
	python aemInstaller.py -i cq-author-4502.jar -r author -p 4502
	cat > $AEM_PATH/installed.aem
	cd $AEM_PATH/crx-quickstart/bin
	./quickstart &>/dev/null
else
	cd $AEM_PATH/crx-quickstart/bin
	./quickstart &>/dev/null
fi

echo "Finished provisioning."