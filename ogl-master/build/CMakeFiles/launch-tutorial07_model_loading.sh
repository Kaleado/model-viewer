#!/bin/sh
bindir=$(pwd)
cd /home/kaleado/Downloads/ogl-master/tutorial07_model_loading/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "xYES" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		/usr/bin/gdb -batch -command=$bindir/gdbscript --return-child-result /home/kaleado/Downloads/ogl-master/build/tutorial07_model_loading 
	else
		"/home/kaleado/Downloads/ogl-master/build/tutorial07_model_loading"  
	fi
else
	"/home/kaleado/Downloads/ogl-master/build/tutorial07_model_loading"  
fi
