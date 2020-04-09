WGET:=wget -nv --show-progress --progress=bar:force:noscroll

download: otp.jar graphs/berlin/berlin-brandenburg.pbf graphs/berlin/vbb-gtfs.zip

graphs/berlin/berlin-brandenburg.pbf:
	mkdir -p graphs/berlin
	${WGET} http://download.geofabrik.de/europe/germany/brandenburg-latest.osm.pbf -O graphs/berlin/berlin-brandenburg.pbf

graphs/berlin/vbb-gtfs.zip:
	# get latest version on
	# https://www.vbb.de/unsere-themen/vbbdigital/api-entwicklerinfos/datensaetze
	${WGET} https://transitfeeds.com/p/verkehrsverbund-berlin-brandenburg/213/20190516/download -O graphs/berlin/vbb-gtfs.zip

otp.jar:
	${WGET} https://repo1.maven.org/maven2/org/opentripplanner/otp/1.3.0/otp-1.3.0-shaded.jar -O otp.jar

build: download
	java -Xmx6G -jar otp.jar --build ./graphs/berlin

run: download
	java -Xmx6G -jar otp.jar --server --basePath ./ --router berlin --insecure

clean:
	rm -rf graphs/berlin/*.obj
	rm -rf graphs/berlin/*.pbf
	rm -rf *.jar

docker-build:
	docker build -t otp-berlin .

docker-run:
	docker run -p 8080:8080 -it otp-berlin
