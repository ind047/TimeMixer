# Running TimeMixer on P12 Dataset with Missing Value Indicators

This guide explains how to run the TimeMixer model on the P12 dataset with missing value indicators.

## Data Preparation

1. Place your P12 dataset CSV file in the `TimeMixer/dataset/P12/` directory:
   ```
   TimeMixer/dataset/P12/p12.csv
   ```

2. Ensure the CSV has the following format:
   - First column should be a date/time column (if available)
   - The remaining columns are the features
   - Missing values should be represented as `NaN` in the CSV file

## Running the Model

Execute the provided script to run the TimeMixer model on the P12 dataset:

```bash
bash ./scripts/long_term_forecast/P12_script/TimeMixer.sh
```

## How Missing Values Are Handled

The implementation handles missing values as follows:

1. During data loading:
   - A mask is created where 1 indicates a missing value and 0 indicates a present value
   - Missing values are temporarily filled with zeros
   - Both the data and the mask are concatenated along the feature dimension

2. During model processing:
   - The model detects when the input has twice the expected features (data + mask)
   - It separates the data from the mask
   - The mask information is used for processing (currently using zero imputation for simplicity)

## Customization

You can modify the following aspects:

### In the TimeMixer.sh script:
- Adjust sequence length (`--seq_len`), prediction length (`--pred_len`), etc.
- Modify the number of features (`--enc_in` and `--c_out`) to match your P12 dataset
- Change training parameters like `--learning_rate`, `--train_epochs`, etc.

### In the Dataset_P12 class:
- Adjust the train/val/test split ratios
- Modify how missing values are handled during data loading

### In the Model class:
- Enhance the handling of missing values in the `__multi_scale_process_inputs` method
- Implement more sophisticated imputation strategies instead of zero imputation

## Troubleshooting

- If you encounter dimension mismatches, make sure that `--enc_in` and `--c_out` match the number of features in your P12 dataset
- If you have date/time columns, make sure the timeenc parameter is set appropriately
- Verify that the P12 dataset CSV is formatted correctly with NaN for missing values 