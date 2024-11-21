# Folder Organisation

Please note that this guidance is useful not just for contributors but also for users of the repo (who may wish to maintain their code bases or contribute at a later stage).

Also provided in the _template folder,  here are some suggested folders to organise various artifacts forming part of your demo. You may not need to use all folders, and that's okay. Use whatever's required and discard the rest. We are gentle tyrants and try to enforce some consistency across all contributions, so please let us know in case your demo assets are significantly different, and we can discuss how to adjust.

1. **sas** - save all your SAS programs and SAS notebooks (.sasnb) here. Save any macros in the subfolder macros (recommended) for easy reference.
2. **python** - save all your Python programs (.py files), Python notebooks (.ipynb) and variants here.
3. **config** - save all configuration related specifications here. For example, a requirements.txt file which contains packages you want the user to install. Or an env file containing settings you want the user to run.
4. **data** - this is the place where input data or data created in process can reside. You don't necessarily need to have the input data reside in this folder within the repository (doing so leads to huge repo sizes) but you could use this as a staging area which the program refers for any dataset.
5. **output** - use this folder to save all output from your programs. Reports, output datasets, summary datasets and similar.
6. **astores** - use this folder to save a special form of output - the analytics store (astore) or pickle file that your code might have output.
7. **img** - use this folder to save any images you might refer to within README or elsewhere in the demo folder.
