# Data Guidance

Please note that this guidance applies for both demo contributors and users of this repository.

Your demo requires some data in order for your code to demonstrate value.  Please assess your dataset on the basis of the following principles.  We then follow this up with a recommended broad practice.

## Principles

1. **Source of data**:  Where did this data come from?  Possible sources include datasets provided by SAS as examples, research activities, data science practitioners and hobbyists, and websites / platforms that open source data. For privacy, security and legal reasons, it's really important to know where your data comes from.  Reflect on this fact:  *if you don't know where it comes from, you shouldn't be using this data as part of a demo contribution.*
   
2. **Size of data**:  How large is the data required for the demo?  This question is important in determining the way you deliver the data.  GitHub repositories (such as this one) are great for collaboratively sharing code, but not so much for huge datasets which tend to bloat the repository.  Keeping this in mind, take a look at the [practices](#practices) section for options.
   
4. **Permissibility of using this data**:  Is the data released under a license which allows it to be used for this demo?  Ensure you read the license under which the data was released and whether the license does not exclude the use of this data in a demo contributed through this repository. *If you aren't sure about the permissibility for use of this data, err on the side of caution and look for alternatives.*


## Practices

1. Wherever possible, include code / programs that pull the data, rather than saving your data in this repository.  This prevents the repository from getting bloated with huge data files (something that GitHub is not designed for) and ensures a better experience for all users who clone this repository.  An example of a data pull code is provided below.  This considers the HMEQ (Home Equity Data Set) hosted on the SAS documentation site.

   ```sas
   filename hmeq "your_demo/data/hmeq.csv";

   proc http 
   url="https://support.sas.com/documentation/onlinedoc/viya/exampledatasets/hmeq.csv"
   method="GET"
   out=hmeq
   ;
   run;

   ```
   Similarly, a Python example would be 
   ```python
   import requests

   res = requests.get("https://support.sas.com/documentation/onlinedoc/viya/exampledatasets/hmeq.csv")

   with open("/your_demo/data/hmeq_py_example.csv","w") as f:
       f.write(res.text)

   ```

2. Another option is to provide instructions in your demo's README on where this data can be downloaded from.  Please note that the contributor's responsibility is to check on the permissibility of using such data beforehand and only specify those datasets which can be used within the demo.  Err on the side of caution wherever possible.

3. SAS provides many example datasets through the SAMPSIO and SASHELP libraries.  Consider orienting your demos around the datasets provided within. Position your demo as an asset which provides an approach to solve a problem, rather than a solution for a specific problem contained within a specific dataset.
   Here's an example of how to refer to the HMEQ dataset through the SAMPSIO library

   ```sas
      data WORK.HMEQ;
      set SAMPSIO.HMEQ;
      run;
   ```

4. Consider hosting your data on other public cloud services which are meant for serving data.  Examples would include AWS S3 buckets, Azure Data Lake Storage, Google Drive and others.  Then, include a data pull code which pulls the data from the storage service.  When saving your data in such locations, refer back to the source and permissibility issues above. Save such data only in a permissible manner, adhering to the guidelines under which that data was made available.

5. In case the above options are not possible, consider providing a SAS program to generate data synthetically instead.  SAS Viya and SAS Viya Workbench offers programming routines to synthetically generate data of a desired volume that the user chooses.  SAS Viya, for example also allows you to make use of low-code components such as SAS Studio Custom Steps to access these routines.  Here are examples you can refer:

   1. [SAS documentation for the smote.smoteSample CAS action.](https://go.documentation.sas.com/doc/en/pgmsascdc/default/casactml/casactml_smote_details01.htm)
   2. [Custom Step to generate synthetic data using SMOTE](https://github.com/sassoftware/sas-studio-custom-steps/tree/main/SDG%20-%20Generate%20Synthetic%20Data%20through%20SMOTE)
   3. The proc tabularGAN procedure is documented [here](https://go.documentation.sas.com/doc/en/vwbcasml/v_001/vwbcasml_tabulargan_toc.htm)
   4. The generativeAdversarialNet.tabularGanTrain action (a CASL-oriented interface for the algorithm) is documented [here](https://documentation.sas.com/?cdcId=pgmsascdc&cdcVersion=default&docsetId=casactml&docsetTarget=cas-generativeadversarialnet-tabulargantrain.htm)
   5. [Custom Step to train a generator using GANs](https://github.com/sassoftware/sas-studio-custom-steps/tree/main/SDG%20-%20Train%20a%20Synthetic%20Data%20Generator%20through%20GANs)
  
   **Synthetic data is not a panacea for all data sharing problems.  Ensure you still adhere to the license and sharing permissions dictated by the original data license.**

6. Finally, in the very unlikely event you still have to provide a dataset with the demo, please save data under a "data" subfolder in your demo folder. As a rule of thumb, do not resort to this if you data exceeds 10 MB in size. Please get in touch with the [maintainers](yijian.ching@sas.com, sundaresh.sankaran@sas.com, sundaresh.sankaran@gmail.com) at the time of submission to discuss options. It's also possible that SAS Institute might make decisions regarding whether to save a dataset within the repository or not.

## Suggested Datasets

In some situations where you lack a suitable dataset to base your demo upon, you may consider some of the options provided below.  Again, note that the datasets provided below are suggestions, and their license / usage characteristics has been noted as-is.  As a contributor, please take responsibility to check current permissibility of the datasets mentioned below and ensure you are compliant, thus keeping the repo compliant too.

- Our sister project, [sas-viya-workbench-examples](https://github.com/sassoftware/sas-viya-workbench-examples), which focusses on code examples, makes use of some datasets.
   - Refer [here](https://github.com/sassoftware/sas-viya-workbench-examples/blob/main/data/README.md) for a description of those datasets.