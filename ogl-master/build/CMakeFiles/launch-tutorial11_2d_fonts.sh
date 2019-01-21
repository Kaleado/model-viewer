#!/bin/sh
bindir=$(pwd)
cd /home/kaleado/Downloads/ogl-master/tutorial11_2d_fonts/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "xYES" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		/usr/bin/gdb -batch -command=$bindir/gdbscript --return-child-result /home/kaleado/Downloads/ogl-master/build/tutorial11_2d_fonts 
	else
		"/home/kaleado/Downloads/ogl-master/build/tutorial11_2d_fonts"  
	fi
else
	"/home/kaleado/Downloads/ogl-master/build/tutorial11_2d_fonts"  
fi
