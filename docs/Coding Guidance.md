# Coding Guidance

These are suggested best practices to promote readability, comprehension and appearance.
Another useful link is to check out sasjs/lint.

Please note that this guidance is useful not just for contributors but also for users of the repo (who may wish to maintain their code bases or contribute at a later stage).

This page is influenced heavily by the [SAS Coding Best Practices found in SAS Studio Custom Steps](https://github.com/sassoftware/sas-studio-custom-steps/blob/main/docs/SASCodingBestPractices.md) but might differ in some aspects when considering Workbench environments.

1. Code should not produce Errors, Warnings or Concerning Notes in SAS log

2. Indent using spaces or tabs, but please be consistent.  If using spaces, use spaces throughout. If tabs, tabs throughout.

3. Be consistent with indentation increments (2 spaces / 3 spaces / 4 spaces etc. - pick your style, but stick to it)

4. Indent conditional blocks and DO groups, and do it consistently, the logic will be easier to follow

5. Avoid mixing symbol and mnemonic versions of comparison operators and use one style consistently

6. End DATA-steps and PROC-steps with a RUN statement. End interactive procedures, such as proc sql and proc datasets, with a QUIT statement.

7. Group non-executable statements (length, attrib, retain, format, informat, etc.) at the top of a data step before executable statements

8. Two level data set names should always be used, which includes specifying WORK library

9. When available, use string functions that support UTF-8 data. For example, use kfind(...) rather than find(...).
See Internationalization Compatibility for SAS String Functions for more details

10. When changing SAS option settings, return the setting to the original value after you are done with them. An example is shown below:

%local etls_syntaxcheck;  
%let etls_syntaxcheck = %sysfunc(getoption(syntaxcheck));

/* Turn off syntaxcheck option to perform following steps*/
options nosyntaxcheck;
%local etls_obs;
%let etls_obs = %sysfunc(getoption(obs));

/* Set obs option to max to perform following steps  */
options obs = max;

/* Code that does the actual work (data processing) goes here */

/* Reset obs option to previous setting  */
options obs = &etls_obs;

/* Reset syntaxcheck option to previous setting  */
options &etls_syntaxcheck;
Remove all items created after you are done with them

11. Remove all temporary datasets (typically created in work) after you are done with them and they are not part of the output
12. Reset all titles, footnotes after you are done with them
13. Use a naming prefix for temporary tables consider that is specific to your demo

It allows to more easily identify those tables. Even though these tables would automatically be deleted (see #11 above), when the program runs into issues, it allows the user to more easily identy those erroring locations and inspect their content for debugging purposes.
14. A common approach is to start with an underscore, followed by the first character of each word of your demop, followed by an underscore. So if your demo is named Great Data Transformation, then the prefix would be _GDP_

15. Use the macro name on the %mend statement. It makes the code easier to read, especially when you have many macros and/or nested macros.
16. Do not refer to Cloud Analytics Services actions inside code meant to be run under a SAS Viya Workbench environment
17. Do not refer to procedures that are not supported under a Workbench environment.  For example, proc cas and proc python are valid procedures available on the SAS Viya platform, but are not supported under Workbench.
18. **Do not leave sensitive information, credentials or passwords hardcoded in your code.**  
