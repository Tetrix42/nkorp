# Copyright (C) 2013 Felix Passenberg
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 2 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
# 02110-1301, USA.
#
# Autor:
# 		Felix Passenberg <fc.passenberg@gmail.com>
#

while true; 
do
	inotifywait -qr --timefmt '%d/%m/%y %H:%M' --format '%T %w %f %e' \
-e create "./data-per" | while read DATE TIME DIR FILE EVENT;do
	
		#echo "in: $FILE"
		FILECHANGE=${DIR}${FILE}
		# convert absolute path to relative
		FILECHANGEREL=`echo "$FILECHANGE" | sed 's_'$CURPATH'/__'`
	
		#echo "At ${TIME} on ${DATE}, file $FILECHANGE was backed up via rsync"
		./out.sh
		
	done
	sleep 600
done