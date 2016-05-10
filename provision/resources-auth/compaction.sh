#!/bin/bash

#Find old checkpoints
java -Dtar.memoryMapped=true -Xms1g -Xmx1g -jar /aem/author/oak-run.jar checkpoints /aem/author/crx-quickstart/repository/segmentstore

#Find unreferenced checkpoints and delete them
java -Dtar.memoryMapped=true -Xms1g -Xmx1g -jar /aem/author/oak-run.jar checkpoints /aem/author/crx-quickstart/repository/segmentstore rm-unreferenced

java -Dtar.memoryMapped=true -Xms1g -Xmx1g -jar /aem/author/oak-run.jar compact /aem/author/crx-quickstart/repository/segmentstore

#Start AEM
sh -c 'cd /aem/author/crx-quickstart/bin/ && ./start'