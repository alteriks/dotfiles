echo "Enter name for stressberry graphs:"
read name
stressberry-run -n $name -d 600 /tmp/$name.dat
stressberry-plot -o /tmp/$name.png /tmp/$name.dat
echo "Files saved:"
ls -1d /tmp/$name.*
