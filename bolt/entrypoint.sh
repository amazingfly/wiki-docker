#!/bin/bash
#delays startup so bolt engine can connect to rabbitmq on its first try.
echo 'bolt sleep for 8 seconds'
sleep 5
./boltengine/boltengine
