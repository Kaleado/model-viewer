#!/bin/sh
bindir=$(pwd)
cd /home/kaleado/Downloads/ogl-master/misc05_picking/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "xYES" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		/usr/bin/gdb -batch -command=$bindir/gdbscript --return-child-result /home/kaleado/Downloads/ogl-master/build/misc05_picking_BulletPhysics 
	else
		"/home/kaleado/Downloads/ogl-master/build/misc05_picking_BulletPhysics"  
	fi
else
	"/home/kaleado/Downloads/ogl-master/build/misc05_picking_BulletPhysics"  
fi
