install: otp.jar graphs/berlin/berlin-brandenburg.pbf graphs/berlin/vbb-gtfs.zip

graphs/berlin/berlin-brandenburg.pbf:
	wget http://download.geofabrik.de/europe/germany/brandenburg-latest.osm.pbf -O graphs/berlin/berlin-brandenburg.pbf

graphs/berlin/vbb-gtfs.zip:
	wget http://www.vbb.de/de/download/GTFS.zip -O graphs/berlin/vbb-gtfs.zip

otp.jar:
	wget https://repo1.maven.org/maven2/org/opentripplanner/otp/1.2.0/otp-1.2.0-shaded.jar -O otp.jar

build: install
	java -Xmx2G -jar otp.jar --build ./graphs/berlin

clean:
	rm graphs/berlin/*.obj
