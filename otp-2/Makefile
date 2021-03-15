WGET:=wget -nv --show-progress --progress=bar:force:noscroll

download: otp.jar

berlin/osm.pbf:
	mkdir -p berlin
	${WGET} http://download.geofabrik.de/europe/germany/brandenburg-latest.osm.pbf -O $@

berlin/gtfs.zip:
	${WGET} https://transitfeeds.com/p/verkehrsverbund-berlin-brandenburg/213/latest/download -O $@

stuttgart/osm.pbf:
	mkdir -p stuttgart
	${WGET} http://download.geofabrik.de/europe/germany/baden-wuerttemberg/stuttgart-regbez-latest.osm.pbf -O $@

stuttgart/gtfs.zip:
	mkdir -p stuttgart
	${WGET} https://www.openvvs.de/dataset/e66f03e4-79f2-41d0-90f1-166ca609e491/resource/bfbb59c7-767c-4bca-bbb2-d8d32a3e0378/download/google_transit.zip -O $@

otp.jar:
	${WGET} https://oss.sonatype.org/service/local/repositories/snapshots/content/org/opentripplanner/otp/2.1.0-SNAPSHOT/otp-2.1.0-20201127.152255-3-shaded.jar -O $@

build-%: otp.jar %/osm.pbf %/gtfs.zip
	java -Xmx6G -jar otp.jar --build --save $*

run-%: otp.jar
	java -Xmx6G -jar otp.jar --load --serve $*

clean:
	rm -rf berlin/
	rm -rf stuttgart/
	rm -rf *.jar
