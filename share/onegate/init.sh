#mkdir /mnt/context
#mount /dev/disk/by-label/CONTEXT /mnt/context/

cp /mnt/context/onegate /usr/bin
chmod +x /usr/bin/onegate

function export_rc_vars
{
	if [ -f $1 ] ; then
		ONE_VARS=`cat $1 | egrep -e '^[a-zA-Z\-\_0-9]*=' | sed 's/=.*$//'`

		. $1

		for v in $ONE_VARS; do
		    export $v
		done
	fi
}

export_rc_vars /mnt/context/context.sh
