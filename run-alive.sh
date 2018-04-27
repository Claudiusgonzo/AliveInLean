for i in "inputs/alive/instcombine" "inputs/alive/unit"; do
	echo "Running ${i}/all.opt .."
	lean -q --run src/main.lean -verifyopt ${i}/all.opt > output.txt
	grep -E '^sat$|^unsat$' output.txt > output_summarized.txt
	python3 check_diff.py output_summarized.txt ${i}/answ.txt
	echo
done
echo "NOTE: running inputs/alive/unit/all.opt should have two incorrect results because Alive does type checking on input which will fail but AliveInLean does not do type checking so it will say it's okay."