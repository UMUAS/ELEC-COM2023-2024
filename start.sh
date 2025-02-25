#!/bin/bash

if [[! -e /dev/ttyTHS2 || ! -e /dev/ttyTHS1 ]]; then 
	echo "Error: One or both serial devices (/dev/ttyTHS2, /dev/ttyTHS1)" 
	exit 1 
fi 


docker run -it \ 
   --name "$CONTAINER_NAME"\ 
   --device=/dev/ttyTHS1\ 
   --device=/dev/ttyTHS2\
   "$IMAGE_NAME"
