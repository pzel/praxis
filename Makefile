all: entropy-test happy-test

happy-test:
	test "[1,7,10]" = $$(echo '10' | ./Happy.hs)
	@echo "Happy.hs passed"

entropy-test:
	test "-0.0" = $$(echo 'a' | ./Entropy.hs)
	test "1.0" = $$(echo 'ab' | ./Entropy.hs)
	test "1.5849626" = $$(echo 'abc' | ./Entropy.hs)
	test "4.7004395" = $$(echo 'abcdefghijklmnopqrstuvwxyz' | ./Entropy.hs)
	@echo "Entropy.hs passed"
