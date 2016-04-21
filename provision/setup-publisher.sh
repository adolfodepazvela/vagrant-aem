#!/bin/bash
echo "Provisioning Publisher virtual machine..."
AEM_PATH="/aem/publisher"

if [ ! -f "/aem/publisher/installed.aem" ]; then
	echo "Updating"
	rsync -a -v --ignore-existing /tmp/install/aem-61.jar $AEM_PATH/cq-publish-4502.jar
	rsync -a -v --ignore-existing /tmp/install/license.properties $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/oak-run-1.2.2.jar $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/compaction.sh $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/aemInstaller.py $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/resources-auth/postInstallHook.py $AEM_PATH
	rsync -a -v --ignore-existing /tmp/install/resources-auth/packagelist.txt $AEM_PATH
	cd $AEM_PATH
	java -Djava.awt.headless=true -Xmx2048m -jar cq-author-4502.jar -unpack -r nosamplecontent
	mkdir $AEM_PATH/crx-quickstart/install
	# rsync -a -v --ignore-existing -f /tmp/install/org.apache.sling.commons.log.LogManager.config $AEM_PATH/crx-quickstart/install/org.apache.sling.commons.log.LogManager.config
	# rsync -a -v --ignore-existing -f /tmp/install/org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService.cfg $AEM_PATH/crx-quickstart/install/org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService.cfg
	rsync -a -v --ignore-existing -f /tmp/install/resources-auth/quickstart $AEM_PATH/crx-quickstart/bin
	python aemInstaller.py -i cq-publish-4503.jar -r publish -p 4503
	cat > $AEM_PATH/installed.aem
	cd $AEM_PATH/crx-quickstart/bin
	./quickstart &>/dev/null
else
	cd $AEM_PATH/crx-quickstart/bin
	./quickstart &>/dev/null
fi

echo "Finished provisioning."