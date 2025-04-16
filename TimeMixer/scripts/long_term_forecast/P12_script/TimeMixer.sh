export CUDA_VISIBLE_DEVICES=0

model_name=TimeMixer

python -u run.py \
  --task_name long_term_forecast \
  --is_training 1 \
  --model_id P12_$model_name \
  --model $model_name \
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
  --enc_in 42 \
  --c_out 42 \
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