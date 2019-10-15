# tfworld19-distributed-training-workshop
Demos supporting the TensorFlow World 2019 distributed training workshop


time horovodrun -np 4 -H localhost:4 python cifar10-multi-gpu-horovod.py

    # SageMaker parameters
    parser.add_argument('--model_dir',        type=str)
    parser.add_argument('--model_output_dir', type=str,   default=os.environ['SM_MODEL_DIR'])
    parser.add_argument('--gpu-count',        type=int,   default=os.environ['SM_NUM_GPUS'])
    parser.add_argument('--training',         type=str,   default=os.environ['SM_CHANNEL_TRAINING'])
    parser.add_argument('--validation',       type=str,   default=os.environ['SM_CHANNEL_VALIDATION'])
    parser.add_argument('--eval',             type=str,   default=os.environ['SM_CHANNEL_EVAL'])