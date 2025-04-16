#!/bin/bash

# Set the model name
model_name="TimeMixer"

# Change to the TimeMixer root directory
cd "$(dirname "$0")/../../../"

# Print current directory
pwd

export CUDA_VISIBLE_DEVICES=0

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --model_id "P12_${model_name}" \
  --model ${model_name} \
  --data P12 \
  --root_path ./dataset/P12/ \
  --data_path p12.csv \
  --features M \
  --seq_len 96 \
  --label_len 48 \
  --pred_len 24 \
  --e_layers 2 \
  --d_model 16 \
  --d_ff 32 \
  --enc_in 12 \
  --c_out 12 \
  --des 'Exp' \
  --learning_rate 0.001 \
  --itr 1 \
  --train_epochs 20 \
  --patience 3 \
  --lradj 'TST' \
  --pct_start 0.4 \
  --decomp_method 'moving_avg' \
  --use_norm 1 \
  --down_sampling_layers 0 \
  --down_sampling_window 1 \
  --use_gpu True \
  --gpu 0 