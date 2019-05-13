sleep 0.05
okno_id=`wmctrl -l | tail -n 1`

if echo $okno_id | grep "Psi" ; then
	wmctrl -i -a `echo $okno_id | cut -f1 -d' '`
fi
