wsj_symlink_root := wsj_symlink_root
wsj := /net/fastdb/wsj
wham_noise := /net/db/wham_noise/
output_dir := wham

$(output_dir): $(wsj_symlink_root)/wsj0
	python create_wham_from_scratch.py --wsj0-root $(wsj_symlink_root)/ --wham-noise-root $(wham_noise) --output-dir $(output_dir)


$(wsj_symlink_root)/wsj0:
	# Create the wsj0 folder that is expected from create_wham_from_scratch.py.
	# `cp -s` produces symlinks. So this is some kind of virtual merge.
	mkdir -p $(wsj_symlink_root)/wsj0

	# This produced some permition denied problems.
	# Since the problem only occurs for data that is not needed,
	# copy only the relevant folders.
	# cp -rns $(wsj)/*/wsj0/* $(wsj_symlink_root)/wsj0/

	cp -rns $(wsj)/11-14.1/wsj0/* $(wsj_symlink_root)/wsj0/
	cp -rns $(wsj)/11-1.1/wsj0/* $(wsj_symlink_root)/wsj0/
	cp -rns $(wsj)/11-2.1/wsj0/* $(wsj_symlink_root)/wsj0/
	cp -rns $(wsj)/11-3.1/wsj0/* $(wsj_symlink_root)/wsj0/
	cp -rns $(wsj)/11-6.1/wsj0/* $(wsj_symlink_root)/wsj0/


clean:
	# Do not use variable to prevent typo, that can delete to much things.
	rm -r wsj_symlink_root/wsj0/
