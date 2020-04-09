WGET:=wget -nv --show-progress --progress=bar:force:noscroll

download: otp.jar berlin/berlin-brandenburg.pbf berlin/vbb-gtfs.zip

berlin/berlin-brandenburg.pbf:
	mkdir -p berlin
	${WGET} http://download.geofabrik.de/europe/germany/brandenburg-latest.osm.pbf -O $@

berlin/vbb-gtfs.zip:
	# get latest version on
	# https://www.vbb.de/unsere-themen/vbbdigital/api-entwicklerinfos/datensaetze
	${WGET} https://transitfeeds.com/p/verkehrsverbund-berlin-brandenburg/213/latest/download -O $@

otp.jar:
	${WGET} https://oss.sonatype.org/content/repositories/snapshots/io/leonard/otp/2.0.0-SNAPSHOT/otp-2.0.0-20200409.193447-1-shaded.jar -O $@

build: download
	java -Xmx6G -jar otp.jar --build --save berlin

run: download
	java -Xmx6G -jar otp.jar --load --serve berlin

clean:
	rm -rf berlin/*.obj
	rm -rf berlin/*.pbf
	rm -rf *.jar
