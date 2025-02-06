# windowRQA

This MATLAB code allows you to run a windowed RQA analysis with a fixed recurrence rate using the RQA toolbox[1].
It calculates the optimal time delay using a mutual information test for each window, by default the embedding dimension is set to 5 but will need to be changed based on the data being used. 
Data should be set up as a simple 1x : double 

run command:

output_signal = windowed_RQA_overlap(Data, 310,0.003);

'Data' = your data, '310' = window size, ' 0.003' = the starting RQA plot sensitivity

The plot sensitivity will start at this value each time, make an educated guess to reduce the time the code takes to find the desired recurrence rate (normally between 0.001 and 0.01).

# Changes to the windowing overlap, recurrence rate tolerance and increment, embedding dimension

In the find_optimal_threshold.m script there are three values that can be changed to significantly alter your results.

The step size can be increased to speed up the code, however if too high then your code will get stuck unable to reach a recurrence rate within your tolerance. 

The tolerance value can be altered to widen the values of recurrence rate that you find acceptable, this will again increase the speed of the code but will reduce accuracy.

Here you can also change the embedding dimension used for the RQA plot: y = phasespace(data,5,time_delay); 

In the windowed_RQA_overlap.m script you can change the % overlap of the windows (default 50%): overlap = 0.50;

You are also able to change the tolerance window for recurrence rate: x = find_optimal_threshold(windowed_data, [4.995, 5.005], td - 1, starting_threshold);

'[4.995,5.005]' is the default tolerance window. A sensible change to a fixed recurrence rate of 10% would be as follows: '[9.995, 10.005]'




[1] Hui Yang (2025). Recurrence plot and recurrence quantification analysis (https://www.mathworks.com/matlabcentral/fileexchange/58246-recurrence-plot-and-recurrence-quantification-analysis), MATLAB Central File Exchange. Retrieved February 6, 2025.
