from myhdl import block, Signal, delay, always, now, always_comb

@block
def mynot(input, output):
	@always_comb
	def comb():
		output.next = not input
	return comb

