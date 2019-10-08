# Stats Review Notes

## Sampling Techniques

1. **Probability Sampling** - All units in the population have a **known, non zero** probability of being included in the sample. Error can be assessed and the results can be projected on to the population. Expensive
   1. **Simple Random Sampling (SRS) **- all possible samples of size $n$ are equally likely. `sample(1:150, size=10, replace = False)`. Simple, intuitive, workhorse 
   1. **Stratified** - Chosen sample forced to contain units from each “stratum” of the population with the goal of equalizing “important” variables (gender, race, SES)
      1. Procedure
         1. Partition population into **mutually exclusive** and **exhaustive** strata
         1. Draw SRS from within each stratum.
         1. Strata do not have to have the same size
      1. Smaller sampling error than SRS by removing soruces of variation
      1. Representative when **proportional sampling** is used, i.e. sample from each stratum is proportional to the szie of the stratum.
      1. Use when primary objective is to **compare groups**
   1. **Cluster** - Partition population into clusters and then use SRS to choose which clusters will be part of the sample, and then use SRS to choose from the chosen sample. e.g. cluster sampling by geographic region.
      - Use when **fixed costs** associated with each data location or when list of clusters is available but no list of units
1. **Non-probability** - Some units have a **zero** or **unknown** probability of being inlcuded. Sampling error **cannont** be computed
   1. _Types of Non-Sampling_
      1. **Convenience Sampling** - e’s.g Sending surveys to friends, stopping people on the street. Volunteers
      1. **Judgment Sampling** - Researcher tries to select a sample that **seems** to be most a appropriate for the study. e.g. target market research
      1. **Snowball Sampling** - initial subjects recruit additional ones. Used when sampling difficult to reach populations. Over represents people who have contacts.
      1. **Quota** Partition population based on a characteristic (think stratified) establish the size of the sample from each group
   1. Types of Error
      1. Non Response Error
      1. Response or data error
         1. Systematic bias during collection, analysis or interpretation
         1. Respondent error (lying)
         1. Interview bias
         1. recording errors

#### Fundamental principals in designing experiements

1. **Controlling** - attempting to ensure that units are treated identically except for treatment
1. **Randomization** - Randomly assigning units to treatment/control
1. **Replication** - increased sample size reduces statistical fluctuation
1. **Blocking** - Stratified based on a likely-relevant variable

## Descriptive Statistics (lecture 3)

### Types of variables

1. Numerical

   1. Continuous
   1. Discrete

1. Categorical - Fixed number of values (levels) e.g. Race, Gender (use `factor` to manage variables in `R`)

   1. nominal - No natural ordering (race)
   1. Ordinal - levels have natural ordering (Freshman $\rightarrow$ Senior)

   **Changing variable types in R** `<- as.factor()`

#### Summarizing categorical Data

1. Frequency table for one categorical variable
   1. `table(dat$Survived)` 
   1. `barplot(table(data$sex))` 
1. Contingency table for two or more categorical variables
   1.  `table(dat$Survived, dat$Gender)` 
1. Histograms - divide up variable into bins. Height shows how many units in the sample fall into each bin. Summarized the **shape** of the distribution. 
   1. Can be described by Clustering (modes), Center, Spread, Skew, Outliers
   1. hist(dat$Age)` ![page13image54827936.png](/Users/mdarfler/Library/Application Support/typora-user-images/page13image54827936.png) 
   1. hist(dat$Age, freq = FALSE) - total area of all bars = 1![page16image54831680.png](/Users/mdarfler/Library/Application Support/typora-user-images/page16image54831680.png) 
   1. Centrality - Mean($\bar{x} = \frac{1}{n}\sum_{i=1}^n x_i$), Median (middle value `sort(data)[length(data)/2]`), Mode (most common) Median is a more **robust** measure of center than mean, i.e. less susceptible to outliers
   1. Skew -
      1.  Right scew means more data to the left. Mean is to the **right** of the median
      1. Left Skew means more data to the right. Mean is the the **left** of the median
   1. Weighted Average $\dfrac{x_1f_1 + x_2f_2 + \dots + x_kf_x}{f_1+f_2+ \dots +f_k}$ 

#### Measuring Spread or Dispersion

**Range** - $max(\texttt{data}) - min(\texttt{data})$

**Inter Quartile Range (IQR)** - 3^rd^ quartile - 1^st^ quartile

Variance and SD

**Box Plot** 

![page49image54806976.png](/Users/mdarfler/Library/Application Support/typora-user-images/page49image54806976.png) 



- Upper whisker is, at most, Q~3~ + 1.5 x IQR
- Lower whisker is, at least, $Q_1 + 1.5 \times IQR$

**Variance**

**Sample Variance** $$s^2 = \frac{1}{n-1} \sum_{i=1}^n (x_i - \bar{x})^2 \qquad SD = \sqrt{\sigma^2}$$ 

**Population Variance** $\dfrac{1}{n}$

Sensitive to every observation

**Empirical Rule**

For Normal Distributions

- 68% of the data are within $\pm 1$ std dev of the mean
- 95% of the data are within $\pm 2$ std dev of the mean
- 99.7% of the data are within $\pm 3$ std dev of the mean

**Measure of Skewness**

$\frac{1}{N}\sum_{1}^n(\frac{x_i - \mu}{\sigma})^3$

**Confidence and Error**

- standard error $SE = \dfrac{\sigma}{\sqrt{n}}$ if the sample size is large we can use the point estimate $s$ of the $\sigma$ of the sample
- 95% confidence interval = $\mu_{sample} \pm 2 \times SE$
- **Confidence Interval** $\mu \pm \dfrac{1}{\sqrt{n}}$

Graphical Displays

- Categorical v Categorical - stacked/unstacked bar charg
- Numerical v. Categorical - side-by-side boxplots
- Numerical v. Numerical - scatterplots
- Numerical v. Numerical v. Categorical - coded scatterplot



## Probability (Lectures 5 and 6)

**Disjoint events** - 

- $P(A \cap B) = 0$
- $P(A_1 \cup A_2) = P(A_1) + P(A_2)$ 

**Union** - 

- $P(A \cup B)$
- $P(A \cup A^c) =1$
- $P(A \cup B) = P(A) + P(B) - P(A \cap B)$ 

**Intesection**

- $P(A \cap B)$
- If A and B are independent, $P(A \cap B) = P(A) \times P(B) $
- $P(A \cap A^c) = 0$

**Conditional Probability**

- $P(A|B) = \dfrac{P(A \cap B)}{P(B)}$
- $P(A \cap B)= P(B)P(A|B)$
- $P(A \cap B) = P(A)P(B|A)$

**Independence** Events A and B are **independent** if $P(A|B) = P(A)$ 

**Law of Total Probability**

- $B = (B \cap A) \cup(B\cap A^c)$
- $B \cap A$ and $B \cap A^c$ are disjoint so $P(B) = P(B \cap A) + P(B \cap A^c)$
- $P(B) = P(A)P(B|A) + P(A^c) P(B | A^c)$

**Bayes Theorem**

$P(A |B) = \dfrac{P(A)P(B|A)}{P(B)}$

Using the law of total probablity $P(B) = P(A)P(B|A) + P(A^c)P(B | A^c)$

$P(A|B) = \dfrac{P(A)P(B|A)}{P(A)P(B|A) + P(A^c)P(B | A^c)}$

> TREE DIAGRAMS. USE THEM

## Random Variables

**Expected Value** $E[X] = \frac{1}{n} \sum_{i=i}^n(X=x_i)^2p(x_i)$

**Variance** $Var[X] = \frac{1}{n}\sum_{i=1}^n(X=x_i)p(x_i)$