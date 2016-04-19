#!/bin/bash
echo "Provisioning virtual machine..."
AEM_PATH="/aem/author"
# Update
echo "Updating"

cp /tmp/install/cq-author-4502.jar $AEM_PATH
cp /tmp/install/license.properties $AEM_PATH
cp /tmp/install/oak-run-1.2.2.jar $AEM_PATH
cp /tmp/install/compaction.sh $AEM_PATH
cp /tmp/install/aemInstaller.py $AEM_PATH
cp /tmp/install/resources-auth/postInstallHook.py $AEM_PATH
cp /tmp/install/resources-auth/packagelist.txt $AEM_PATH


cd $AEM_PATH
java -Djava.awt.headless=true -Xmx2048m -jar cq-author-4502.jar -unpack -r nosamplecontent
mkdir $AEM_PATH/crx-quickstart/install
cp -f /tmp/install/org.apache.sling.commons.log.LogManager.config $AEM_PATH/crx-quickstart/install/org.apache.sling.commons.log.LogManager.config
cp -f /tmp/install/org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService.cfg $AEM_PATH/crx-quickstart/install/org.apache.jackrabbit.oak.plugins.segment.SegmentNodeStoreService.cfg
cp -f /tmp/install/resources-auth/quickstart $AEM_PATH/crx-quickstart/bin

python aemInstaller.py -i cq-author-4502.jar -r author -p 4502



echo "Finished provisioning."