#!/bin/sh
bindir=$(pwd)
cd /home/kaleado/Downloads/ogl-master/tutorial18_billboards_and_particles/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "xYES" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		/usr/bin/gdb -batch -command=$bindir/gdbscript --return-child-result /home/kaleado/Downloads/ogl-master/build/tutorial18_particles 
	else
		"/home/kaleado/Downloads/ogl-master/build/tutorial18_particles"  
	fi
else
	"/home/kaleado/Downloads/ogl-master/build/tutorial18_particles"  
fi
