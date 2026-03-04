zilo_andi_cyrillic2ipa.hfstol: zilo_andi_correspondences.txt
	hfst-strings2fst -j $< | \
	  hfst-repeat -f 1 | \
	  hfst-fst2fst -O | \
	  hfst-edit-metadata \
	    --add=author='George Moroz' \
	    --add=publisher='Linguistic Convergence Laboratory, HSE University' \
	    --add=address='Moscow' \
	    --add=licence='GPL-3.0' \
	    --add=name='Zilo Andi Cyrillic to IPA transliterator' \
	    --add=fst_type='transliterator' \
    	--add=year='2026' \
    	--add=language='Zilo Andi (zilo1238)' \
    	--add=family='East Caucasian' \
    	--add=usage_example='echo "Микъи битIилъи\!" | hfst-proc -C zilo_andi_cyrillic2ipa.hfstol | cg3 -g garbage_collectore.cg3' \
    	--add=citation='Moroz G. (2026) An FST transliterator from Zilo Andi Cyrillic to IPA, Linguistic Convergence Laboratory, HSE University, Moscow, https://github.com/LingConLab/zilo_andi_transliterator' -o $@
