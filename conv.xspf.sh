cd ~/Desktop
a=trax.xspf
b=trax.xspf.bak
cp $a $b
sed -i -e 's/media\/d/E:/g' "$b"
sed -i -e 's/media\/e/E:\/All Music/g' "$b"
sed -i -e 's/media\/Guantanamo_Bay/E:/g' "$b"
mv $b /media/d/$a
