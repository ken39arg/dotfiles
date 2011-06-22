#! /bin/sh
cd `dirname $0`/..
for dotfile in .?*
do
	case $dotfile in

	# exclude file putterns
	.. ) ;;
	.git ) ;;
	.gitmodules ) ;;
	*.swp ) ;;

	# make link
	*)
		#echo $PWD/$dotfile
		ln -is "$PWD/$dotfile" $HOME
		;;
	esac
done
