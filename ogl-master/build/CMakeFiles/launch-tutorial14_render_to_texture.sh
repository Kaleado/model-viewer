#!/bin/sh
bindir=$(pwd)
cd /home/kaleado/Downloads/ogl-master/tutorial14_render_to_texture/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "xYES" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		/usr/bin/gdb -batch -command=$bindir/gdbscript --return-child-result /home/kaleado/Downloads/ogl-master/build/tutorial14_render_to_texture 
	else
		"/home/kaleado/Downloads/ogl-master/build/tutorial14_render_to_texture"  
	fi
else
	"/home/kaleado/Downloads/ogl-master/build/tutorial14_render_to_texture"  
fi
