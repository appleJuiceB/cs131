:PHONY: all clean

all: clean.csv

trimmed.csv: raw.csv
	cut -d, -f1,3,5 raw.csv > trimmed.csv

clean.csv : trimmed.csv
	awk -F ',' '($$2 != "" && $$3 != "")' trimmed.csv > clean.csv


clean: 
	rm -f trimmed.csv
