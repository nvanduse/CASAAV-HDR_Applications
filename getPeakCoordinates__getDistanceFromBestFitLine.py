# This script will process all CSV files in the working directory.
# The input CSV files should contain time in the first column, and Ca++ data in subsequent columns (one cell per column, with header).
# It's expecting each recording to contain five depolarization/repolarization cycles, but this can be adjusted below.
# It will find the peaks, extract their values, fit them with a simple best fit line, 
# and measure and record the distance of each of the points from the best fit line. 
# Data is saved to two CSVs. One has peak coordinates and distance from the best fit line. 
# The other has max distance from line, and average distance from line, for each cell.
# The find_peaks scipy function is used to find the peaks in Ca++ imgaging data. 
# Best fit line is calculated with scipy.stats.linregress function.



import os
import numpy as np
import pandas as pd
from scipy.signal import find_peaks
from scipy.stats import linregress

def process_csv(file_name):
    # Read the CSV file
    df = pd.read_csv(file_name)

    # Initialize lists for results
    results = []
    distance_results = []

    # Extract time points
    time = df.iloc[:, 0]

    # Process each column (excluding the time column)
    for column in df.columns[1:]:
        signal = df[column]
        peaks, _ = find_peaks(signal, distance=len(signal)//5)  # Sets the minimum distance between peaks. Adjust if desired.

        # Ensure only up to 5 peaks are considered
        if len(peaks) > 5:
            peaks = peaks[:5]
        elif len(peaks) < 5:
            print(f"Warning: Found fewer than 5 peaks in {column}")

        # Get peak times and values
        peak_times = time.iloc[peaks].values
        peak_values = signal.iloc[peaks].values

        # Fit a best fit line
        if len(peak_times) > 1:
            slope, intercept, _, _, _ = linregress(peak_times, peak_values)

            # Calculate distances from the best fit line
            distances_from_line = np.abs(slope * peak_times - peak_values + intercept) / np.sqrt(slope**2 + 1)

            # Record results
            for i in range(len(peaks)):
                results.append([column, i + 1, peak_times[i], peak_values[i], distances_from_line[i]])

            # Calculate max and average distance from best fit line
            max_distance = np.max(distances_from_line)
            avg_distance = np.mean(distances_from_line)

            distance_results.append([column, max_distance, avg_distance])
        else:
            print(f"Not enough data points to fit a line for {column}")

    # Convert results to DataFrame
    results_df = pd.DataFrame(results, columns=['Sample Name', 'Peak Number', 'Peak Time', 'Calcium Signal', 'Distance from Best Fit Line'])
    distance_results_df = pd.DataFrame(distance_results, columns=['Sample Name', 'Max Distance from Best Fit Line', 'Average Distance from Best Fit Line'])

    # Save results to new CSV files
    results_df.to_csv(f"{file_name}_peaks.csv", index=False)
    distance_results_df.to_csv(f"{file_name}_distances.csv", index=False)

def main():
    # Process all CSV files in the working directory
    for file in os.listdir():
        if file.endswith('.csv'):
            process_csv(file)

if __name__ == "__main__":
    main()
