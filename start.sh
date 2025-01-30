#!/bin/bash

if [[! -e /dev/THS2 || ! -e /dev/THS1 ]]; then 
	echo "Error: One or both serial devices (/dev/ttyTHS2, /dev/ttyTHS1)" 
	exit 1 
fi 


docker run -it \ 
   --name "$CONTAINER_NAME"\ 
   --device=/dev/THS1\ 
   --device=/dev/THS2\
   "$IMAGE_NAME"
