# Loan Default Models with Lending Club

---

This repository contains coding examples in both SAS and Python for building loan application models using Lending Club data.

The scenario for this demo is as follows: Lending Club is a peer-to-peer lending company based in the US that connects people looking to invest money with people who want to borrow money. When investors invest their money through Lending Club, this money is passed on to borrowers. When borrowers pay back their loans, the capital plus the interest passes back to the investors. This is a win for everyone because the borrowers usually get lower loan rates and the investors receive higher returns.

Our goal today is to develop a model that predicts whether the borrower will pay back the loan. We have historical data that contains one row per borrower. Our target variable is DEFAULT (0/1). Default represents whether the borrower defaulted(1) on the loan or paid(0) it back in full.

## Prerequisites

- An active SAS Viya Workbench license and environment
- This demo makes use of certain open-source Python packages such as sklearn, all of which are expected to be made available out of the box with a SAS Viya Workbench environment.  In case of a requirement to install a package, install the same from the terminal:

```python
pip install <your_package>
```

## Data

This demo uses an adapted Lending Club data set which is under a [CC-0](https://creativecommons.org/publicdomain/zero/1.0/).

The original data set was taken from [this location](https://www.kaggle.com/api/v1/datasets/download/swetashetye/lending-club-loan-data-imbalance-dataset), and the following changes were made:

- Change column names to be more indicative, such as "int.rate" into "InterestRate"

The Python notebook provides a section through which this code is pulled from the above location.  Always update yourself with the data sharing permissions specified by the original source of data and also refer the 
Data Guidance document (top level of this repo).


## Parameters

The Python notebook can be run as-is.

The SAS notebook and SAS code may need some minor modifications with respect to the path of the input data or formats directory.  Look out for notes starting with **NOTE:**. These are usually for libname locations or input file locations.


## Output

1. Various reports showing summary statistics in the form of graphs are published inline with the code.
2. Model scoring astore

## Execution Order

It's recommended to run the Python notebook first.  The Python notebook contains code which pulls the input data, which is also used by the SAS program.  Otherwise, the SAS program, SAS notebook and Python notebook carry out similar tasks independently.

## Contact

- Yi Jian Ching (yijian.ching@sas.com)

## Change Log

- Version 1.0.0 (21NOV2024)
  - Initial release on GitHub
