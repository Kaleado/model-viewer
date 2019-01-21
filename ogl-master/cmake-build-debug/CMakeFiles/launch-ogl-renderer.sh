#!/bin/sh
bindir=$(pwd)
cd /home/kaleado/Programming/ogl-renderer/ogl-master/ogl-renderer/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "xYES" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		/usr/bin/gdb -batch -command=$bindir/gdbscript --return-child-result /home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/ogl-renderer 
	else
		"/home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/ogl-renderer"  
	fi
else
	"/home/kaleado/Programming/ogl-renderer/ogl-master/cmake-build-debug/ogl-renderer"  
fi
