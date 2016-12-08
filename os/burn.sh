
if [ -e /dev/sdb ];
then
	sudo dd if=louos.iso of=/dev/sdb
	echo Done!
fi