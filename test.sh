export CUDA_VISIBLE_DEVICES=5

python -m torch.distributed.launch --nproc_per_node=1 examples/run_xfun_ser.py \
        --model_name_or_path /tmp/0630_debug  \
        --output_dir /tmp/0722_predict \
        --do_predict \
        --lang zh \
        --max_steps 1500 \
        --alpha 0.6 \
        --queue_len 10 \
	      --evaluation_strategy epoch \
        --warmup_ratio 0.1 \
        --fp16 \
	      --per_device_train_batch_size 4 \
	      --per_device_eval_batch_size 4
