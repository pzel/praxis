happy-test:
	@test "[1,7,10]" = $$(echo '10' | ./Happy.hs)
	@echo "Happy.hs passed"
