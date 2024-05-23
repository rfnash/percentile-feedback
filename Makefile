all: plot.js chart.js data.js

plot.js: plot.coffee
	coffee -c $<

chart.js: chart.coffee
	coffee -c $<

data.js: periods.txt
	./data.py -m 10:30  -l periods.txt
