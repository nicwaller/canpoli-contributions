.DEFAULT_GOAL := 42nd_general_election.csv.gz

42nd_general_election.csv.gz: od_cntrbtn_audt_e.csv.gz
	./scripts/segment.sh

od_cntrbtn_audt_e.csv.gz: od_cntrbtn_audt_e.zip
	./scripts/recompress.sh

.PHONY: clean
clean:
	rm -f 42nd_general_election.csv.gz od_cntrbtn_audt_e.csv.gz
