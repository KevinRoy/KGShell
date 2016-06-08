#!/bin/sh
for line in $(adb devices); do
	let a++
	# echo $line		
done 
# echo $a

if [[ a -le 4 ]]; then
	echo "没有找到相应的设备"
	exit 0
fi

echo "请输入你要uninstall apk包含的包名: "
read packname

echo "你确定要uninstall $packname ? (y/n)"
read isUninstall

if [[ $isUninstall == "n" ]]; then
		exit 0
fi
echo "uninstall begin............."
for packageline in $(adb shell pm list packages); do
	if [[ $packageline =~ $packname ]]; then
		echo ${packageline#*package:}
		adb uninstall ${packageline#*package:}
		echo "adb uninstall ${packageline#*package:}"
	fi
done
echo "uninstall over............."

# echo "begin to uninstall .....";   

# for line in `cat $1`
# do
# 	echo $line
# 	adb uninstall $line -l  
# done
# echo "uninstall over.............";  