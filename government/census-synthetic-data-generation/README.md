
# Synthetic Data Generation for Census data

Access to synthetic data helps you make better, data-informed decisions in situations where you have imbalanced, scant, poor quality, unobservable, or restricted data.  This demo helps you create a synthetic data set based on a census data set.

## Data

We shall be using data from the Adult Census Bureau database, made available here and released under licence [CC-0](https://creativecommons.org/publicdomain/zero/1.0/). This data was extracted from the 1994 Census bureau database by Ronny Kohavi and Barry Becker (Data Mining and Visualization, Silicon Graphics).

The notebook provides contains steps to pull the data.

## Prerequisites

1. An Active SAS Viya Workbench license and environment.

2. Python packages required:
   1. pmlb -  used for fetching datasets from the Penn Machine Learning Benchmark.
   2. tqdm - for progress bar functionality during iterations

Install packages using the following command:

```python
pip install pmlb tqdm
```

## Parameters

The Python notebook can be run as-is.

## Output

The output is a synthetically generated dataset which you can choose to persist to the output folder contained in this folder.

## Contact

- Matt Gampe (matt.gampe@sas.com)

## Change Log

- Version 1.0.0 (21NOV2024)
  - Initial release on GitHub
