# windowRQA

#This MATLAB code allows you to run a windowed RQA analysis with a fixed recurrence rate.
#It calculates the optimal time delay using a mutual information test for each window, by default the embedding dimension is set to 5 but will need to be changed based on the data being used. 
#Data should be set up as a simple 1x: double 
#run
output_signal = windowed_RQA_overlap(Data, 310,0.003);
# 'Data' = your data 
