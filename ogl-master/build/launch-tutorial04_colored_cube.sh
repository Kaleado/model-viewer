#!/bin/sh
bindir=$(pwd)
cd /home/kaleado/Downloads/ogl-master/tutorial04_colored_cube/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "xYES" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		/usr/bin/gdb -batch -command=$bindir/gdbscript --return-child-result /home/kaleado/Downloads/ogl-master/build/tutorial04_colored_cube 
	else
		"/home/kaleado/Downloads/ogl-master/build/tutorial04_colored_cube"  
	fi
else
	"/home/kaleado/Downloads/ogl-master/build/tutorial04_colored_cube"  
fi
