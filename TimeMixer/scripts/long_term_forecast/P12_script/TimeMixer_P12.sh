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
  --seq_len 192 \
  --label_len 96 \
  --pred_len 96 \
  --e_layers 2 \
  --d_model 512 \
  --d_ff 1024 \
  --enc_in 12 \
  --c_out 12 \
  --des 'Exp' \
  --itr 1 \
  --batch_size 32 \
  --learning_rate 0.0001 \
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