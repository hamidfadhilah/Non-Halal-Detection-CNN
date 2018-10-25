node {
  name: "conv2d_1_input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv2d_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 7753239
    }
  }
}
node {
  name: "conv2d_1/random_uniform/sub"
  op: "Sub"
  input: "conv2d_1/random_uniform/max"
  input: "conv2d_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1/random_uniform/mul"
  op: "Mul"
  input: "conv2d_1/random_uniform/RandomUniform"
  input: "conv2d_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1/random_uniform"
  op: "Add"
  input: "conv2d_1/random_uniform/mul"
  input: "conv2d_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1/kernel/Assign"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "conv2d_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1/kernel/read"
  op: "Identity"
  input: "conv2d_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "conv2d_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_1/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1/bias/Assign"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "conv2d_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1/bias/read"
  op: "Identity"
  input: "conv2d_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
}
node {
  name: "conv2d_1/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1/convolution"
  op: "Conv2D"
  input: "conv2d_1_input"
  input: "conv2d_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_1/convolution"
  input: "conv2d_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_1/Relu"
  op: "Relu"
  input: "conv2d_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_2/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 6984037
    }
  }
}
node {
  name: "conv2d_2/random_uniform/sub"
  op: "Sub"
  input: "conv2d_2/random_uniform/max"
  input: "conv2d_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2/random_uniform/mul"
  op: "Mul"
  input: "conv2d_2/random_uniform/RandomUniform"
  input: "conv2d_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2/random_uniform"
  op: "Add"
  input: "conv2d_2/random_uniform/mul"
  input: "conv2d_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2/kernel/Assign"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "conv2d_2/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2/kernel/read"
  op: "Identity"
  input: "conv2d_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "conv2d_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_2/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2/bias/Assign"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "conv2d_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2/bias/read"
  op: "Identity"
  input: "conv2d_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
}
node {
  name: "conv2d_2/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2/convolution"
  op: "Conv2D"
  input: "conv2d_1/Relu"
  input: "conv2d_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_2/convolution"
  input: "conv2d_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_2/Relu"
  op: "Relu"
  input: "conv2d_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d_1/MaxPool"
  op: "MaxPool"
  input: "conv2d_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "dropout_1/keras_learning_phase/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_BOOL
        tensor_shape {
        }
        bool_val: false
      }
    }
  }
}
node {
  name: "dropout_1/keras_learning_phase"
  op: "PlaceholderWithDefault"
  input: "dropout_1/keras_learning_phase/input"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "dropout_1/cond/Switch"
  op: "Switch"
  input: "dropout_1/keras_learning_phase"
  input: "dropout_1/keras_learning_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_1/cond/switch_t"
  op: "Identity"
  input: "dropout_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_1/cond/switch_f"
  op: "Identity"
  input: "dropout_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_1/cond/pred_id"
  op: "Identity"
  input: "dropout_1/keras_learning_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_1/cond/mul/y"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/mul"
  op: "Mul"
  input: "dropout_1/cond/mul/Switch:1"
  input: "dropout_1/cond/mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/mul/Switch"
  op: "Switch"
  input: "max_pooling2d_1/MaxPool"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
}
node {
  name: "dropout_1/cond/dropout/keep_prob"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.75
      }
    }
  }
}
node {
  name: "dropout_1/cond/dropout/Shape"
  op: "Shape"
  input: "dropout_1/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_1/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_1/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_1/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 832656
    }
  }
}
node {
  name: "dropout_1/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "dropout_1/cond/dropout/random_uniform/max"
  input: "dropout_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "dropout_1/cond/dropout/random_uniform/RandomUniform"
  input: "dropout_1/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/dropout/random_uniform"
  op: "Add"
  input: "dropout_1/cond/dropout/random_uniform/mul"
  input: "dropout_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/dropout/add"
  op: "Add"
  input: "dropout_1/cond/dropout/keep_prob"
  input: "dropout_1/cond/dropout/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/dropout/Floor"
  op: "Floor"
  input: "dropout_1/cond/dropout/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/dropout/div"
  op: "RealDiv"
  input: "dropout_1/cond/mul"
  input: "dropout_1/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/dropout/mul"
  op: "Mul"
  input: "dropout_1/cond/dropout/div"
  input: "dropout_1/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/cond/Switch_1"
  op: "Switch"
  input: "max_pooling2d_1/MaxPool"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
}
node {
  name: "dropout_1/cond/Merge"
  op: "Merge"
  input: "dropout_1/cond/Switch_1"
  input: "dropout_1/cond/dropout/mul"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "flatten_1/Shape"
  op: "Shape"
  input: "dropout_1/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "flatten_1/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1/strided_slice"
  op: "StridedSlice"
  input: "flatten_1/Shape"
  input: "flatten_1/strided_slice/stack"
  input: "flatten_1/strided_slice/stack_1"
  input: "flatten_1/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1/Prod"
  op: "Prod"
  input: "flatten_1/strided_slice"
  input: "flatten_1/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "flatten_1/stack/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "flatten_1/stack"
  op: "Pack"
  input: "flatten_1/stack/0"
  input: "flatten_1/Prod"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1/Reshape"
  op: "Reshape"
  input: "dropout_1/cond/Merge"
  input: "flatten_1/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dense_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\020\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "dense_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 140624
    }
  }
}
node {
  name: "dense_1/random_uniform/sub"
  op: "Sub"
  input: "dense_1/random_uniform/max"
  input: "dense_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1/random_uniform/mul"
  op: "Mul"
  input: "dense_1/random_uniform/RandomUniform"
  input: "dense_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1/random_uniform"
  op: "Add"
  input: "dense_1/random_uniform/mul"
  input: "dense_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1/kernel/Assign"
  op: "Assign"
  input: "dense_1/kernel"
  input: "dense_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1/kernel/read"
  op: "Identity"
  input: "dense_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
}
node {
  name: "dense_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_1/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1/bias/Assign"
  op: "Assign"
  input: "dense_1/bias"
  input: "dense_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1/bias/read"
  op: "Identity"
  input: "dense_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
}
node {
  name: "dense_1/MatMul"
  op: "MatMul"
  input: "flatten_1/Reshape"
  input: "dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_1/BiasAdd"
  op: "BiasAdd"
  input: "dense_1/MatMul"
  input: "dense_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_1/Relu"
  op: "Relu"
  input: "dense_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/Switch"
  op: "Switch"
  input: "dropout_1/keras_learning_phase"
  input: "dropout_1/keras_learning_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_2/cond/switch_t"
  op: "Identity"
  input: "dropout_2/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_2/cond/switch_f"
  op: "Identity"
  input: "dropout_2/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_2/cond/pred_id"
  op: "Identity"
  input: "dropout_1/keras_learning_phase"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "dropout_2/cond/mul/y"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/mul"
  op: "Mul"
  input: "dropout_2/cond/mul/Switch:1"
  input: "dropout_2/cond/mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/mul/Switch"
  op: "Switch"
  input: "dense_1/Relu"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
}
node {
  name: "dropout_2/cond/dropout/keep_prob"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "dropout_2/cond/dropout/Shape"
  op: "Shape"
  input: "dropout_2/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dropout_2/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "dropout_2/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dropout_2/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 1285030
    }
  }
}
node {
  name: "dropout_2/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "dropout_2/cond/dropout/random_uniform/max"
  input: "dropout_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "dropout_2/cond/dropout/random_uniform/RandomUniform"
  input: "dropout_2/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/dropout/random_uniform"
  op: "Add"
  input: "dropout_2/cond/dropout/random_uniform/mul"
  input: "dropout_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/dropout/add"
  op: "Add"
  input: "dropout_2/cond/dropout/keep_prob"
  input: "dropout_2/cond/dropout/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/dropout/Floor"
  op: "Floor"
  input: "dropout_2/cond/dropout/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/dropout/div"
  op: "RealDiv"
  input: "dropout_2/cond/mul"
  input: "dropout_2/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/dropout/mul"
  op: "Mul"
  input: "dropout_2/cond/dropout/div"
  input: "dropout_2/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2/cond/Switch_1"
  op: "Switch"
  input: "dense_1/Relu"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
}
node {
  name: "dropout_2/cond/Merge"
  op: "Merge"
  input: "dropout_2/cond/Switch_1"
  input: "dropout_2/cond/dropout/mul"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000$\000\000\000"
      }
    }
  }
}
node {
  name: "dense_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_2/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 6164097
    }
  }
}
node {
  name: "dense_2/random_uniform/sub"
  op: "Sub"
  input: "dense_2/random_uniform/max"
  input: "dense_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2/random_uniform/mul"
  op: "Mul"
  input: "dense_2/random_uniform/RandomUniform"
  input: "dense_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2/random_uniform"
  op: "Add"
  input: "dense_2/random_uniform/mul"
  input: "dense_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2/kernel/Assign"
  op: "Assign"
  input: "dense_2/kernel"
  input: "dense_2/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2/kernel/read"
  op: "Identity"
  input: "dense_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
}
node {
  name: "dense_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 36
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_2/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2/bias/Assign"
  op: "Assign"
  input: "dense_2/bias"
  input: "dense_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2/bias/read"
  op: "Identity"
  input: "dense_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
}
node {
  name: "dense_2/MatMul"
  op: "MatMul"
  input: "dropout_2/cond/Merge"
  input: "dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_2/BiasAdd"
  op: "BiasAdd"
  input: "dense_2/MatMul"
  input: "dense_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_2/Softmax"
  op: "Softmax"
  input: "dense_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Adadelta/lr/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Adadelta/lr"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Adadelta/lr/Assign"
  op: "Assign"
  input: "Adadelta/lr"
  input: "Adadelta/lr/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/lr"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adadelta/lr/read"
  op: "Identity"
  input: "Adadelta/lr"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/lr"
      }
    }
  }
}
node {
  name: "Adadelta/decay/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Adadelta/decay"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Adadelta/decay/Assign"
  op: "Assign"
  input: "Adadelta/decay"
  input: "Adadelta/decay/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/decay"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adadelta/decay/read"
  op: "Identity"
  input: "Adadelta/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/decay"
      }
    }
  }
}
node {
  name: "Adadelta/iterations/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 0
      }
    }
  }
}
node {
  name: "Adadelta/iterations"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Adadelta/iterations/Assign"
  op: "Assign"
  input: "Adadelta/iterations"
  input: "Adadelta/iterations/initial_value"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Adadelta/iterations/read"
  op: "Identity"
  input: "Adadelta/iterations"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/iterations"
      }
    }
  }
}
node {
  name: "dense_2_target"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: -1
        }
      }
    }
  }
}
node {
  name: "dense_2_sample_weights"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/Sum"
  op: "Sum"
  input: "dense_2/Softmax"
  input: "loss/dense_2_loss/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "loss/dense_2_loss/truediv"
  op: "RealDiv"
  input: "dense_2/Softmax"
  input: "loss/dense_2_loss/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/sub"
  op: "Sub"
  input: "loss/dense_2_loss/sub/x"
  input: "loss/dense_2_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/clip_by_value/Minimum"
  op: "Minimum"
  input: "loss/dense_2_loss/truediv"
  input: "loss/dense_2_loss/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/clip_by_value"
  op: "Maximum"
  input: "loss/dense_2_loss/clip_by_value/Minimum"
  input: "loss/dense_2_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/Log"
  op: "Log"
  input: "loss/dense_2_loss/clip_by_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/mul"
  op: "Mul"
  input: "dense_2_target"
  input: "loss/dense_2_loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/Sum_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/Sum_1"
  op: "Sum"
  input: "loss/dense_2_loss/mul"
  input: "loss/dense_2_loss/Sum_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/dense_2_loss/Neg"
  op: "Neg"
  input: "loss/dense_2_loss/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/Mean"
  op: "Mean"
  input: "loss/dense_2_loss/Neg"
  input: "loss/dense_2_loss/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/dense_2_loss/mul_1"
  op: "Mul"
  input: "loss/dense_2_loss/Mean"
  input: "dense_2_sample_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/NotEqual/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/NotEqual"
  op: "NotEqual"
  input: "dense_2_sample_weights"
  input: "loss/dense_2_loss/NotEqual/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/Cast"
  op: "Cast"
  input: "loss/dense_2_loss/NotEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "loss/dense_2_loss/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/Mean_1"
  op: "Mean"
  input: "loss/dense_2_loss/Cast"
  input: "loss/dense_2_loss/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/dense_2_loss/truediv_1"
  op: "RealDiv"
  input: "loss/dense_2_loss/mul_1"
  input: "loss/dense_2_loss/Mean_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/dense_2_loss/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/dense_2_loss/Mean_2"
  op: "Mean"
  input: "loss/dense_2_loss/truediv_1"
  input: "loss/dense_2_loss/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/mul"
  op: "Mul"
  input: "loss/mul/x"
  input: "loss/dense_2_loss/Mean_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/acc/ArgMax/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "metrics/acc/ArgMax"
  op: "ArgMax"
  input: "dense_2_target"
  input: "metrics/acc/ArgMax/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "metrics/acc/ArgMax_1/dimension"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "metrics/acc/ArgMax_1"
  op: "ArgMax"
  input: "dense_2/Softmax"
  input: "metrics/acc/ArgMax_1/dimension"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "output_type"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "metrics/acc/Equal"
  op: "Equal"
  input: "metrics/acc/ArgMax"
  input: "metrics/acc/ArgMax_1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "metrics/acc/Cast"
  op: "Cast"
  input: "metrics/acc/Equal"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "metrics/acc/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "metrics/acc/Mean"
  op: "Mean"
  input: "metrics/acc/Cast"
  input: "metrics/acc/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/grad_ys_0"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Fill"
  op: "Fill"
  input: "training/Adadelta/gradients/Shape"
  input: "training/Adadelta/gradients/grad_ys_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/mul_grad/Mul"
  op: "Mul"
  input: "training/Adadelta/gradients/Fill"
  input: "loss/dense_2_loss/Mean_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/mul_grad/Mul_1"
  op: "Mul"
  input: "training/Adadelta/gradients/Fill"
  input: "loss/mul/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/mul_grad/Mul_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Shape"
  op: "Shape"
  input: "loss/dense_2_loss/truediv_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Tile"
  op: "Tile"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Shape_1"
  op: "Shape"
  input: "loss/dense_2_loss/truediv_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Shape_2"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Prod"
  op: "Prod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Shape_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Const_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Prod_1"
  op: "Prod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Shape_2"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Maximum"
  op: "Maximum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Prod_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/floordiv"
  op: "FloorDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Prod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Cast"
  op: "Cast"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/truediv"
  op: "RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Tile"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean_2"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Shape"
  op: "Shape"
  input: "loss/dense_2_loss/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/RealDiv"
  op: "RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/truediv"
  input: "loss/dense_2_loss/Mean_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Neg"
  op: "Neg"
  input: "loss/dense_2_loss/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/RealDiv_1"
  op: "RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Neg"
  input: "loss/dense_2_loss/Mean_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/RealDiv_2"
  op: "RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/RealDiv_1"
  input: "loss/dense_2_loss/Mean_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_2_grad/truediv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Sum_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Shape"
  op: "Shape"
  input: "loss/dense_2_loss/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Shape_1"
  op: "Shape"
  input: "dense_2_sample_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Reshape"
  input: "dense_2_sample_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/mul_1"
  op: "Mul"
  input: "loss/dense_2_loss/Mean"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_1_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/mul_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Sum_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape"
  op: "Shape"
  input: "loss/dense_2_loss/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/add"
  op: "Add"
  input: "loss/dense_2_loss/Mean/reduction_indices"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/mod"
  op: "FloorMod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/add"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/range"
  op: "Range"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/range/start"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Size"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Fill"
  op: "Fill"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/range"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/mod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Maximum"
  op: "Maximum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/DynamicStitch"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_1_grad/Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Tile"
  op: "Tile"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape_2"
  op: "Shape"
  input: "loss/dense_2_loss/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape_3"
  op: "Shape"
  input: "loss/dense_2_loss/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Prod"
  op: "Prod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape_2"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Prod_1"
  op: "Prod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Shape_3"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Maximum_1"
  op: "Maximum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Prod_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Prod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Cast"
  op: "Cast"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/truediv"
  op: "RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Tile"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Mean"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Neg_grad/Neg"
  op: "Neg"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Mean_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Neg"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Shape"
  op: "Shape"
  input: "loss/dense_2_loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/add"
  op: "Add"
  input: "loss/dense_2_loss/Sum_1/reduction_indices"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/mod"
  op: "FloorMod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/add"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/range"
  op: "Range"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/range/start"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Size"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Fill"
  op: "Fill"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Shape_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/range"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/mod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Maximum"
  op: "Maximum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/DynamicStitch"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/floordiv"
  op: "FloorDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Neg_grad/Neg"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Tile"
  op: "Tile"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Shape"
  op: "Shape"
  input: "dense_2_target"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Shape_1"
  op: "Shape"
  input: "loss/dense_2_loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Tile"
  input: "loss/dense_2_loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/mul_1"
  op: "Mul"
  input: "dense_2_target"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_1_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/mul_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Sum_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Log_grad/Reciprocal"
  op: "Reciprocal"
  input: "loss/dense_2_loss/clip_by_value"
  input: "^training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Log"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Log_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/mul_grad/Reshape_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Log_grad/Reciprocal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Log"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Shape"
  op: "Shape"
  input: "loss/dense_2_loss/clip_by_value/Minimum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_2"
  op: "Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Log_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/zeros"
  op: "Fill"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_2"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/GreaterEqual"
  op: "GreaterEqual"
  input: "loss/dense_2_loss/clip_by_value/Minimum"
  input: "loss/dense_2_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Select"
  op: "Select"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/GreaterEqual"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Log_grad/mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Select_1"
  op: "Select"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/GreaterEqual"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/zeros"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Log_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Select"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Select_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Sum_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape"
  op: "Shape"
  input: "loss/dense_2_loss/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_2"
  op: "Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zeros"
  op: "Fill"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_2"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/LessEqual"
  op: "LessEqual"
  input: "loss/dense_2_loss/truediv"
  input: "loss/dense_2_loss/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Select"
  op: "Select"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/LessEqual"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Select_1"
  op: "Select"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/LessEqual"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/zeros"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Select"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Select_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Sum_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Shape"
  op: "Shape"
  input: "dense_2/Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Shape_1"
  op: "Shape"
  input: "loss/dense_2_loss/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/RealDiv"
  op: "RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Reshape"
  input: "loss/dense_2_loss/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Neg"
  op: "Neg"
  input: "dense_2/Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/RealDiv_1"
  op: "RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Neg"
  input: "loss/dense_2_loss/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/RealDiv_2"
  op: "RealDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/RealDiv_1"
  input: "loss/dense_2_loss/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/clip_by_value/Minimum_grad/Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/mul"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Sum_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Shape"
  op: "Shape"
  input: "dense_2/Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/add"
  op: "Add"
  input: "loss/dense_2_loss/Sum/reduction_indices"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/mod"
  op: "FloorMod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/add"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/range"
  op: "Range"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/range/start"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Size"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Fill"
  op: "Fill"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Shape_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/range"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/mod"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Maximum"
  op: "Maximum"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/DynamicStitch"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/floordiv"
  op: "FloorDiv"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Shape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Reshape_1"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Tile"
  op: "Tile"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/Sum"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/AddN"
  op: "AddN"
  input: "training/Adadelta/gradients/loss/dense_2_loss/truediv_grad/Reshape"
  input: "training/Adadelta/gradients/loss/dense_2_loss/Sum_grad/Tile"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/dense_2_loss/truediv"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/Softmax_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/AddN"
  input: "dense_2/Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/Softmax"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/Softmax_grad/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/Softmax"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/Softmax_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/mul"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/Softmax"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/Softmax_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/Softmax"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\377\377\377\377\001\000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/Softmax_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/Sum"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/Softmax"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/Softmax_grad/sub"
  op: "Sub"
  input: "training/Adadelta/gradients/AddN"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/Softmax"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/Softmax_grad/mul_1"
  op: "Mul"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/sub"
  input: "dense_2/Softmax"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/Softmax"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/MatMul_grad/MatMul"
  op: "MatMul"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/mul_1"
  input: "dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/MatMul"
      }
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_2/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_2/cond/Merge"
  input: "training/Adadelta/gradients/dense_2/Softmax_grad/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/MatMul"
      }
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "training/Adadelta/gradients/dense_2/MatMul_grad/MatMul"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/MatMul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Switch"
  op: "Switch"
  input: "dense_1/Relu"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Shape_1"
  op: "Shape"
  input: "training/Adadelta/gradients/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/zeros"
  op: "Fill"
  input: "training/Adadelta/gradients/Shape_1"
  input: "training/Adadelta/gradients/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "training/Adadelta/gradients/dropout_2/cond/Merge_grad/cond_grad"
  input: "training/Adadelta/gradients/zeros"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "dropout_2/cond/dropout/div"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_2/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Shape"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/dropout_2/cond/Merge_grad/cond_grad:1"
  input: "dropout_2/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/mul"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/mul_1"
  op: "Mul"
  input: "dropout_2/cond/dropout/div"
  input: "training/Adadelta/gradients/dropout_2/cond/Merge_grad/cond_grad:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/mul_1"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Sum_1"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Shape"
  op: "Shape"
  input: "dropout_2/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Shape"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/RealDiv"
  op: "RealDiv"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Reshape"
  input: "dropout_2/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/RealDiv"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Neg"
  op: "Neg"
  input: "dropout_2/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/RealDiv_1"
  op: "RealDiv"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Neg"
  input: "dropout_2/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/RealDiv_2"
  op: "RealDiv"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/RealDiv_1"
  input: "dropout_2/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/mul_grad/Reshape"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/mul"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Sum_1"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Shape"
  op: "Shape"
  input: "dropout_2/cond/mul/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Shape"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Reshape"
  input: "dropout_2/cond/mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/mul"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/mul_1"
  op: "Mul"
  input: "dropout_2/cond/mul/Switch:1"
  input: "training/Adadelta/gradients/dropout_2/cond/dropout/div_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/mul_1"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Sum_1"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_2/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Switch_1"
  op: "Switch"
  input: "dense_1/Relu"
  input: "dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Shape_2"
  op: "Shape"
  input: "training/Adadelta/gradients/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/zeros_1/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/zeros_1"
  op: "Fill"
  input: "training/Adadelta/gradients/Shape_2"
  input: "training/Adadelta/gradients/zeros_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_2/cond/mul/Switch_grad/cond_grad"
  op: "Merge"
  input: "training/Adadelta/gradients/zeros_1"
  input: "training/Adadelta/gradients/dropout_2/cond/mul_grad/Reshape"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/AddN_1"
  op: "AddN"
  input: "training/Adadelta/gradients/dropout_2/cond/Switch_1_grad/cond_grad"
  input: "training/Adadelta/gradients/dropout_2/cond/mul/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_1/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "training/Adadelta/gradients/AddN_1"
  input: "dense_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/Relu"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/Adadelta/gradients/dense_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_1/MatMul_grad/MatMul"
  op: "MatMul"
  input: "training/Adadelta/gradients/dense_1/Relu_grad/ReluGrad"
  input: "dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/MatMul"
      }
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/gradients/dense_1/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "flatten_1/Reshape"
  input: "training/Adadelta/gradients/dense_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/MatMul"
      }
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/flatten_1/Reshape_grad/Shape"
  op: "Shape"
  input: "dropout_1/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@flatten_1/Reshape"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/flatten_1/Reshape_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/dense_1/MatMul_grad/MatMul"
  input: "training/Adadelta/gradients/flatten_1/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@flatten_1/Reshape"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "training/Adadelta/gradients/flatten_1/Reshape_grad/Reshape"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@flatten_1/Reshape"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Switch_2"
  op: "Switch"
  input: "max_pooling2d_1/MaxPool"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Shape_3"
  op: "Shape"
  input: "training/Adadelta/gradients/Switch_2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/zeros_2/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/zeros_2"
  op: "Fill"
  input: "training/Adadelta/gradients/Shape_3"
  input: "training/Adadelta/gradients/zeros_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/Switch_1_grad/cond_grad"
  op: "Merge"
  input: "training/Adadelta/gradients/dropout_1/cond/Merge_grad/cond_grad"
  input: "training/Adadelta/gradients/zeros_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "dropout_1/cond/dropout/div"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Shape_1"
  op: "Shape"
  input: "dropout_1/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Shape"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/dropout_1/cond/Merge_grad/cond_grad:1"
  input: "dropout_1/cond/dropout/Floor"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/mul"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/mul_1"
  op: "Mul"
  input: "dropout_1/cond/dropout/div"
  input: "training/Adadelta/gradients/dropout_1/cond/Merge_grad/cond_grad:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/mul_1"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Sum_1"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Shape"
  op: "Shape"
  input: "dropout_1/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Shape"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/RealDiv"
  op: "RealDiv"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Reshape"
  input: "dropout_1/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/RealDiv"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Neg"
  op: "Neg"
  input: "dropout_1/cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/RealDiv_1"
  op: "RealDiv"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Neg"
  input: "dropout_1/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/RealDiv_2"
  op: "RealDiv"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/RealDiv_1"
  input: "dropout_1/cond/dropout/keep_prob"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/mul_grad/Reshape"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/mul"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Sum_1"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/dropout/div"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Shape"
  op: "Shape"
  input: "dropout_1/cond/mul/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Shape"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/mul"
  op: "Mul"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Reshape"
  input: "dropout_1/cond/mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Sum"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/mul"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Reshape"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/mul_1"
  op: "Mul"
  input: "dropout_1/cond/mul/Switch:1"
  input: "training/Adadelta/gradients/dropout_1/cond/dropout/div_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Sum_1"
  op: "Sum"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/mul_1"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Reshape_1"
  op: "Reshape"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Sum_1"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dropout_1/cond/mul"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Switch_3"
  op: "Switch"
  input: "max_pooling2d_1/MaxPool"
  input: "dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/Shape_4"
  op: "Shape"
  input: "training/Adadelta/gradients/Switch_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/zeros_3/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/zeros_3"
  op: "Fill"
  input: "training/Adadelta/gradients/Shape_4"
  input: "training/Adadelta/gradients/zeros_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/dropout_1/cond/mul/Switch_grad/cond_grad"
  op: "Merge"
  input: "training/Adadelta/gradients/zeros_3"
  input: "training/Adadelta/gradients/dropout_1/cond/mul_grad/Reshape"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/AddN_2"
  op: "AddN"
  input: "training/Adadelta/gradients/dropout_1/cond/Switch_1_grad/cond_grad"
  input: "training/Adadelta/gradients/dropout_1/cond/mul/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "conv2d_2/Relu"
  input: "max_pooling2d_1/MaxPool"
  input: "training/Adadelta/gradients/AddN_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_2/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "training/Adadelta/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGrad"
  input: "conv2d_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/Relu"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/Adadelta/gradients/conv2d_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_2/convolution_grad/ShapeN"
  op: "ShapeN"
  input: "conv2d_1/Relu"
  input: "conv2d_2/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/convolution"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_2/convolution_grad/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/convolution"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_2/convolution_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "training/Adadelta/gradients/conv2d_2/convolution_grad/ShapeN"
  input: "conv2d_2/kernel/read"
  input: "training/Adadelta/gradients/conv2d_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "conv2d_1/Relu"
  input: "training/Adadelta/gradients/conv2d_2/convolution_grad/Const"
  input: "training/Adadelta/gradients/conv2d_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_1/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "training/Adadelta/gradients/conv2d_2/convolution_grad/Conv2DBackpropInput"
  input: "conv2d_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/Relu"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/Adadelta/gradients/conv2d_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_1/convolution_grad/ShapeN"
  op: "ShapeN"
  input: "conv2d_1_input"
  input: "conv2d_1/kernel/read"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/convolution"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_1/convolution_grad/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/convolution"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_1/convolution_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "training/Adadelta/gradients/conv2d_1/convolution_grad/ShapeN"
  input: "conv2d_1/kernel/read"
  input: "training/Adadelta/gradients/conv2d_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/gradients/conv2d_1/convolution_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "conv2d_1_input"
  input: "training/Adadelta/gradients/conv2d_1/convolution_grad/Const"
  input: "training/Adadelta/gradients/conv2d_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/zeros/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros"
  op: "Fill"
  input: "training/Adadelta/zeros/shape_as_tensor"
  input: "training/Adadelta/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable"
  input: "training/Adadelta/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable/read"
  op: "Identity"
  input: "training/Adadelta/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_1/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_1"
  op: "Fill"
  input: "training/Adadelta/zeros_1/shape_as_tensor"
  input: "training/Adadelta/zeros_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_1/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_1"
  input: "training/Adadelta/zeros_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_1/read"
  op: "Identity"
  input: "training/Adadelta/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_1"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_2/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_2"
  op: "Fill"
  input: "training/Adadelta/zeros_2/shape_as_tensor"
  input: "training/Adadelta/zeros_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_2"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_2/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_2"
  input: "training/Adadelta/zeros_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_2/read"
  op: "Identity"
  input: "training/Adadelta/Variable_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_2"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_3/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_3"
  op: "Fill"
  input: "training/Adadelta/zeros_3/shape_as_tensor"
  input: "training/Adadelta/zeros_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_3"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_3/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_3"
  input: "training/Adadelta/zeros_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_3/read"
  op: "Identity"
  input: "training/Adadelta/Variable_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_3"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_4/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\020\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_4"
  op: "Fill"
  input: "training/Adadelta/zeros_4/shape_as_tensor"
  input: "training/Adadelta/zeros_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_4"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_4/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_4"
  input: "training/Adadelta/zeros_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_4/read"
  op: "Identity"
  input: "training/Adadelta/Variable_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_4"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_5/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_5/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_5"
  op: "Fill"
  input: "training/Adadelta/zeros_5/shape_as_tensor"
  input: "training/Adadelta/zeros_5/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_5"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_5/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_5"
  input: "training/Adadelta/zeros_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_5/read"
  op: "Identity"
  input: "training/Adadelta/Variable_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_5"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_6/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000$\000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_6/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_6"
  op: "Fill"
  input: "training/Adadelta/zeros_6/shape_as_tensor"
  input: "training/Adadelta/zeros_6/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_6"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_6/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_6"
  input: "training/Adadelta/zeros_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_6/read"
  op: "Identity"
  input: "training/Adadelta/Variable_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_6"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_7/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 36
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_7/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_7"
  op: "Fill"
  input: "training/Adadelta/zeros_7/shape_as_tensor"
  input: "training/Adadelta/zeros_7/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_7"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_7/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_7"
  input: "training/Adadelta/zeros_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_7/read"
  op: "Identity"
  input: "training/Adadelta/Variable_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_7"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_8/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_8/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_8"
  op: "Fill"
  input: "training/Adadelta/zeros_8/shape_as_tensor"
  input: "training/Adadelta/zeros_8/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_8"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_8/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_8"
  input: "training/Adadelta/zeros_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_8/read"
  op: "Identity"
  input: "training/Adadelta/Variable_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_8"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_9/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_9/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_9"
  op: "Fill"
  input: "training/Adadelta/zeros_9/shape_as_tensor"
  input: "training/Adadelta/zeros_9/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_9"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_9/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_9"
  input: "training/Adadelta/zeros_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_9/read"
  op: "Identity"
  input: "training/Adadelta/Variable_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_10/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_10/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_10"
  op: "Fill"
  input: "training/Adadelta/zeros_10/shape_as_tensor"
  input: "training/Adadelta/zeros_10/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_10"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_10/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_10"
  input: "training/Adadelta/zeros_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_10/read"
  op: "Identity"
  input: "training/Adadelta/Variable_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_10"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_11/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 64
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_11/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_11"
  op: "Fill"
  input: "training/Adadelta/zeros_11/shape_as_tensor"
  input: "training/Adadelta/zeros_11/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_11"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_11/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_11"
  input: "training/Adadelta/zeros_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_11/read"
  op: "Identity"
  input: "training/Adadelta/Variable_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_11"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_12/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\020\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_12/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_12"
  op: "Fill"
  input: "training/Adadelta/zeros_12/shape_as_tensor"
  input: "training/Adadelta/zeros_12/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_12"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_12/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_12"
  input: "training/Adadelta/zeros_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_12/read"
  op: "Identity"
  input: "training/Adadelta/Variable_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_12"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_13/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_13/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_13"
  op: "Fill"
  input: "training/Adadelta/zeros_13/shape_as_tensor"
  input: "training/Adadelta/zeros_13/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_13"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_13/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_13"
  input: "training/Adadelta/zeros_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_13/read"
  op: "Identity"
  input: "training/Adadelta/Variable_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_13"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_14/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000$\000\000\000"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_14/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_14"
  op: "Fill"
  input: "training/Adadelta/zeros_14/shape_as_tensor"
  input: "training/Adadelta/zeros_14/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_14"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_14/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_14"
  input: "training/Adadelta/zeros_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_14/read"
  op: "Identity"
  input: "training/Adadelta/Variable_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_14"
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_15/shape_as_tensor"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 36
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_15/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/zeros_15"
  op: "Fill"
  input: "training/Adadelta/zeros_15/shape_as_tensor"
  input: "training/Adadelta/zeros_15/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/Adadelta/Variable_15"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/Adadelta/Variable_15/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable_15"
  input: "training/Adadelta/zeros_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/Variable_15/read"
  op: "Identity"
  input: "training/Adadelta/Variable_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_15"
      }
    }
  }
}
node {
  name: "training/Adadelta/AssignAdd/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 1
      }
    }
  }
}
node {
  name: "training/Adadelta/AssignAdd"
  op: "AssignAdd"
  input: "Adadelta/iterations"
  input: "training/Adadelta/AssignAdd/value"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "training/Adadelta/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul"
  op: "Mul"
  input: "training/Adadelta/mul/x"
  input: "training/Adadelta/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square"
  op: "Square"
  input: "training/Adadelta/gradients/conv2d_1/convolution_grad/Conv2DBackpropFilter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_1"
  op: "Mul"
  input: "training/Adadelta/mul_1/x"
  input: "training/Adadelta/Square"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add"
  op: "Add"
  input: "training/Adadelta/mul"
  input: "training/Adadelta/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign"
  op: "Assign"
  input: "training/Adadelta/Variable"
  input: "training/Adadelta/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/add_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_1"
  op: "Add"
  input: "training/Adadelta/Variable_8/read"
  input: "training/Adadelta/add_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_1"
  input: "training/Adadelta/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value/Minimum"
  input: "training/Adadelta/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_2"
  op: "Mul"
  input: "training/Adadelta/gradients/conv2d_1/convolution_grad/Conv2DBackpropFilter"
  input: "training/Adadelta/Sqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_2"
  op: "Add"
  input: "training/Adadelta/add"
  input: "training/Adadelta/add_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_1/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_2"
  input: "training/Adadelta/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_1"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_1/Minimum"
  input: "training/Adadelta/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_1"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/truediv"
  op: "RealDiv"
  input: "training/Adadelta/mul_2"
  input: "training/Adadelta/Sqrt_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_3"
  op: "Mul"
  input: "Adadelta/lr/read"
  input: "training/Adadelta/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/sub"
  op: "Sub"
  input: "conv2d_1/kernel/read"
  input: "training/Adadelta/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_1"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "training/Adadelta/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_4/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_4"
  op: "Mul"
  input: "training/Adadelta/mul_4/x"
  input: "training/Adadelta/Variable_8/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_1"
  op: "Square"
  input: "training/Adadelta/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_5/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_5"
  op: "Mul"
  input: "training/Adadelta/mul_5/x"
  input: "training/Adadelta/Square_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_3"
  op: "Add"
  input: "training/Adadelta/mul_4"
  input: "training/Adadelta/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_2"
  op: "Assign"
  input: "training/Adadelta/Variable_8"
  input: "training/Adadelta/add_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_6/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_6"
  op: "Mul"
  input: "training/Adadelta/mul_6/x"
  input: "training/Adadelta/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_2"
  op: "Square"
  input: "training/Adadelta/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_7/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_7"
  op: "Mul"
  input: "training/Adadelta/mul_7/x"
  input: "training/Adadelta/Square_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_4"
  op: "Add"
  input: "training/Adadelta/mul_6"
  input: "training/Adadelta/mul_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_3"
  op: "Assign"
  input: "training/Adadelta/Variable_1"
  input: "training/Adadelta/add_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/add_5/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_5"
  op: "Add"
  input: "training/Adadelta/Variable_9/read"
  input: "training/Adadelta/add_5/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_4"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_5"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_2/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_5"
  input: "training/Adadelta/Const_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_2"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_2/Minimum"
  input: "training/Adadelta/Const_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_2"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_8"
  op: "Mul"
  input: "training/Adadelta/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad"
  input: "training/Adadelta/Sqrt_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_6/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_6"
  op: "Add"
  input: "training/Adadelta/add_4"
  input: "training/Adadelta/add_6/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_6"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_7"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_3/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_6"
  input: "training/Adadelta/Const_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_3"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_3/Minimum"
  input: "training/Adadelta/Const_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_3"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/truediv_1"
  op: "RealDiv"
  input: "training/Adadelta/mul_8"
  input: "training/Adadelta/Sqrt_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_9"
  op: "Mul"
  input: "Adadelta/lr/read"
  input: "training/Adadelta/truediv_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/sub_1"
  op: "Sub"
  input: "conv2d_1/bias/read"
  input: "training/Adadelta/mul_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_4"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "training/Adadelta/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_10/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_10"
  op: "Mul"
  input: "training/Adadelta/mul_10/x"
  input: "training/Adadelta/Variable_9/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_3"
  op: "Square"
  input: "training/Adadelta/truediv_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_11/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_11"
  op: "Mul"
  input: "training/Adadelta/mul_11/x"
  input: "training/Adadelta/Square_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_7"
  op: "Add"
  input: "training/Adadelta/mul_10"
  input: "training/Adadelta/mul_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_5"
  op: "Assign"
  input: "training/Adadelta/Variable_9"
  input: "training/Adadelta/add_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_12/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_12"
  op: "Mul"
  input: "training/Adadelta/mul_12/x"
  input: "training/Adadelta/Variable_2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_4"
  op: "Square"
  input: "training/Adadelta/gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_13/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_13"
  op: "Mul"
  input: "training/Adadelta/mul_13/x"
  input: "training/Adadelta/Square_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_8"
  op: "Add"
  input: "training/Adadelta/mul_12"
  input: "training/Adadelta/mul_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_6"
  op: "Assign"
  input: "training/Adadelta/Variable_2"
  input: "training/Adadelta/add_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/add_9/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_9"
  op: "Add"
  input: "training/Adadelta/Variable_10/read"
  input: "training/Adadelta/add_9/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_8"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_9"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_4/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_9"
  input: "training/Adadelta/Const_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_4"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_4/Minimum"
  input: "training/Adadelta/Const_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_4"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_14"
  op: "Mul"
  input: "training/Adadelta/gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter"
  input: "training/Adadelta/Sqrt_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_10/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_10"
  op: "Add"
  input: "training/Adadelta/add_8"
  input: "training/Adadelta/add_10/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_10"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_11"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_5/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_10"
  input: "training/Adadelta/Const_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_5"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_5/Minimum"
  input: "training/Adadelta/Const_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_5"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/truediv_2"
  op: "RealDiv"
  input: "training/Adadelta/mul_14"
  input: "training/Adadelta/Sqrt_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_15"
  op: "Mul"
  input: "Adadelta/lr/read"
  input: "training/Adadelta/truediv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/sub_2"
  op: "Sub"
  input: "conv2d_2/kernel/read"
  input: "training/Adadelta/mul_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_7"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "training/Adadelta/sub_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_16/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_16"
  op: "Mul"
  input: "training/Adadelta/mul_16/x"
  input: "training/Adadelta/Variable_10/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_5"
  op: "Square"
  input: "training/Adadelta/truediv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_17/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_17"
  op: "Mul"
  input: "training/Adadelta/mul_17/x"
  input: "training/Adadelta/Square_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_11"
  op: "Add"
  input: "training/Adadelta/mul_16"
  input: "training/Adadelta/mul_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_8"
  op: "Assign"
  input: "training/Adadelta/Variable_10"
  input: "training/Adadelta/add_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_18/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_18"
  op: "Mul"
  input: "training/Adadelta/mul_18/x"
  input: "training/Adadelta/Variable_3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_6"
  op: "Square"
  input: "training/Adadelta/gradients/conv2d_2/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_19/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_19"
  op: "Mul"
  input: "training/Adadelta/mul_19/x"
  input: "training/Adadelta/Square_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_12"
  op: "Add"
  input: "training/Adadelta/mul_18"
  input: "training/Adadelta/mul_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_9"
  op: "Assign"
  input: "training/Adadelta/Variable_3"
  input: "training/Adadelta/add_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/add_13/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_13"
  op: "Add"
  input: "training/Adadelta/Variable_11/read"
  input: "training/Adadelta/add_13/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_12"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_13"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_6/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_13"
  input: "training/Adadelta/Const_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_6"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_6/Minimum"
  input: "training/Adadelta/Const_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_6"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_20"
  op: "Mul"
  input: "training/Adadelta/gradients/conv2d_2/BiasAdd_grad/BiasAddGrad"
  input: "training/Adadelta/Sqrt_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_14/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_14"
  op: "Add"
  input: "training/Adadelta/add_12"
  input: "training/Adadelta/add_14/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_14"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_15"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_7/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_14"
  input: "training/Adadelta/Const_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_7"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_7/Minimum"
  input: "training/Adadelta/Const_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_7"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/truediv_3"
  op: "RealDiv"
  input: "training/Adadelta/mul_20"
  input: "training/Adadelta/Sqrt_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_21"
  op: "Mul"
  input: "Adadelta/lr/read"
  input: "training/Adadelta/truediv_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/sub_3"
  op: "Sub"
  input: "conv2d_2/bias/read"
  input: "training/Adadelta/mul_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_10"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "training/Adadelta/sub_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_22/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_22"
  op: "Mul"
  input: "training/Adadelta/mul_22/x"
  input: "training/Adadelta/Variable_11/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_7"
  op: "Square"
  input: "training/Adadelta/truediv_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_23/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_23"
  op: "Mul"
  input: "training/Adadelta/mul_23/x"
  input: "training/Adadelta/Square_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_15"
  op: "Add"
  input: "training/Adadelta/mul_22"
  input: "training/Adadelta/mul_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_11"
  op: "Assign"
  input: "training/Adadelta/Variable_11"
  input: "training/Adadelta/add_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_24/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_24"
  op: "Mul"
  input: "training/Adadelta/mul_24/x"
  input: "training/Adadelta/Variable_4/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_8"
  op: "Square"
  input: "training/Adadelta/gradients/dense_1/MatMul_grad/MatMul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_25/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_25"
  op: "Mul"
  input: "training/Adadelta/mul_25/x"
  input: "training/Adadelta/Square_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_16"
  op: "Add"
  input: "training/Adadelta/mul_24"
  input: "training/Adadelta/mul_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_12"
  op: "Assign"
  input: "training/Adadelta/Variable_4"
  input: "training/Adadelta/add_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/add_17/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_17"
  op: "Add"
  input: "training/Adadelta/Variable_12/read"
  input: "training/Adadelta/add_17/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_16"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_17"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_8/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_17"
  input: "training/Adadelta/Const_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_8"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_8/Minimum"
  input: "training/Adadelta/Const_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_8"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_26"
  op: "Mul"
  input: "training/Adadelta/gradients/dense_1/MatMul_grad/MatMul_1"
  input: "training/Adadelta/Sqrt_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_18/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_18"
  op: "Add"
  input: "training/Adadelta/add_16"
  input: "training/Adadelta/add_18/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_18"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_19"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_9/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_18"
  input: "training/Adadelta/Const_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_9"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_9/Minimum"
  input: "training/Adadelta/Const_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_9"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/truediv_4"
  op: "RealDiv"
  input: "training/Adadelta/mul_26"
  input: "training/Adadelta/Sqrt_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_27"
  op: "Mul"
  input: "Adadelta/lr/read"
  input: "training/Adadelta/truediv_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/sub_4"
  op: "Sub"
  input: "dense_1/kernel/read"
  input: "training/Adadelta/mul_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_13"
  op: "Assign"
  input: "dense_1/kernel"
  input: "training/Adadelta/sub_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_28/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_28"
  op: "Mul"
  input: "training/Adadelta/mul_28/x"
  input: "training/Adadelta/Variable_12/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_9"
  op: "Square"
  input: "training/Adadelta/truediv_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_29/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_29"
  op: "Mul"
  input: "training/Adadelta/mul_29/x"
  input: "training/Adadelta/Square_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_19"
  op: "Add"
  input: "training/Adadelta/mul_28"
  input: "training/Adadelta/mul_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_14"
  op: "Assign"
  input: "training/Adadelta/Variable_12"
  input: "training/Adadelta/add_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_30/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_30"
  op: "Mul"
  input: "training/Adadelta/mul_30/x"
  input: "training/Adadelta/Variable_5/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_10"
  op: "Square"
  input: "training/Adadelta/gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_31/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_31"
  op: "Mul"
  input: "training/Adadelta/mul_31/x"
  input: "training/Adadelta/Square_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_20"
  op: "Add"
  input: "training/Adadelta/mul_30"
  input: "training/Adadelta/mul_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_15"
  op: "Assign"
  input: "training/Adadelta/Variable_5"
  input: "training/Adadelta/add_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/add_21/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_21"
  op: "Add"
  input: "training/Adadelta/Variable_13/read"
  input: "training/Adadelta/add_21/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_20"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_21"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_10/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_21"
  input: "training/Adadelta/Const_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_10"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_10/Minimum"
  input: "training/Adadelta/Const_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_10"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_32"
  op: "Mul"
  input: "training/Adadelta/gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  input: "training/Adadelta/Sqrt_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_22/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_22"
  op: "Add"
  input: "training/Adadelta/add_20"
  input: "training/Adadelta/add_22/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_22"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_23"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_11/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_22"
  input: "training/Adadelta/Const_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_11"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_11/Minimum"
  input: "training/Adadelta/Const_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_11"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/truediv_5"
  op: "RealDiv"
  input: "training/Adadelta/mul_32"
  input: "training/Adadelta/Sqrt_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_33"
  op: "Mul"
  input: "Adadelta/lr/read"
  input: "training/Adadelta/truediv_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/sub_5"
  op: "Sub"
  input: "dense_1/bias/read"
  input: "training/Adadelta/mul_33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_16"
  op: "Assign"
  input: "dense_1/bias"
  input: "training/Adadelta/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_34/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_34"
  op: "Mul"
  input: "training/Adadelta/mul_34/x"
  input: "training/Adadelta/Variable_13/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_11"
  op: "Square"
  input: "training/Adadelta/truediv_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_35/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_35"
  op: "Mul"
  input: "training/Adadelta/mul_35/x"
  input: "training/Adadelta/Square_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_23"
  op: "Add"
  input: "training/Adadelta/mul_34"
  input: "training/Adadelta/mul_35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_17"
  op: "Assign"
  input: "training/Adadelta/Variable_13"
  input: "training/Adadelta/add_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_36/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_36"
  op: "Mul"
  input: "training/Adadelta/mul_36/x"
  input: "training/Adadelta/Variable_6/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_12"
  op: "Square"
  input: "training/Adadelta/gradients/dense_2/MatMul_grad/MatMul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_37/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_37"
  op: "Mul"
  input: "training/Adadelta/mul_37/x"
  input: "training/Adadelta/Square_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_24"
  op: "Add"
  input: "training/Adadelta/mul_36"
  input: "training/Adadelta/mul_37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_18"
  op: "Assign"
  input: "training/Adadelta/Variable_6"
  input: "training/Adadelta/add_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/add_25/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_25"
  op: "Add"
  input: "training/Adadelta/Variable_14/read"
  input: "training/Adadelta/add_25/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_24"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_25"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_12/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_25"
  input: "training/Adadelta/Const_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_12"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_12/Minimum"
  input: "training/Adadelta/Const_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_12"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_38"
  op: "Mul"
  input: "training/Adadelta/gradients/dense_2/MatMul_grad/MatMul_1"
  input: "training/Adadelta/Sqrt_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_26/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_26"
  op: "Add"
  input: "training/Adadelta/add_24"
  input: "training/Adadelta/add_26/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_26"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_27"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_13/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_26"
  input: "training/Adadelta/Const_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_13"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_13/Minimum"
  input: "training/Adadelta/Const_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_13"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/truediv_6"
  op: "RealDiv"
  input: "training/Adadelta/mul_38"
  input: "training/Adadelta/Sqrt_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_39"
  op: "Mul"
  input: "Adadelta/lr/read"
  input: "training/Adadelta/truediv_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/sub_6"
  op: "Sub"
  input: "dense_2/kernel/read"
  input: "training/Adadelta/mul_39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_19"
  op: "Assign"
  input: "dense_2/kernel"
  input: "training/Adadelta/sub_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_40/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_40"
  op: "Mul"
  input: "training/Adadelta/mul_40/x"
  input: "training/Adadelta/Variable_14/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_13"
  op: "Square"
  input: "training/Adadelta/truediv_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_41/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_41"
  op: "Mul"
  input: "training/Adadelta/mul_41/x"
  input: "training/Adadelta/Square_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_27"
  op: "Add"
  input: "training/Adadelta/mul_40"
  input: "training/Adadelta/mul_41"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_20"
  op: "Assign"
  input: "training/Adadelta/Variable_14"
  input: "training/Adadelta/add_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_42/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_42"
  op: "Mul"
  input: "training/Adadelta/mul_42/x"
  input: "training/Adadelta/Variable_7/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_14"
  op: "Square"
  input: "training/Adadelta/gradients/dense_2/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_43/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_43"
  op: "Mul"
  input: "training/Adadelta/mul_43/x"
  input: "training/Adadelta/Square_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_28"
  op: "Add"
  input: "training/Adadelta/mul_42"
  input: "training/Adadelta/mul_43"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_21"
  op: "Assign"
  input: "training/Adadelta/Variable_7"
  input: "training/Adadelta/add_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/add_29/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_29"
  op: "Add"
  input: "training/Adadelta/Variable_15/read"
  input: "training/Adadelta/add_29/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_28"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_29"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_14/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_29"
  input: "training/Adadelta/Const_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_14"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_14/Minimum"
  input: "training/Adadelta/Const_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_14"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_44"
  op: "Mul"
  input: "training/Adadelta/gradients/dense_2/BiasAdd_grad/BiasAddGrad"
  input: "training/Adadelta/Sqrt_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_30/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "training/Adadelta/add_30"
  op: "Add"
  input: "training/Adadelta/add_28"
  input: "training/Adadelta/add_30/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Const_30"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/Adadelta/Const_31"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: inf
      }
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_15/Minimum"
  op: "Minimum"
  input: "training/Adadelta/add_30"
  input: "training/Adadelta/Const_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/clip_by_value_15"
  op: "Maximum"
  input: "training/Adadelta/clip_by_value_15/Minimum"
  input: "training/Adadelta/Const_30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Sqrt_15"
  op: "Sqrt"
  input: "training/Adadelta/clip_by_value_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/truediv_7"
  op: "RealDiv"
  input: "training/Adadelta/mul_44"
  input: "training/Adadelta/Sqrt_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_45"
  op: "Mul"
  input: "Adadelta/lr/read"
  input: "training/Adadelta/truediv_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/sub_7"
  op: "Sub"
  input: "dense_2/bias/read"
  input: "training/Adadelta/mul_45"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_22"
  op: "Assign"
  input: "dense_2/bias"
  input: "training/Adadelta/sub_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/Adadelta/mul_46/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.949999988079071
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_46"
  op: "Mul"
  input: "training/Adadelta/mul_46/x"
  input: "training/Adadelta/Variable_15/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Square_15"
  op: "Square"
  input: "training/Adadelta/truediv_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/mul_47/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05000000074505806
      }
    }
  }
}
node {
  name: "training/Adadelta/mul_47"
  op: "Mul"
  input: "training/Adadelta/mul_47/x"
  input: "training/Adadelta/Square_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/add_31"
  op: "Add"
  input: "training/Adadelta/mul_46"
  input: "training/Adadelta/mul_47"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/Adadelta/Assign_23"
  op: "Assign"
  input: "training/Adadelta/Variable_15"
  input: "training/Adadelta/add_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/group_deps"
  op: "NoOp"
  input: "^loss/mul"
  input: "^metrics/acc/Mean"
  input: "^training/Adadelta/AssignAdd"
  input: "^training/Adadelta/Assign"
  input: "^training/Adadelta/Assign_1"
  input: "^training/Adadelta/Assign_2"
  input: "^training/Adadelta/Assign_3"
  input: "^training/Adadelta/Assign_4"
  input: "^training/Adadelta/Assign_5"
  input: "^training/Adadelta/Assign_6"
  input: "^training/Adadelta/Assign_7"
  input: "^training/Adadelta/Assign_8"
  input: "^training/Adadelta/Assign_9"
  input: "^training/Adadelta/Assign_10"
  input: "^training/Adadelta/Assign_11"
  input: "^training/Adadelta/Assign_12"
  input: "^training/Adadelta/Assign_13"
  input: "^training/Adadelta/Assign_14"
  input: "^training/Adadelta/Assign_15"
  input: "^training/Adadelta/Assign_16"
  input: "^training/Adadelta/Assign_17"
  input: "^training/Adadelta/Assign_18"
  input: "^training/Adadelta/Assign_19"
  input: "^training/Adadelta/Assign_20"
  input: "^training/Adadelta/Assign_21"
  input: "^training/Adadelta/Assign_22"
  input: "^training/Adadelta/Assign_23"
}
node {
  name: "group_deps"
  op: "NoOp"
  input: "^loss/mul"
  input: "^metrics/acc/Mean"
}
node {
  name: "IsVariableInitialized"
  op: "IsVariableInitialized"
  input: "conv2d_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_1"
  op: "IsVariableInitialized"
  input: "conv2d_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_2"
  op: "IsVariableInitialized"
  input: "conv2d_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_3"
  op: "IsVariableInitialized"
  input: "conv2d_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_4"
  op: "IsVariableInitialized"
  input: "dense_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_5"
  op: "IsVariableInitialized"
  input: "dense_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_6"
  op: "IsVariableInitialized"
  input: "dense_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_7"
  op: "IsVariableInitialized"
  input: "dense_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_8"
  op: "IsVariableInitialized"
  input: "Adadelta/lr"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/lr"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_9"
  op: "IsVariableInitialized"
  input: "Adadelta/decay"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/decay"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_10"
  op: "IsVariableInitialized"
  input: "Adadelta/iterations"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/iterations"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "IsVariableInitialized_11"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_12"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_13"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_2"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_14"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_3"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_15"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_4"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_4"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_16"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_5"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_5"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_17"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_6"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_6"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_18"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_7"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_7"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_19"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_8"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_8"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_20"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_9"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_9"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_21"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_10"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_10"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_22"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_11"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_11"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_23"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_12"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_12"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_24"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_13"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_13"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_25"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_14"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_14"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_26"
  op: "IsVariableInitialized"
  input: "training/Adadelta/Variable_15"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_15"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^conv2d_1/kernel/Assign"
  input: "^conv2d_1/bias/Assign"
  input: "^conv2d_2/kernel/Assign"
  input: "^conv2d_2/bias/Assign"
  input: "^dense_1/kernel/Assign"
  input: "^dense_1/bias/Assign"
  input: "^dense_2/kernel/Assign"
  input: "^dense_2/bias/Assign"
  input: "^Adadelta/lr/Assign"
  input: "^Adadelta/decay/Assign"
  input: "^Adadelta/iterations/Assign"
  input: "^training/Adadelta/Variable/Assign"
  input: "^training/Adadelta/Variable_1/Assign"
  input: "^training/Adadelta/Variable_2/Assign"
  input: "^training/Adadelta/Variable_3/Assign"
  input: "^training/Adadelta/Variable_4/Assign"
  input: "^training/Adadelta/Variable_5/Assign"
  input: "^training/Adadelta/Variable_6/Assign"
  input: "^training/Adadelta/Variable_7/Assign"
  input: "^training/Adadelta/Variable_8/Assign"
  input: "^training/Adadelta/Variable_9/Assign"
  input: "^training/Adadelta/Variable_10/Assign"
  input: "^training/Adadelta/Variable_11/Assign"
  input: "^training/Adadelta/Variable_12/Assign"
  input: "^training/Adadelta/Variable_13/Assign"
  input: "^training/Adadelta/Variable_14/Assign"
  input: "^training/Adadelta/Variable_15/Assign"
}
node {
  name: "save/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 27
          }
        }
        string_val: "Adadelta/decay"
        string_val: "Adadelta/iterations"
        string_val: "Adadelta/lr"
        string_val: "conv2d_1/bias"
        string_val: "conv2d_1/kernel"
        string_val: "conv2d_2/bias"
        string_val: "conv2d_2/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "training/Adadelta/Variable"
        string_val: "training/Adadelta/Variable_1"
        string_val: "training/Adadelta/Variable_10"
        string_val: "training/Adadelta/Variable_11"
        string_val: "training/Adadelta/Variable_12"
        string_val: "training/Adadelta/Variable_13"
        string_val: "training/Adadelta/Variable_14"
        string_val: "training/Adadelta/Variable_15"
        string_val: "training/Adadelta/Variable_2"
        string_val: "training/Adadelta/Variable_3"
        string_val: "training/Adadelta/Variable_4"
        string_val: "training/Adadelta/Variable_5"
        string_val: "training/Adadelta/Variable_6"
        string_val: "training/Adadelta/Variable_7"
        string_val: "training/Adadelta/Variable_8"
        string_val: "training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 27
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "Adadelta/decay"
  input: "Adadelta/iterations"
  input: "Adadelta/lr"
  input: "conv2d_1/bias"
  input: "conv2d_1/kernel"
  input: "conv2d_2/bias"
  input: "conv2d_2/kernel"
  input: "dense_1/bias"
  input: "dense_1/kernel"
  input: "dense_2/bias"
  input: "dense_2/kernel"
  input: "training/Adadelta/Variable"
  input: "training/Adadelta/Variable_1"
  input: "training/Adadelta/Variable_10"
  input: "training/Adadelta/Variable_11"
  input: "training/Adadelta/Variable_12"
  input: "training/Adadelta/Variable_13"
  input: "training/Adadelta/Variable_14"
  input: "training/Adadelta/Variable_15"
  input: "training/Adadelta/Variable_2"
  input: "training/Adadelta/Variable_3"
  input: "training/Adadelta/Variable_4"
  input: "training/Adadelta/Variable_5"
  input: "training/Adadelta/Variable_6"
  input: "training/Adadelta/Variable_7"
  input: "training/Adadelta/Variable_8"
  input: "training/Adadelta/Variable_9"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_INT64
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 27
          }
        }
        string_val: "Adadelta/decay"
        string_val: "Adadelta/iterations"
        string_val: "Adadelta/lr"
        string_val: "conv2d_1/bias"
        string_val: "conv2d_1/kernel"
        string_val: "conv2d_2/bias"
        string_val: "conv2d_2/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "training/Adadelta/Variable"
        string_val: "training/Adadelta/Variable_1"
        string_val: "training/Adadelta/Variable_10"
        string_val: "training/Adadelta/Variable_11"
        string_val: "training/Adadelta/Variable_12"
        string_val: "training/Adadelta/Variable_13"
        string_val: "training/Adadelta/Variable_14"
        string_val: "training/Adadelta/Variable_15"
        string_val: "training/Adadelta/Variable_2"
        string_val: "training/Adadelta/Variable_3"
        string_val: "training/Adadelta/Variable_4"
        string_val: "training/Adadelta/Variable_5"
        string_val: "training/Adadelta/Variable_6"
        string_val: "training/Adadelta/Variable_7"
        string_val: "training/Adadelta/Variable_8"
        string_val: "training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 27
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_INT64
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "Adadelta/decay"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/decay"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_1"
  op: "Assign"
  input: "Adadelta/iterations"
  input: "save/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_2"
  op: "Assign"
  input: "Adadelta/lr"
  input: "save/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/lr"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_3"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "save/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_4"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "save/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_5"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "save/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_6"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "save/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_7"
  op: "Assign"
  input: "dense_1/bias"
  input: "save/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_8"
  op: "Assign"
  input: "dense_1/kernel"
  input: "save/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_9"
  op: "Assign"
  input: "dense_2/bias"
  input: "save/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_10"
  op: "Assign"
  input: "dense_2/kernel"
  input: "save/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_11"
  op: "Assign"
  input: "training/Adadelta/Variable"
  input: "save/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_12"
  op: "Assign"
  input: "training/Adadelta/Variable_1"
  input: "save/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_13"
  op: "Assign"
  input: "training/Adadelta/Variable_10"
  input: "save/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_14"
  op: "Assign"
  input: "training/Adadelta/Variable_11"
  input: "save/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_15"
  op: "Assign"
  input: "training/Adadelta/Variable_12"
  input: "save/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_16"
  op: "Assign"
  input: "training/Adadelta/Variable_13"
  input: "save/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_17"
  op: "Assign"
  input: "training/Adadelta/Variable_14"
  input: "save/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_18"
  op: "Assign"
  input: "training/Adadelta/Variable_15"
  input: "save/RestoreV2:18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_19"
  op: "Assign"
  input: "training/Adadelta/Variable_2"
  input: "save/RestoreV2:19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_20"
  op: "Assign"
  input: "training/Adadelta/Variable_3"
  input: "save/RestoreV2:20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_21"
  op: "Assign"
  input: "training/Adadelta/Variable_4"
  input: "save/RestoreV2:21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_22"
  op: "Assign"
  input: "training/Adadelta/Variable_5"
  input: "save/RestoreV2:22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_23"
  op: "Assign"
  input: "training/Adadelta/Variable_6"
  input: "save/RestoreV2:23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_24"
  op: "Assign"
  input: "training/Adadelta/Variable_7"
  input: "save/RestoreV2:24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_25"
  op: "Assign"
  input: "training/Adadelta/Variable_8"
  input: "save/RestoreV2:25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/Assign_26"
  op: "Assign"
  input: "training/Adadelta/Variable_9"
  input: "save/RestoreV2:26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
  input: "^save/Assign_1"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_18"
  input: "^save/Assign_19"
  input: "^save/Assign_20"
  input: "^save/Assign_21"
  input: "^save/Assign_22"
  input: "^save/Assign_23"
  input: "^save/Assign_24"
  input: "^save/Assign_25"
  input: "^save/Assign_26"
}
node {
  name: "conv2d_1_input_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv2d_1_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_1_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 7548358
    }
  }
}
node {
  name: "conv2d_1_1/random_uniform/sub"
  op: "Sub"
  input: "conv2d_1_1/random_uniform/max"
  input: "conv2d_1_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_1/random_uniform/mul"
  op: "Mul"
  input: "conv2d_1_1/random_uniform/RandomUniform"
  input: "conv2d_1_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_1/random_uniform"
  op: "Add"
  input: "conv2d_1_1/random_uniform/mul"
  input: "conv2d_1_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_1/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1_1/kernel/Assign"
  op: "Assign"
  input: "conv2d_1_1/kernel"
  input: "conv2d_1_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_1/kernel/read"
  op: "Identity"
  input: "conv2d_1_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/kernel"
      }
    }
  }
}
node {
  name: "conv2d_1_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_1_1/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1_1/bias/Assign"
  op: "Assign"
  input: "conv2d_1_1/bias"
  input: "conv2d_1_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_1/bias/read"
  op: "Identity"
  input: "conv2d_1_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/bias"
      }
    }
  }
}
node {
  name: "conv2d_1_1/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1_1/convolution"
  op: "Conv2D"
  input: "conv2d_1_input_1"
  input: "conv2d_1_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_1/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_1_1/convolution"
  input: "conv2d_1_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_1_1/Relu"
  op: "Relu"
  input: "conv2d_1_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_2_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 2203045
    }
  }
}
node {
  name: "conv2d_2_1/random_uniform/sub"
  op: "Sub"
  input: "conv2d_2_1/random_uniform/max"
  input: "conv2d_2_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_1/random_uniform/mul"
  op: "Mul"
  input: "conv2d_2_1/random_uniform/RandomUniform"
  input: "conv2d_2_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_1/random_uniform"
  op: "Add"
  input: "conv2d_2_1/random_uniform/mul"
  input: "conv2d_2_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_1/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2_1/kernel/Assign"
  op: "Assign"
  input: "conv2d_2_1/kernel"
  input: "conv2d_2_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_1/kernel/read"
  op: "Identity"
  input: "conv2d_2_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/kernel"
      }
    }
  }
}
node {
  name: "conv2d_2_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_2_1/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2_1/bias/Assign"
  op: "Assign"
  input: "conv2d_2_1/bias"
  input: "conv2d_2_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_1/bias/read"
  op: "Identity"
  input: "conv2d_2_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/bias"
      }
    }
  }
}
node {
  name: "conv2d_2_1/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2_1/convolution"
  op: "Conv2D"
  input: "conv2d_1_1/Relu"
  input: "conv2d_2_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_1/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_2_1/convolution"
  input: "conv2d_2_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_2_1/Relu"
  op: "Relu"
  input: "conv2d_2_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d_1_1/MaxPool"
  op: "MaxPool"
  input: "conv2d_2_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "dropout_1_1/Identity"
  op: "Identity"
  input: "max_pooling2d_1_1/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "flatten_1_1/Shape"
  op: "Shape"
  input: "dropout_1_1/Identity"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "flatten_1_1/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1_1/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1_1/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1_1/strided_slice"
  op: "StridedSlice"
  input: "flatten_1_1/Shape"
  input: "flatten_1_1/strided_slice/stack"
  input: "flatten_1_1/strided_slice/stack_1"
  input: "flatten_1_1/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1_1/Prod"
  op: "Prod"
  input: "flatten_1_1/strided_slice"
  input: "flatten_1_1/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "flatten_1_1/stack/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "flatten_1_1/stack"
  op: "Pack"
  input: "flatten_1_1/stack/0"
  input: "flatten_1_1/Prod"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1_1/Reshape"
  op: "Reshape"
  input: "dropout_1_1/Identity"
  input: "flatten_1_1/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dense_1_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\020\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "dense_1_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_1_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 4151550
    }
  }
}
node {
  name: "dense_1_1/random_uniform/sub"
  op: "Sub"
  input: "dense_1_1/random_uniform/max"
  input: "dense_1_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_1/random_uniform/mul"
  op: "Mul"
  input: "dense_1_1/random_uniform/RandomUniform"
  input: "dense_1_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_1/random_uniform"
  op: "Add"
  input: "dense_1_1/random_uniform/mul"
  input: "dense_1_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_1/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1_1/kernel/Assign"
  op: "Assign"
  input: "dense_1_1/kernel"
  input: "dense_1_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1_1/kernel/read"
  op: "Identity"
  input: "dense_1_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/kernel"
      }
    }
  }
}
node {
  name: "dense_1_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_1_1/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1_1/bias/Assign"
  op: "Assign"
  input: "dense_1_1/bias"
  input: "dense_1_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1_1/bias/read"
  op: "Identity"
  input: "dense_1_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/bias"
      }
    }
  }
}
node {
  name: "dense_1_1/MatMul"
  op: "MatMul"
  input: "flatten_1_1/Reshape"
  input: "dense_1_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_1_1/BiasAdd"
  op: "BiasAdd"
  input: "dense_1_1/MatMul"
  input: "dense_1_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_1_1/Relu"
  op: "Relu"
  input: "dense_1_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2_1/Identity"
  op: "Identity"
  input: "dense_1_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000$\000\000\000"
      }
    }
  }
}
node {
  name: "dense_2_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_2_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 8455366
    }
  }
}
node {
  name: "dense_2_1/random_uniform/sub"
  op: "Sub"
  input: "dense_2_1/random_uniform/max"
  input: "dense_2_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_1/random_uniform/mul"
  op: "Mul"
  input: "dense_2_1/random_uniform/RandomUniform"
  input: "dense_2_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_1/random_uniform"
  op: "Add"
  input: "dense_2_1/random_uniform/mul"
  input: "dense_2_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_1/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2_1/kernel/Assign"
  op: "Assign"
  input: "dense_2_1/kernel"
  input: "dense_2_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2_1/kernel/read"
  op: "Identity"
  input: "dense_2_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/kernel"
      }
    }
  }
}
node {
  name: "dense_2_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 36
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_2_1/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2_1/bias/Assign"
  op: "Assign"
  input: "dense_2_1/bias"
  input: "dense_2_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2_1/bias/read"
  op: "Identity"
  input: "dense_2_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/bias"
      }
    }
  }
}
node {
  name: "dense_2_1/MatMul"
  op: "MatMul"
  input: "dropout_2_1/Identity"
  input: "dense_2_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_2_1/BiasAdd"
  op: "BiasAdd"
  input: "dense_2_1/MatMul"
  input: "dense_2_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_2_1/Softmax"
  op: "Softmax"
  input: "dense_2_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign"
  op: "Assign"
  input: "conv2d_1_1/kernel"
  input: "Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_1"
  op: "Assign"
  input: "conv2d_1_1/bias"
  input: "Placeholder_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_2"
  op: "Assign"
  input: "conv2d_2_1/kernel"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_3"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_3"
  op: "Assign"
  input: "conv2d_2_1/bias"
  input: "Placeholder_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_4"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_4"
  op: "Assign"
  input: "dense_1_1/kernel"
  input: "Placeholder_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_5"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_5"
  op: "Assign"
  input: "dense_1_1/bias"
  input: "Placeholder_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_6"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_6"
  op: "Assign"
  input: "dense_2_1/kernel"
  input: "Placeholder_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_7"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_7"
  op: "Assign"
  input: "dense_2_1/bias"
  input: "Placeholder_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "IsVariableInitialized_27"
  op: "IsVariableInitialized"
  input: "conv2d_1_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_28"
  op: "IsVariableInitialized"
  input: "conv2d_1_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_29"
  op: "IsVariableInitialized"
  input: "conv2d_2_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_30"
  op: "IsVariableInitialized"
  input: "conv2d_2_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_31"
  op: "IsVariableInitialized"
  input: "dense_1_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_32"
  op: "IsVariableInitialized"
  input: "dense_1_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_33"
  op: "IsVariableInitialized"
  input: "dense_2_1/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_34"
  op: "IsVariableInitialized"
  input: "dense_2_1/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "init_1"
  op: "NoOp"
  input: "^conv2d_1_1/kernel/Assign"
  input: "^conv2d_1_1/bias/Assign"
  input: "^conv2d_2_1/kernel/Assign"
  input: "^conv2d_2_1/bias/Assign"
  input: "^dense_1_1/kernel/Assign"
  input: "^dense_1_1/bias/Assign"
  input: "^dense_2_1/kernel/Assign"
  input: "^dense_2_1/bias/Assign"
}
node {
  name: "save_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save_1/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 35
          }
        }
        string_val: "Adadelta/decay"
        string_val: "Adadelta/iterations"
        string_val: "Adadelta/lr"
        string_val: "conv2d_1/bias"
        string_val: "conv2d_1/kernel"
        string_val: "conv2d_1_1/bias"
        string_val: "conv2d_1_1/kernel"
        string_val: "conv2d_2/bias"
        string_val: "conv2d_2/kernel"
        string_val: "conv2d_2_1/bias"
        string_val: "conv2d_2_1/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_1_1/bias"
        string_val: "dense_1_1/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "dense_2_1/bias"
        string_val: "dense_2_1/kernel"
        string_val: "training/Adadelta/Variable"
        string_val: "training/Adadelta/Variable_1"
        string_val: "training/Adadelta/Variable_10"
        string_val: "training/Adadelta/Variable_11"
        string_val: "training/Adadelta/Variable_12"
        string_val: "training/Adadelta/Variable_13"
        string_val: "training/Adadelta/Variable_14"
        string_val: "training/Adadelta/Variable_15"
        string_val: "training/Adadelta/Variable_2"
        string_val: "training/Adadelta/Variable_3"
        string_val: "training/Adadelta/Variable_4"
        string_val: "training/Adadelta/Variable_5"
        string_val: "training/Adadelta/Variable_6"
        string_val: "training/Adadelta/Variable_7"
        string_val: "training/Adadelta/Variable_8"
        string_val: "training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "save_1/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 35
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_1/SaveV2"
  op: "SaveV2"
  input: "save_1/Const"
  input: "save_1/SaveV2/tensor_names"
  input: "save_1/SaveV2/shape_and_slices"
  input: "Adadelta/decay"
  input: "Adadelta/iterations"
  input: "Adadelta/lr"
  input: "conv2d_1/bias"
  input: "conv2d_1/kernel"
  input: "conv2d_1_1/bias"
  input: "conv2d_1_1/kernel"
  input: "conv2d_2/bias"
  input: "conv2d_2/kernel"
  input: "conv2d_2_1/bias"
  input: "conv2d_2_1/kernel"
  input: "dense_1/bias"
  input: "dense_1/kernel"
  input: "dense_1_1/bias"
  input: "dense_1_1/kernel"
  input: "dense_2/bias"
  input: "dense_2/kernel"
  input: "dense_2_1/bias"
  input: "dense_2_1/kernel"
  input: "training/Adadelta/Variable"
  input: "training/Adadelta/Variable_1"
  input: "training/Adadelta/Variable_10"
  input: "training/Adadelta/Variable_11"
  input: "training/Adadelta/Variable_12"
  input: "training/Adadelta/Variable_13"
  input: "training/Adadelta/Variable_14"
  input: "training/Adadelta/Variable_15"
  input: "training/Adadelta/Variable_2"
  input: "training/Adadelta/Variable_3"
  input: "training/Adadelta/Variable_4"
  input: "training/Adadelta/Variable_5"
  input: "training/Adadelta/Variable_6"
  input: "training/Adadelta/Variable_7"
  input: "training/Adadelta/Variable_8"
  input: "training/Adadelta/Variable_9"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_INT64
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_1/control_dependency"
  op: "Identity"
  input: "save_1/Const"
  input: "^save_1/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save_1/Const"
      }
    }
  }
}
node {
  name: "save_1/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 35
          }
        }
        string_val: "Adadelta/decay"
        string_val: "Adadelta/iterations"
        string_val: "Adadelta/lr"
        string_val: "conv2d_1/bias"
        string_val: "conv2d_1/kernel"
        string_val: "conv2d_1_1/bias"
        string_val: "conv2d_1_1/kernel"
        string_val: "conv2d_2/bias"
        string_val: "conv2d_2/kernel"
        string_val: "conv2d_2_1/bias"
        string_val: "conv2d_2_1/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_1_1/bias"
        string_val: "dense_1_1/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "dense_2_1/bias"
        string_val: "dense_2_1/kernel"
        string_val: "training/Adadelta/Variable"
        string_val: "training/Adadelta/Variable_1"
        string_val: "training/Adadelta/Variable_10"
        string_val: "training/Adadelta/Variable_11"
        string_val: "training/Adadelta/Variable_12"
        string_val: "training/Adadelta/Variable_13"
        string_val: "training/Adadelta/Variable_14"
        string_val: "training/Adadelta/Variable_15"
        string_val: "training/Adadelta/Variable_2"
        string_val: "training/Adadelta/Variable_3"
        string_val: "training/Adadelta/Variable_4"
        string_val: "training/Adadelta/Variable_5"
        string_val: "training/Adadelta/Variable_6"
        string_val: "training/Adadelta/Variable_7"
        string_val: "training/Adadelta/Variable_8"
        string_val: "training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "save_1/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 35
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_1/RestoreV2"
  op: "RestoreV2"
  input: "save_1/Const"
  input: "save_1/RestoreV2/tensor_names"
  input: "save_1/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_INT64
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_1/Assign"
  op: "Assign"
  input: "Adadelta/decay"
  input: "save_1/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/decay"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_1"
  op: "Assign"
  input: "Adadelta/iterations"
  input: "save_1/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_2"
  op: "Assign"
  input: "Adadelta/lr"
  input: "save_1/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/lr"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_3"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "save_1/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_4"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "save_1/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_5"
  op: "Assign"
  input: "conv2d_1_1/bias"
  input: "save_1/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_6"
  op: "Assign"
  input: "conv2d_1_1/kernel"
  input: "save_1/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_7"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "save_1/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_8"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "save_1/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_9"
  op: "Assign"
  input: "conv2d_2_1/bias"
  input: "save_1/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_10"
  op: "Assign"
  input: "conv2d_2_1/kernel"
  input: "save_1/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_11"
  op: "Assign"
  input: "dense_1/bias"
  input: "save_1/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_12"
  op: "Assign"
  input: "dense_1/kernel"
  input: "save_1/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_13"
  op: "Assign"
  input: "dense_1_1/bias"
  input: "save_1/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_14"
  op: "Assign"
  input: "dense_1_1/kernel"
  input: "save_1/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_15"
  op: "Assign"
  input: "dense_2/bias"
  input: "save_1/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_16"
  op: "Assign"
  input: "dense_2/kernel"
  input: "save_1/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_17"
  op: "Assign"
  input: "dense_2_1/bias"
  input: "save_1/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_18"
  op: "Assign"
  input: "dense_2_1/kernel"
  input: "save_1/RestoreV2:18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_19"
  op: "Assign"
  input: "training/Adadelta/Variable"
  input: "save_1/RestoreV2:19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_20"
  op: "Assign"
  input: "training/Adadelta/Variable_1"
  input: "save_1/RestoreV2:20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_21"
  op: "Assign"
  input: "training/Adadelta/Variable_10"
  input: "save_1/RestoreV2:21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_22"
  op: "Assign"
  input: "training/Adadelta/Variable_11"
  input: "save_1/RestoreV2:22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_23"
  op: "Assign"
  input: "training/Adadelta/Variable_12"
  input: "save_1/RestoreV2:23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_24"
  op: "Assign"
  input: "training/Adadelta/Variable_13"
  input: "save_1/RestoreV2:24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_25"
  op: "Assign"
  input: "training/Adadelta/Variable_14"
  input: "save_1/RestoreV2:25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_26"
  op: "Assign"
  input: "training/Adadelta/Variable_15"
  input: "save_1/RestoreV2:26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_27"
  op: "Assign"
  input: "training/Adadelta/Variable_2"
  input: "save_1/RestoreV2:27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_28"
  op: "Assign"
  input: "training/Adadelta/Variable_3"
  input: "save_1/RestoreV2:28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_29"
  op: "Assign"
  input: "training/Adadelta/Variable_4"
  input: "save_1/RestoreV2:29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_30"
  op: "Assign"
  input: "training/Adadelta/Variable_5"
  input: "save_1/RestoreV2:30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_31"
  op: "Assign"
  input: "training/Adadelta/Variable_6"
  input: "save_1/RestoreV2:31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_32"
  op: "Assign"
  input: "training/Adadelta/Variable_7"
  input: "save_1/RestoreV2:32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_33"
  op: "Assign"
  input: "training/Adadelta/Variable_8"
  input: "save_1/RestoreV2:33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/Assign_34"
  op: "Assign"
  input: "training/Adadelta/Variable_9"
  input: "save_1/RestoreV2:34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_1/restore_all"
  op: "NoOp"
  input: "^save_1/Assign"
  input: "^save_1/Assign_1"
  input: "^save_1/Assign_2"
  input: "^save_1/Assign_3"
  input: "^save_1/Assign_4"
  input: "^save_1/Assign_5"
  input: "^save_1/Assign_6"
  input: "^save_1/Assign_7"
  input: "^save_1/Assign_8"
  input: "^save_1/Assign_9"
  input: "^save_1/Assign_10"
  input: "^save_1/Assign_11"
  input: "^save_1/Assign_12"
  input: "^save_1/Assign_13"
  input: "^save_1/Assign_14"
  input: "^save_1/Assign_15"
  input: "^save_1/Assign_16"
  input: "^save_1/Assign_17"
  input: "^save_1/Assign_18"
  input: "^save_1/Assign_19"
  input: "^save_1/Assign_20"
  input: "^save_1/Assign_21"
  input: "^save_1/Assign_22"
  input: "^save_1/Assign_23"
  input: "^save_1/Assign_24"
  input: "^save_1/Assign_25"
  input: "^save_1/Assign_26"
  input: "^save_1/Assign_27"
  input: "^save_1/Assign_28"
  input: "^save_1/Assign_29"
  input: "^save_1/Assign_30"
  input: "^save_1/Assign_31"
  input: "^save_1/Assign_32"
  input: "^save_1/Assign_33"
  input: "^save_1/Assign_34"
}
node {
  name: "Placeholder_8"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_8"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "Placeholder_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_9"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_9"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "Placeholder_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_10"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_10"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "Placeholder_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_11"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_11"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "Placeholder_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_12"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_12"
  op: "Assign"
  input: "dense_1/kernel"
  input: "Placeholder_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_13"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_13"
  op: "Assign"
  input: "dense_1/bias"
  input: "Placeholder_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_14"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_14"
  op: "Assign"
  input: "dense_2/kernel"
  input: "Placeholder_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_15"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_15"
  op: "Assign"
  input: "dense_2/bias"
  input: "Placeholder_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "init_2"
  op: "NoOp"
  input: "^conv2d_1/kernel/Assign"
  input: "^conv2d_1/bias/Assign"
  input: "^conv2d_2/kernel/Assign"
  input: "^conv2d_2/bias/Assign"
  input: "^dense_1/kernel/Assign"
  input: "^dense_1/bias/Assign"
  input: "^dense_2/kernel/Assign"
  input: "^dense_2/bias/Assign"
  input: "^Adadelta/lr/Assign"
  input: "^Adadelta/decay/Assign"
  input: "^Adadelta/iterations/Assign"
  input: "^training/Adadelta/Variable/Assign"
  input: "^training/Adadelta/Variable_1/Assign"
  input: "^training/Adadelta/Variable_2/Assign"
  input: "^training/Adadelta/Variable_3/Assign"
  input: "^training/Adadelta/Variable_4/Assign"
  input: "^training/Adadelta/Variable_5/Assign"
  input: "^training/Adadelta/Variable_6/Assign"
  input: "^training/Adadelta/Variable_7/Assign"
  input: "^training/Adadelta/Variable_8/Assign"
  input: "^training/Adadelta/Variable_9/Assign"
  input: "^training/Adadelta/Variable_10/Assign"
  input: "^training/Adadelta/Variable_11/Assign"
  input: "^training/Adadelta/Variable_12/Assign"
  input: "^training/Adadelta/Variable_13/Assign"
  input: "^training/Adadelta/Variable_14/Assign"
  input: "^training/Adadelta/Variable_15/Assign"
  input: "^conv2d_1_1/kernel/Assign"
  input: "^conv2d_1_1/bias/Assign"
  input: "^conv2d_2_1/kernel/Assign"
  input: "^conv2d_2_1/bias/Assign"
  input: "^dense_1_1/kernel/Assign"
  input: "^dense_1_1/bias/Assign"
  input: "^dense_2_1/kernel/Assign"
  input: "^dense_2_1/bias/Assign"
}
node {
  name: "save_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save_2/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 35
          }
        }
        string_val: "Adadelta/decay"
        string_val: "Adadelta/iterations"
        string_val: "Adadelta/lr"
        string_val: "conv2d_1/bias"
        string_val: "conv2d_1/kernel"
        string_val: "conv2d_1_1/bias"
        string_val: "conv2d_1_1/kernel"
        string_val: "conv2d_2/bias"
        string_val: "conv2d_2/kernel"
        string_val: "conv2d_2_1/bias"
        string_val: "conv2d_2_1/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_1_1/bias"
        string_val: "dense_1_1/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "dense_2_1/bias"
        string_val: "dense_2_1/kernel"
        string_val: "training/Adadelta/Variable"
        string_val: "training/Adadelta/Variable_1"
        string_val: "training/Adadelta/Variable_10"
        string_val: "training/Adadelta/Variable_11"
        string_val: "training/Adadelta/Variable_12"
        string_val: "training/Adadelta/Variable_13"
        string_val: "training/Adadelta/Variable_14"
        string_val: "training/Adadelta/Variable_15"
        string_val: "training/Adadelta/Variable_2"
        string_val: "training/Adadelta/Variable_3"
        string_val: "training/Adadelta/Variable_4"
        string_val: "training/Adadelta/Variable_5"
        string_val: "training/Adadelta/Variable_6"
        string_val: "training/Adadelta/Variable_7"
        string_val: "training/Adadelta/Variable_8"
        string_val: "training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "save_2/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 35
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_2/SaveV2"
  op: "SaveV2"
  input: "save_2/Const"
  input: "save_2/SaveV2/tensor_names"
  input: "save_2/SaveV2/shape_and_slices"
  input: "Adadelta/decay"
  input: "Adadelta/iterations"
  input: "Adadelta/lr"
  input: "conv2d_1/bias"
  input: "conv2d_1/kernel"
  input: "conv2d_1_1/bias"
  input: "conv2d_1_1/kernel"
  input: "conv2d_2/bias"
  input: "conv2d_2/kernel"
  input: "conv2d_2_1/bias"
  input: "conv2d_2_1/kernel"
  input: "dense_1/bias"
  input: "dense_1/kernel"
  input: "dense_1_1/bias"
  input: "dense_1_1/kernel"
  input: "dense_2/bias"
  input: "dense_2/kernel"
  input: "dense_2_1/bias"
  input: "dense_2_1/kernel"
  input: "training/Adadelta/Variable"
  input: "training/Adadelta/Variable_1"
  input: "training/Adadelta/Variable_10"
  input: "training/Adadelta/Variable_11"
  input: "training/Adadelta/Variable_12"
  input: "training/Adadelta/Variable_13"
  input: "training/Adadelta/Variable_14"
  input: "training/Adadelta/Variable_15"
  input: "training/Adadelta/Variable_2"
  input: "training/Adadelta/Variable_3"
  input: "training/Adadelta/Variable_4"
  input: "training/Adadelta/Variable_5"
  input: "training/Adadelta/Variable_6"
  input: "training/Adadelta/Variable_7"
  input: "training/Adadelta/Variable_8"
  input: "training/Adadelta/Variable_9"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_INT64
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_2/control_dependency"
  op: "Identity"
  input: "save_2/Const"
  input: "^save_2/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save_2/Const"
      }
    }
  }
}
node {
  name: "save_2/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 35
          }
        }
        string_val: "Adadelta/decay"
        string_val: "Adadelta/iterations"
        string_val: "Adadelta/lr"
        string_val: "conv2d_1/bias"
        string_val: "conv2d_1/kernel"
        string_val: "conv2d_1_1/bias"
        string_val: "conv2d_1_1/kernel"
        string_val: "conv2d_2/bias"
        string_val: "conv2d_2/kernel"
        string_val: "conv2d_2_1/bias"
        string_val: "conv2d_2_1/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_1_1/bias"
        string_val: "dense_1_1/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "dense_2_1/bias"
        string_val: "dense_2_1/kernel"
        string_val: "training/Adadelta/Variable"
        string_val: "training/Adadelta/Variable_1"
        string_val: "training/Adadelta/Variable_10"
        string_val: "training/Adadelta/Variable_11"
        string_val: "training/Adadelta/Variable_12"
        string_val: "training/Adadelta/Variable_13"
        string_val: "training/Adadelta/Variable_14"
        string_val: "training/Adadelta/Variable_15"
        string_val: "training/Adadelta/Variable_2"
        string_val: "training/Adadelta/Variable_3"
        string_val: "training/Adadelta/Variable_4"
        string_val: "training/Adadelta/Variable_5"
        string_val: "training/Adadelta/Variable_6"
        string_val: "training/Adadelta/Variable_7"
        string_val: "training/Adadelta/Variable_8"
        string_val: "training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "save_2/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 35
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_2/RestoreV2"
  op: "RestoreV2"
  input: "save_2/Const"
  input: "save_2/RestoreV2/tensor_names"
  input: "save_2/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_INT64
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_2/Assign"
  op: "Assign"
  input: "Adadelta/decay"
  input: "save_2/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/decay"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_1"
  op: "Assign"
  input: "Adadelta/iterations"
  input: "save_2/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_2"
  op: "Assign"
  input: "Adadelta/lr"
  input: "save_2/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/lr"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_3"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "save_2/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_4"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "save_2/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_5"
  op: "Assign"
  input: "conv2d_1_1/bias"
  input: "save_2/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_6"
  op: "Assign"
  input: "conv2d_1_1/kernel"
  input: "save_2/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_7"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "save_2/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_8"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "save_2/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_9"
  op: "Assign"
  input: "conv2d_2_1/bias"
  input: "save_2/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_10"
  op: "Assign"
  input: "conv2d_2_1/kernel"
  input: "save_2/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_11"
  op: "Assign"
  input: "dense_1/bias"
  input: "save_2/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_12"
  op: "Assign"
  input: "dense_1/kernel"
  input: "save_2/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_13"
  op: "Assign"
  input: "dense_1_1/bias"
  input: "save_2/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_14"
  op: "Assign"
  input: "dense_1_1/kernel"
  input: "save_2/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_15"
  op: "Assign"
  input: "dense_2/bias"
  input: "save_2/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_16"
  op: "Assign"
  input: "dense_2/kernel"
  input: "save_2/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_17"
  op: "Assign"
  input: "dense_2_1/bias"
  input: "save_2/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_18"
  op: "Assign"
  input: "dense_2_1/kernel"
  input: "save_2/RestoreV2:18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_19"
  op: "Assign"
  input: "training/Adadelta/Variable"
  input: "save_2/RestoreV2:19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_20"
  op: "Assign"
  input: "training/Adadelta/Variable_1"
  input: "save_2/RestoreV2:20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_21"
  op: "Assign"
  input: "training/Adadelta/Variable_10"
  input: "save_2/RestoreV2:21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_22"
  op: "Assign"
  input: "training/Adadelta/Variable_11"
  input: "save_2/RestoreV2:22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_23"
  op: "Assign"
  input: "training/Adadelta/Variable_12"
  input: "save_2/RestoreV2:23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_24"
  op: "Assign"
  input: "training/Adadelta/Variable_13"
  input: "save_2/RestoreV2:24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_25"
  op: "Assign"
  input: "training/Adadelta/Variable_14"
  input: "save_2/RestoreV2:25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_26"
  op: "Assign"
  input: "training/Adadelta/Variable_15"
  input: "save_2/RestoreV2:26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_27"
  op: "Assign"
  input: "training/Adadelta/Variable_2"
  input: "save_2/RestoreV2:27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_28"
  op: "Assign"
  input: "training/Adadelta/Variable_3"
  input: "save_2/RestoreV2:28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_29"
  op: "Assign"
  input: "training/Adadelta/Variable_4"
  input: "save_2/RestoreV2:29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_30"
  op: "Assign"
  input: "training/Adadelta/Variable_5"
  input: "save_2/RestoreV2:30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_31"
  op: "Assign"
  input: "training/Adadelta/Variable_6"
  input: "save_2/RestoreV2:31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_32"
  op: "Assign"
  input: "training/Adadelta/Variable_7"
  input: "save_2/RestoreV2:32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_33"
  op: "Assign"
  input: "training/Adadelta/Variable_8"
  input: "save_2/RestoreV2:33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/Assign_34"
  op: "Assign"
  input: "training/Adadelta/Variable_9"
  input: "save_2/RestoreV2:34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_2/restore_all"
  op: "NoOp"
  input: "^save_2/Assign"
  input: "^save_2/Assign_1"
  input: "^save_2/Assign_2"
  input: "^save_2/Assign_3"
  input: "^save_2/Assign_4"
  input: "^save_2/Assign_5"
  input: "^save_2/Assign_6"
  input: "^save_2/Assign_7"
  input: "^save_2/Assign_8"
  input: "^save_2/Assign_9"
  input: "^save_2/Assign_10"
  input: "^save_2/Assign_11"
  input: "^save_2/Assign_12"
  input: "^save_2/Assign_13"
  input: "^save_2/Assign_14"
  input: "^save_2/Assign_15"
  input: "^save_2/Assign_16"
  input: "^save_2/Assign_17"
  input: "^save_2/Assign_18"
  input: "^save_2/Assign_19"
  input: "^save_2/Assign_20"
  input: "^save_2/Assign_21"
  input: "^save_2/Assign_22"
  input: "^save_2/Assign_23"
  input: "^save_2/Assign_24"
  input: "^save_2/Assign_25"
  input: "^save_2/Assign_26"
  input: "^save_2/Assign_27"
  input: "^save_2/Assign_28"
  input: "^save_2/Assign_29"
  input: "^save_2/Assign_30"
  input: "^save_2/Assign_31"
  input: "^save_2/Assign_32"
  input: "^save_2/Assign_33"
  input: "^save_2/Assign_34"
}
node {
  name: "conv2d_1_input_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv2d_1_2/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_1_2/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 6385519
    }
  }
}
node {
  name: "conv2d_1_2/random_uniform/sub"
  op: "Sub"
  input: "conv2d_1_2/random_uniform/max"
  input: "conv2d_1_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_2/random_uniform/mul"
  op: "Mul"
  input: "conv2d_1_2/random_uniform/RandomUniform"
  input: "conv2d_1_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_2/random_uniform"
  op: "Add"
  input: "conv2d_1_2/random_uniform/mul"
  input: "conv2d_1_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_2/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1_2/kernel/Assign"
  op: "Assign"
  input: "conv2d_1_2/kernel"
  input: "conv2d_1_2/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_2/kernel/read"
  op: "Identity"
  input: "conv2d_1_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/kernel"
      }
    }
  }
}
node {
  name: "conv2d_1_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_1_2/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1_2/bias/Assign"
  op: "Assign"
  input: "conv2d_1_2/bias"
  input: "conv2d_1_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_2/bias/read"
  op: "Identity"
  input: "conv2d_1_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/bias"
      }
    }
  }
}
node {
  name: "conv2d_1_2/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1_2/convolution"
  op: "Conv2D"
  input: "conv2d_1_input_2"
  input: "conv2d_1_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_2/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_1_2/convolution"
  input: "conv2d_1_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_1_2/Relu"
  op: "Relu"
  input: "conv2d_1_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_2/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_2_2/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 3524643
    }
  }
}
node {
  name: "conv2d_2_2/random_uniform/sub"
  op: "Sub"
  input: "conv2d_2_2/random_uniform/max"
  input: "conv2d_2_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_2/random_uniform/mul"
  op: "Mul"
  input: "conv2d_2_2/random_uniform/RandomUniform"
  input: "conv2d_2_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_2/random_uniform"
  op: "Add"
  input: "conv2d_2_2/random_uniform/mul"
  input: "conv2d_2_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_2/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2_2/kernel/Assign"
  op: "Assign"
  input: "conv2d_2_2/kernel"
  input: "conv2d_2_2/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_2/kernel/read"
  op: "Identity"
  input: "conv2d_2_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/kernel"
      }
    }
  }
}
node {
  name: "conv2d_2_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_2_2/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2_2/bias/Assign"
  op: "Assign"
  input: "conv2d_2_2/bias"
  input: "conv2d_2_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_2/bias/read"
  op: "Identity"
  input: "conv2d_2_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/bias"
      }
    }
  }
}
node {
  name: "conv2d_2_2/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2_2/convolution"
  op: "Conv2D"
  input: "conv2d_1_2/Relu"
  input: "conv2d_2_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_2/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_2_2/convolution"
  input: "conv2d_2_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_2_2/Relu"
  op: "Relu"
  input: "conv2d_2_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d_1_2/MaxPool"
  op: "MaxPool"
  input: "conv2d_2_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "dropout_1_2/Identity"
  op: "Identity"
  input: "max_pooling2d_1_2/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "flatten_1_2/Shape"
  op: "Shape"
  input: "dropout_1_2/Identity"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "flatten_1_2/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1_2/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1_2/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1_2/strided_slice"
  op: "StridedSlice"
  input: "flatten_1_2/Shape"
  input: "flatten_1_2/strided_slice/stack"
  input: "flatten_1_2/strided_slice/stack_1"
  input: "flatten_1_2/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1_2/Prod"
  op: "Prod"
  input: "flatten_1_2/strided_slice"
  input: "flatten_1_2/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "flatten_1_2/stack/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "flatten_1_2/stack"
  op: "Pack"
  input: "flatten_1_2/stack/0"
  input: "flatten_1_2/Prod"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1_2/Reshape"
  op: "Reshape"
  input: "dropout_1_2/Identity"
  input: "flatten_1_2/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dense_1_2/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\020\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "dense_1_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_1_2/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 6879312
    }
  }
}
node {
  name: "dense_1_2/random_uniform/sub"
  op: "Sub"
  input: "dense_1_2/random_uniform/max"
  input: "dense_1_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_2/random_uniform/mul"
  op: "Mul"
  input: "dense_1_2/random_uniform/RandomUniform"
  input: "dense_1_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_2/random_uniform"
  op: "Add"
  input: "dense_1_2/random_uniform/mul"
  input: "dense_1_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_2/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1_2/kernel/Assign"
  op: "Assign"
  input: "dense_1_2/kernel"
  input: "dense_1_2/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1_2/kernel/read"
  op: "Identity"
  input: "dense_1_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/kernel"
      }
    }
  }
}
node {
  name: "dense_1_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_1_2/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1_2/bias/Assign"
  op: "Assign"
  input: "dense_1_2/bias"
  input: "dense_1_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1_2/bias/read"
  op: "Identity"
  input: "dense_1_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/bias"
      }
    }
  }
}
node {
  name: "dense_1_2/MatMul"
  op: "MatMul"
  input: "flatten_1_2/Reshape"
  input: "dense_1_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_1_2/BiasAdd"
  op: "BiasAdd"
  input: "dense_1_2/MatMul"
  input: "dense_1_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_1_2/Relu"
  op: "Relu"
  input: "dense_1_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2_2/Identity"
  op: "Identity"
  input: "dense_1_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_2/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000$\000\000\000"
      }
    }
  }
}
node {
  name: "dense_2_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_2_2/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 5672494
    }
  }
}
node {
  name: "dense_2_2/random_uniform/sub"
  op: "Sub"
  input: "dense_2_2/random_uniform/max"
  input: "dense_2_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_2/random_uniform/mul"
  op: "Mul"
  input: "dense_2_2/random_uniform/RandomUniform"
  input: "dense_2_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_2/random_uniform"
  op: "Add"
  input: "dense_2_2/random_uniform/mul"
  input: "dense_2_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_2/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2_2/kernel/Assign"
  op: "Assign"
  input: "dense_2_2/kernel"
  input: "dense_2_2/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2_2/kernel/read"
  op: "Identity"
  input: "dense_2_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/kernel"
      }
    }
  }
}
node {
  name: "dense_2_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 36
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_2_2/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2_2/bias/Assign"
  op: "Assign"
  input: "dense_2_2/bias"
  input: "dense_2_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2_2/bias/read"
  op: "Identity"
  input: "dense_2_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/bias"
      }
    }
  }
}
node {
  name: "dense_2_2/MatMul"
  op: "MatMul"
  input: "dropout_2_2/Identity"
  input: "dense_2_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_2_2/BiasAdd"
  op: "BiasAdd"
  input: "dense_2_2/MatMul"
  input: "dense_2_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_2_2/Softmax"
  op: "Softmax"
  input: "dense_2_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Placeholder_16"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_16"
  op: "Assign"
  input: "conv2d_1_2/kernel"
  input: "Placeholder_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_17"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_17"
  op: "Assign"
  input: "conv2d_1_2/bias"
  input: "Placeholder_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_18"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_18"
  op: "Assign"
  input: "conv2d_2_2/kernel"
  input: "Placeholder_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_19"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_19"
  op: "Assign"
  input: "conv2d_2_2/bias"
  input: "Placeholder_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_20"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_20"
  op: "Assign"
  input: "dense_1_2/kernel"
  input: "Placeholder_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_21"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_21"
  op: "Assign"
  input: "dense_1_2/bias"
  input: "Placeholder_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_22"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_22"
  op: "Assign"
  input: "dense_2_2/kernel"
  input: "Placeholder_22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_23"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_23"
  op: "Assign"
  input: "dense_2_2/bias"
  input: "Placeholder_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "IsVariableInitialized_35"
  op: "IsVariableInitialized"
  input: "conv2d_1_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_36"
  op: "IsVariableInitialized"
  input: "conv2d_1_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_37"
  op: "IsVariableInitialized"
  input: "conv2d_2_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_38"
  op: "IsVariableInitialized"
  input: "conv2d_2_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_39"
  op: "IsVariableInitialized"
  input: "dense_1_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_40"
  op: "IsVariableInitialized"
  input: "dense_1_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_41"
  op: "IsVariableInitialized"
  input: "dense_2_2/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_42"
  op: "IsVariableInitialized"
  input: "dense_2_2/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "init_3"
  op: "NoOp"
  input: "^conv2d_1_2/kernel/Assign"
  input: "^conv2d_1_2/bias/Assign"
  input: "^conv2d_2_2/kernel/Assign"
  input: "^conv2d_2_2/bias/Assign"
  input: "^dense_1_2/kernel/Assign"
  input: "^dense_1_2/bias/Assign"
  input: "^dense_2_2/kernel/Assign"
  input: "^dense_2_2/bias/Assign"
}
node {
  name: "init_4"
  op: "NoOp"
  input: "^conv2d_1/kernel/Assign"
  input: "^conv2d_1/bias/Assign"
  input: "^conv2d_2/kernel/Assign"
  input: "^conv2d_2/bias/Assign"
  input: "^dense_1/kernel/Assign"
  input: "^dense_1/bias/Assign"
  input: "^dense_2/kernel/Assign"
  input: "^dense_2/bias/Assign"
  input: "^Adadelta/lr/Assign"
  input: "^Adadelta/decay/Assign"
  input: "^Adadelta/iterations/Assign"
  input: "^training/Adadelta/Variable/Assign"
  input: "^training/Adadelta/Variable_1/Assign"
  input: "^training/Adadelta/Variable_2/Assign"
  input: "^training/Adadelta/Variable_3/Assign"
  input: "^training/Adadelta/Variable_4/Assign"
  input: "^training/Adadelta/Variable_5/Assign"
  input: "^training/Adadelta/Variable_6/Assign"
  input: "^training/Adadelta/Variable_7/Assign"
  input: "^training/Adadelta/Variable_8/Assign"
  input: "^training/Adadelta/Variable_9/Assign"
  input: "^training/Adadelta/Variable_10/Assign"
  input: "^training/Adadelta/Variable_11/Assign"
  input: "^training/Adadelta/Variable_12/Assign"
  input: "^training/Adadelta/Variable_13/Assign"
  input: "^training/Adadelta/Variable_14/Assign"
  input: "^training/Adadelta/Variable_15/Assign"
  input: "^conv2d_1_1/kernel/Assign"
  input: "^conv2d_1_1/bias/Assign"
  input: "^conv2d_2_1/kernel/Assign"
  input: "^conv2d_2_1/bias/Assign"
  input: "^dense_1_1/kernel/Assign"
  input: "^dense_1_1/bias/Assign"
  input: "^dense_2_1/kernel/Assign"
  input: "^dense_2_1/bias/Assign"
  input: "^conv2d_1_2/kernel/Assign"
  input: "^conv2d_1_2/bias/Assign"
  input: "^conv2d_2_2/kernel/Assign"
  input: "^conv2d_2_2/bias/Assign"
  input: "^dense_1_2/kernel/Assign"
  input: "^dense_1_2/bias/Assign"
  input: "^dense_2_2/kernel/Assign"
  input: "^dense_2_2/bias/Assign"
}
node {
  name: "conv2d_1_input_3"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv2d_1_3/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1_3/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1_3/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1_3/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_1_3/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 9913543
    }
  }
}
node {
  name: "conv2d_1_3/random_uniform/sub"
  op: "Sub"
  input: "conv2d_1_3/random_uniform/max"
  input: "conv2d_1_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_3/random_uniform/mul"
  op: "Mul"
  input: "conv2d_1_3/random_uniform/RandomUniform"
  input: "conv2d_1_3/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_3/random_uniform"
  op: "Add"
  input: "conv2d_1_3/random_uniform/mul"
  input: "conv2d_1_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_3/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1_3/kernel/Assign"
  op: "Assign"
  input: "conv2d_1_3/kernel"
  input: "conv2d_1_3/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_3/kernel/read"
  op: "Identity"
  input: "conv2d_1_3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/kernel"
      }
    }
  }
}
node {
  name: "conv2d_1_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_1_3/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1_3/bias/Assign"
  op: "Assign"
  input: "conv2d_1_3/bias"
  input: "conv2d_1_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_3/bias/read"
  op: "Identity"
  input: "conv2d_1_3/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/bias"
      }
    }
  }
}
node {
  name: "conv2d_1_3/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1_3/convolution"
  op: "Conv2D"
  input: "conv2d_1_input_3"
  input: "conv2d_1_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_3/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_1_3/convolution"
  input: "conv2d_1_3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_1_3/Relu"
  op: "Relu"
  input: "conv2d_1_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_3/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2_3/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2_3/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2_3/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_2_3/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 3440491
    }
  }
}
node {
  name: "conv2d_2_3/random_uniform/sub"
  op: "Sub"
  input: "conv2d_2_3/random_uniform/max"
  input: "conv2d_2_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_3/random_uniform/mul"
  op: "Mul"
  input: "conv2d_2_3/random_uniform/RandomUniform"
  input: "conv2d_2_3/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_3/random_uniform"
  op: "Add"
  input: "conv2d_2_3/random_uniform/mul"
  input: "conv2d_2_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_3/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2_3/kernel/Assign"
  op: "Assign"
  input: "conv2d_2_3/kernel"
  input: "conv2d_2_3/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_3/kernel/read"
  op: "Identity"
  input: "conv2d_2_3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/kernel"
      }
    }
  }
}
node {
  name: "conv2d_2_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_2_3/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2_3/bias/Assign"
  op: "Assign"
  input: "conv2d_2_3/bias"
  input: "conv2d_2_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_3/bias/read"
  op: "Identity"
  input: "conv2d_2_3/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/bias"
      }
    }
  }
}
node {
  name: "conv2d_2_3/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2_3/convolution"
  op: "Conv2D"
  input: "conv2d_1_3/Relu"
  input: "conv2d_2_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_3/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_2_3/convolution"
  input: "conv2d_2_3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_2_3/Relu"
  op: "Relu"
  input: "conv2d_2_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d_1_3/MaxPool"
  op: "MaxPool"
  input: "conv2d_2_3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "dropout_1_3/Identity"
  op: "Identity"
  input: "max_pooling2d_1_3/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "flatten_1_3/Shape"
  op: "Shape"
  input: "dropout_1_3/Identity"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "flatten_1_3/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1_3/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1_3/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1_3/strided_slice"
  op: "StridedSlice"
  input: "flatten_1_3/Shape"
  input: "flatten_1_3/strided_slice/stack"
  input: "flatten_1_3/strided_slice/stack_1"
  input: "flatten_1_3/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1_3/Prod"
  op: "Prod"
  input: "flatten_1_3/strided_slice"
  input: "flatten_1_3/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "flatten_1_3/stack/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "flatten_1_3/stack"
  op: "Pack"
  input: "flatten_1_3/stack/0"
  input: "flatten_1_3/Prod"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1_3/Reshape"
  op: "Reshape"
  input: "dropout_1_3/Identity"
  input: "flatten_1_3/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dense_1_3/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\020\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "dense_1_3/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1_3/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1_3/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_1_3/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 2874293
    }
  }
}
node {
  name: "dense_1_3/random_uniform/sub"
  op: "Sub"
  input: "dense_1_3/random_uniform/max"
  input: "dense_1_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_3/random_uniform/mul"
  op: "Mul"
  input: "dense_1_3/random_uniform/RandomUniform"
  input: "dense_1_3/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_3/random_uniform"
  op: "Add"
  input: "dense_1_3/random_uniform/mul"
  input: "dense_1_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_3/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1_3/kernel/Assign"
  op: "Assign"
  input: "dense_1_3/kernel"
  input: "dense_1_3/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1_3/kernel/read"
  op: "Identity"
  input: "dense_1_3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/kernel"
      }
    }
  }
}
node {
  name: "dense_1_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_1_3/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1_3/bias/Assign"
  op: "Assign"
  input: "dense_1_3/bias"
  input: "dense_1_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1_3/bias/read"
  op: "Identity"
  input: "dense_1_3/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/bias"
      }
    }
  }
}
node {
  name: "dense_1_3/MatMul"
  op: "MatMul"
  input: "flatten_1_3/Reshape"
  input: "dense_1_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_1_3/BiasAdd"
  op: "BiasAdd"
  input: "dense_1_3/MatMul"
  input: "dense_1_3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_1_3/Relu"
  op: "Relu"
  input: "dense_1_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2_3/Identity"
  op: "Identity"
  input: "dense_1_3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_3/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000$\000\000\000"
      }
    }
  }
}
node {
  name: "dense_2_3/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2_3/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2_3/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_2_3/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 8632007
    }
  }
}
node {
  name: "dense_2_3/random_uniform/sub"
  op: "Sub"
  input: "dense_2_3/random_uniform/max"
  input: "dense_2_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_3/random_uniform/mul"
  op: "Mul"
  input: "dense_2_3/random_uniform/RandomUniform"
  input: "dense_2_3/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_3/random_uniform"
  op: "Add"
  input: "dense_2_3/random_uniform/mul"
  input: "dense_2_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_3/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2_3/kernel/Assign"
  op: "Assign"
  input: "dense_2_3/kernel"
  input: "dense_2_3/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2_3/kernel/read"
  op: "Identity"
  input: "dense_2_3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/kernel"
      }
    }
  }
}
node {
  name: "dense_2_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 36
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_2_3/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2_3/bias/Assign"
  op: "Assign"
  input: "dense_2_3/bias"
  input: "dense_2_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2_3/bias/read"
  op: "Identity"
  input: "dense_2_3/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/bias"
      }
    }
  }
}
node {
  name: "dense_2_3/MatMul"
  op: "MatMul"
  input: "dropout_2_3/Identity"
  input: "dense_2_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_2_3/BiasAdd"
  op: "BiasAdd"
  input: "dense_2_3/MatMul"
  input: "dense_2_3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_2_3/Softmax"
  op: "Softmax"
  input: "dense_2_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Placeholder_24"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_24"
  op: "Assign"
  input: "conv2d_1_3/kernel"
  input: "Placeholder_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_25"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_25"
  op: "Assign"
  input: "conv2d_1_3/bias"
  input: "Placeholder_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_26"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_26"
  op: "Assign"
  input: "conv2d_2_3/kernel"
  input: "Placeholder_26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_27"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_27"
  op: "Assign"
  input: "conv2d_2_3/bias"
  input: "Placeholder_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_28"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_28"
  op: "Assign"
  input: "dense_1_3/kernel"
  input: "Placeholder_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_29"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_29"
  op: "Assign"
  input: "dense_1_3/bias"
  input: "Placeholder_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_30"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_30"
  op: "Assign"
  input: "dense_2_3/kernel"
  input: "Placeholder_30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_31"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_31"
  op: "Assign"
  input: "dense_2_3/bias"
  input: "Placeholder_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "IsVariableInitialized_43"
  op: "IsVariableInitialized"
  input: "conv2d_1_3/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_44"
  op: "IsVariableInitialized"
  input: "conv2d_1_3/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_45"
  op: "IsVariableInitialized"
  input: "conv2d_2_3/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_46"
  op: "IsVariableInitialized"
  input: "conv2d_2_3/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_47"
  op: "IsVariableInitialized"
  input: "dense_1_3/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_48"
  op: "IsVariableInitialized"
  input: "dense_1_3/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_49"
  op: "IsVariableInitialized"
  input: "dense_2_3/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_50"
  op: "IsVariableInitialized"
  input: "dense_2_3/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "init_5"
  op: "NoOp"
  input: "^conv2d_1_3/kernel/Assign"
  input: "^conv2d_1_3/bias/Assign"
  input: "^conv2d_2_3/kernel/Assign"
  input: "^conv2d_2_3/bias/Assign"
  input: "^dense_1_3/kernel/Assign"
  input: "^dense_1_3/bias/Assign"
  input: "^dense_2_3/kernel/Assign"
  input: "^dense_2_3/bias/Assign"
}
node {
  name: "conv2d_1_input_4"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 20
        }
        dim {
          size: 20
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "conv2d_1_4/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1_4/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1_4/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1_4/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_1_4/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 4215734
    }
  }
}
node {
  name: "conv2d_1_4/random_uniform/sub"
  op: "Sub"
  input: "conv2d_1_4/random_uniform/max"
  input: "conv2d_1_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_4/random_uniform/mul"
  op: "Mul"
  input: "conv2d_1_4/random_uniform/RandomUniform"
  input: "conv2d_1_4/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_4/random_uniform"
  op: "Add"
  input: "conv2d_1_4/random_uniform/mul"
  input: "conv2d_1_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1_4/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1_4/kernel/Assign"
  op: "Assign"
  input: "conv2d_1_4/kernel"
  input: "conv2d_1_4/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_4/kernel/read"
  op: "Identity"
  input: "conv2d_1_4/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/kernel"
      }
    }
  }
}
node {
  name: "conv2d_1_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_1_4/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1_4/bias/Assign"
  op: "Assign"
  input: "conv2d_1_4/bias"
  input: "conv2d_1_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_4/bias/read"
  op: "Identity"
  input: "conv2d_1_4/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/bias"
      }
    }
  }
}
node {
  name: "conv2d_1_4/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1_4/convolution"
  op: "Conv2D"
  input: "conv2d_1_input_4"
  input: "conv2d_1_4/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1_4/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_1_4/convolution"
  input: "conv2d_1_4/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_1_4/Relu"
  op: "Relu"
  input: "conv2d_1_4/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_4/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2_4/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2_4/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2_4/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_2_4/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 5939327
    }
  }
}
node {
  name: "conv2d_2_4/random_uniform/sub"
  op: "Sub"
  input: "conv2d_2_4/random_uniform/max"
  input: "conv2d_2_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_4/random_uniform/mul"
  op: "Mul"
  input: "conv2d_2_4/random_uniform/RandomUniform"
  input: "conv2d_2_4/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_4/random_uniform"
  op: "Add"
  input: "conv2d_2_4/random_uniform/mul"
  input: "conv2d_2_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2_4/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2_4/kernel/Assign"
  op: "Assign"
  input: "conv2d_2_4/kernel"
  input: "conv2d_2_4/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_4/kernel/read"
  op: "Identity"
  input: "conv2d_2_4/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/kernel"
      }
    }
  }
}
node {
  name: "conv2d_2_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_2_4/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2_4/bias/Assign"
  op: "Assign"
  input: "conv2d_2_4/bias"
  input: "conv2d_2_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_4/bias/read"
  op: "Identity"
  input: "conv2d_2_4/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/bias"
      }
    }
  }
}
node {
  name: "conv2d_2_4/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2_4/convolution"
  op: "Conv2D"
  input: "conv2d_1_4/Relu"
  input: "conv2d_2_4/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "dilations"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2_4/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_2_4/convolution"
  input: "conv2d_2_4/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "conv2d_2_4/Relu"
  op: "Relu"
  input: "conv2d_2_4/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d_1_4/MaxPool"
  op: "MaxPool"
  input: "conv2d_2_4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "dropout_1_4/Identity"
  op: "Identity"
  input: "max_pooling2d_1_4/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "flatten_1_4/Shape"
  op: "Shape"
  input: "dropout_1_4/Identity"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "flatten_1_4/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1_4/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1_4/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1_4/strided_slice"
  op: "StridedSlice"
  input: "flatten_1_4/Shape"
  input: "flatten_1_4/strided_slice/stack"
  input: "flatten_1_4/strided_slice/stack_1"
  input: "flatten_1_4/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1_4/Prod"
  op: "Prod"
  input: "flatten_1_4/strided_slice"
  input: "flatten_1_4/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "flatten_1_4/stack/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "flatten_1_4/stack"
  op: "Pack"
  input: "flatten_1_4/stack/0"
  input: "flatten_1_4/Prod"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1_4/Reshape"
  op: "Reshape"
  input: "dropout_1_4/Identity"
  input: "flatten_1_4/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dense_1_4/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\020\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "dense_1_4/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1_4/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.03768891841173172
      }
    }
  }
}
node {
  name: "dense_1_4/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_1_4/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 5380535
    }
  }
}
node {
  name: "dense_1_4/random_uniform/sub"
  op: "Sub"
  input: "dense_1_4/random_uniform/max"
  input: "dense_1_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_4/random_uniform/mul"
  op: "Mul"
  input: "dense_1_4/random_uniform/RandomUniform"
  input: "dense_1_4/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_4/random_uniform"
  op: "Add"
  input: "dense_1_4/random_uniform/mul"
  input: "dense_1_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1_4/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1_4/kernel/Assign"
  op: "Assign"
  input: "dense_1_4/kernel"
  input: "dense_1_4/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1_4/kernel/read"
  op: "Identity"
  input: "dense_1_4/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/kernel"
      }
    }
  }
}
node {
  name: "dense_1_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_1_4/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1_4/bias/Assign"
  op: "Assign"
  input: "dense_1_4/bias"
  input: "dense_1_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1_4/bias/read"
  op: "Identity"
  input: "dense_1_4/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/bias"
      }
    }
  }
}
node {
  name: "dense_1_4/MatMul"
  op: "MatMul"
  input: "flatten_1_4/Reshape"
  input: "dense_1_4/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_1_4/BiasAdd"
  op: "BiasAdd"
  input: "dense_1_4/MatMul"
  input: "dense_1_4/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_1_4/Relu"
  op: "Relu"
  input: "dense_1_4/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_2_4/Identity"
  op: "Identity"
  input: "dense_1_4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_4/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000$\000\000\000"
      }
    }
  }
}
node {
  name: "dense_2_4/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2_4/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1912730187177658
      }
    }
  }
}
node {
  name: "dense_2_4/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_2_4/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 4542569
    }
  }
}
node {
  name: "dense_2_4/random_uniform/sub"
  op: "Sub"
  input: "dense_2_4/random_uniform/max"
  input: "dense_2_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_4/random_uniform/mul"
  op: "Mul"
  input: "dense_2_4/random_uniform/RandomUniform"
  input: "dense_2_4/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_4/random_uniform"
  op: "Add"
  input: "dense_2_4/random_uniform/mul"
  input: "dense_2_4/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2_4/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2_4/kernel/Assign"
  op: "Assign"
  input: "dense_2_4/kernel"
  input: "dense_2_4/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2_4/kernel/read"
  op: "Identity"
  input: "dense_2_4/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/kernel"
      }
    }
  }
}
node {
  name: "dense_2_4/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 36
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_2_4/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2_4/bias/Assign"
  op: "Assign"
  input: "dense_2_4/bias"
  input: "dense_2_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2_4/bias/read"
  op: "Identity"
  input: "dense_2_4/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/bias"
      }
    }
  }
}
node {
  name: "dense_2_4/MatMul"
  op: "MatMul"
  input: "dropout_2_4/Identity"
  input: "dense_2_4/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_2_4/BiasAdd"
  op: "BiasAdd"
  input: "dense_2_4/MatMul"
  input: "dense_2_4/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "dense_2_4/Softmax"
  op: "Softmax"
  input: "dense_2_4/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Placeholder_32"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_32"
  op: "Assign"
  input: "conv2d_1_4/kernel"
  input: "Placeholder_32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_33"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_33"
  op: "Assign"
  input: "conv2d_1_4/bias"
  input: "Placeholder_33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_34"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_34"
  op: "Assign"
  input: "conv2d_2_4/kernel"
  input: "Placeholder_34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_35"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_35"
  op: "Assign"
  input: "conv2d_2_4/bias"
  input: "Placeholder_35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_36"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 4096
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_36"
  op: "Assign"
  input: "dense_1_4/kernel"
  input: "Placeholder_36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_37"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_37"
  op: "Assign"
  input: "dense_1_4/bias"
  input: "Placeholder_37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_38"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_38"
  op: "Assign"
  input: "dense_2_4/kernel"
  input: "Placeholder_38"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_39"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 36
        }
      }
    }
  }
}
node {
  name: "Assign_39"
  op: "Assign"
  input: "dense_2_4/bias"
  input: "Placeholder_39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "IsVariableInitialized_51"
  op: "IsVariableInitialized"
  input: "conv2d_1_4/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_52"
  op: "IsVariableInitialized"
  input: "conv2d_1_4/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_53"
  op: "IsVariableInitialized"
  input: "conv2d_2_4/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_54"
  op: "IsVariableInitialized"
  input: "conv2d_2_4/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_55"
  op: "IsVariableInitialized"
  input: "dense_1_4/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_56"
  op: "IsVariableInitialized"
  input: "dense_1_4/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_57"
  op: "IsVariableInitialized"
  input: "dense_2_4/kernel"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "IsVariableInitialized_58"
  op: "IsVariableInitialized"
  input: "dense_2_4/bias"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "init_6"
  op: "NoOp"
  input: "^conv2d_1_4/kernel/Assign"
  input: "^conv2d_1_4/bias/Assign"
  input: "^conv2d_2_4/kernel/Assign"
  input: "^conv2d_2_4/bias/Assign"
  input: "^dense_1_4/kernel/Assign"
  input: "^dense_1_4/bias/Assign"
  input: "^dense_2_4/kernel/Assign"
  input: "^dense_2_4/bias/Assign"
}
node {
  name: "save_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save_3/StringJoin/inputs_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "_temp_8ded1d0e6a134cc9bd056289b3dec64d/part"
      }
    }
  }
}
node {
  name: "save_3/StringJoin"
  op: "StringJoin"
  input: "save_3/Const"
  input: "save_3/StringJoin/inputs_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "separator"
    value {
      s: ""
    }
  }
}
node {
  name: "save_3/num_shards"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "save_3/ShardedFilename/shard"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "save_3/ShardedFilename"
  op: "ShardedFilename"
  input: "save_3/StringJoin"
  input: "save_3/ShardedFilename/shard"
  input: "save_3/num_shards"
  device: "/device:CPU:0"
}
node {
  name: "save_3/SaveV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 59
          }
        }
        string_val: "Adadelta/decay"
        string_val: "Adadelta/iterations"
        string_val: "Adadelta/lr"
        string_val: "conv2d_1/bias"
        string_val: "conv2d_1/kernel"
        string_val: "conv2d_1_1/bias"
        string_val: "conv2d_1_1/kernel"
        string_val: "conv2d_1_2/bias"
        string_val: "conv2d_1_2/kernel"
        string_val: "conv2d_1_3/bias"
        string_val: "conv2d_1_3/kernel"
        string_val: "conv2d_1_4/bias"
        string_val: "conv2d_1_4/kernel"
        string_val: "conv2d_2/bias"
        string_val: "conv2d_2/kernel"
        string_val: "conv2d_2_1/bias"
        string_val: "conv2d_2_1/kernel"
        string_val: "conv2d_2_2/bias"
        string_val: "conv2d_2_2/kernel"
        string_val: "conv2d_2_3/bias"
        string_val: "conv2d_2_3/kernel"
        string_val: "conv2d_2_4/bias"
        string_val: "conv2d_2_4/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_1_1/bias"
        string_val: "dense_1_1/kernel"
        string_val: "dense_1_2/bias"
        string_val: "dense_1_2/kernel"
        string_val: "dense_1_3/bias"
        string_val: "dense_1_3/kernel"
        string_val: "dense_1_4/bias"
        string_val: "dense_1_4/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "dense_2_1/bias"
        string_val: "dense_2_1/kernel"
        string_val: "dense_2_2/bias"
        string_val: "dense_2_2/kernel"
        string_val: "dense_2_3/bias"
        string_val: "dense_2_3/kernel"
        string_val: "dense_2_4/bias"
        string_val: "dense_2_4/kernel"
        string_val: "training/Adadelta/Variable"
        string_val: "training/Adadelta/Variable_1"
        string_val: "training/Adadelta/Variable_10"
        string_val: "training/Adadelta/Variable_11"
        string_val: "training/Adadelta/Variable_12"
        string_val: "training/Adadelta/Variable_13"
        string_val: "training/Adadelta/Variable_14"
        string_val: "training/Adadelta/Variable_15"
        string_val: "training/Adadelta/Variable_2"
        string_val: "training/Adadelta/Variable_3"
        string_val: "training/Adadelta/Variable_4"
        string_val: "training/Adadelta/Variable_5"
        string_val: "training/Adadelta/Variable_6"
        string_val: "training/Adadelta/Variable_7"
        string_val: "training/Adadelta/Variable_8"
        string_val: "training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "save_3/SaveV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 59
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_3/SaveV2"
  op: "SaveV2"
  input: "save_3/ShardedFilename"
  input: "save_3/SaveV2/tensor_names"
  input: "save_3/SaveV2/shape_and_slices"
  input: "Adadelta/decay"
  input: "Adadelta/iterations"
  input: "Adadelta/lr"
  input: "conv2d_1/bias"
  input: "conv2d_1/kernel"
  input: "conv2d_1_1/bias"
  input: "conv2d_1_1/kernel"
  input: "conv2d_1_2/bias"
  input: "conv2d_1_2/kernel"
  input: "conv2d_1_3/bias"
  input: "conv2d_1_3/kernel"
  input: "conv2d_1_4/bias"
  input: "conv2d_1_4/kernel"
  input: "conv2d_2/bias"
  input: "conv2d_2/kernel"
  input: "conv2d_2_1/bias"
  input: "conv2d_2_1/kernel"
  input: "conv2d_2_2/bias"
  input: "conv2d_2_2/kernel"
  input: "conv2d_2_3/bias"
  input: "conv2d_2_3/kernel"
  input: "conv2d_2_4/bias"
  input: "conv2d_2_4/kernel"
  input: "dense_1/bias"
  input: "dense_1/kernel"
  input: "dense_1_1/bias"
  input: "dense_1_1/kernel"
  input: "dense_1_2/bias"
  input: "dense_1_2/kernel"
  input: "dense_1_3/bias"
  input: "dense_1_3/kernel"
  input: "dense_1_4/bias"
  input: "dense_1_4/kernel"
  input: "dense_2/bias"
  input: "dense_2/kernel"
  input: "dense_2_1/bias"
  input: "dense_2_1/kernel"
  input: "dense_2_2/bias"
  input: "dense_2_2/kernel"
  input: "dense_2_3/bias"
  input: "dense_2_3/kernel"
  input: "dense_2_4/bias"
  input: "dense_2_4/kernel"
  input: "training/Adadelta/Variable"
  input: "training/Adadelta/Variable_1"
  input: "training/Adadelta/Variable_10"
  input: "training/Adadelta/Variable_11"
  input: "training/Adadelta/Variable_12"
  input: "training/Adadelta/Variable_13"
  input: "training/Adadelta/Variable_14"
  input: "training/Adadelta/Variable_15"
  input: "training/Adadelta/Variable_2"
  input: "training/Adadelta/Variable_3"
  input: "training/Adadelta/Variable_4"
  input: "training/Adadelta/Variable_5"
  input: "training/Adadelta/Variable_6"
  input: "training/Adadelta/Variable_7"
  input: "training/Adadelta/Variable_8"
  input: "training/Adadelta/Variable_9"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_INT64
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_3/control_dependency"
  op: "Identity"
  input: "save_3/ShardedFilename"
  input: "^save_3/SaveV2"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save_3/ShardedFilename"
      }
    }
  }
}
node {
  name: "save_3/MergeV2Checkpoints/checkpoint_prefixes"
  op: "Pack"
  input: "save_3/ShardedFilename"
  input: "^save_3/control_dependency"
  device: "/device:CPU:0"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "save_3/MergeV2Checkpoints"
  op: "MergeV2Checkpoints"
  input: "save_3/MergeV2Checkpoints/checkpoint_prefixes"
  input: "save_3/Const"
  device: "/device:CPU:0"
  attr {
    key: "delete_old_dirs"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Identity"
  op: "Identity"
  input: "save_3/Const"
  input: "^save_3/control_dependency"
  input: "^save_3/MergeV2Checkpoints"
  device: "/device:CPU:0"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
}
node {
  name: "save_3/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 59
          }
        }
        string_val: "Adadelta/decay"
        string_val: "Adadelta/iterations"
        string_val: "Adadelta/lr"
        string_val: "conv2d_1/bias"
        string_val: "conv2d_1/kernel"
        string_val: "conv2d_1_1/bias"
        string_val: "conv2d_1_1/kernel"
        string_val: "conv2d_1_2/bias"
        string_val: "conv2d_1_2/kernel"
        string_val: "conv2d_1_3/bias"
        string_val: "conv2d_1_3/kernel"
        string_val: "conv2d_1_4/bias"
        string_val: "conv2d_1_4/kernel"
        string_val: "conv2d_2/bias"
        string_val: "conv2d_2/kernel"
        string_val: "conv2d_2_1/bias"
        string_val: "conv2d_2_1/kernel"
        string_val: "conv2d_2_2/bias"
        string_val: "conv2d_2_2/kernel"
        string_val: "conv2d_2_3/bias"
        string_val: "conv2d_2_3/kernel"
        string_val: "conv2d_2_4/bias"
        string_val: "conv2d_2_4/kernel"
        string_val: "dense_1/bias"
        string_val: "dense_1/kernel"
        string_val: "dense_1_1/bias"
        string_val: "dense_1_1/kernel"
        string_val: "dense_1_2/bias"
        string_val: "dense_1_2/kernel"
        string_val: "dense_1_3/bias"
        string_val: "dense_1_3/kernel"
        string_val: "dense_1_4/bias"
        string_val: "dense_1_4/kernel"
        string_val: "dense_2/bias"
        string_val: "dense_2/kernel"
        string_val: "dense_2_1/bias"
        string_val: "dense_2_1/kernel"
        string_val: "dense_2_2/bias"
        string_val: "dense_2_2/kernel"
        string_val: "dense_2_3/bias"
        string_val: "dense_2_3/kernel"
        string_val: "dense_2_4/bias"
        string_val: "dense_2_4/kernel"
        string_val: "training/Adadelta/Variable"
        string_val: "training/Adadelta/Variable_1"
        string_val: "training/Adadelta/Variable_10"
        string_val: "training/Adadelta/Variable_11"
        string_val: "training/Adadelta/Variable_12"
        string_val: "training/Adadelta/Variable_13"
        string_val: "training/Adadelta/Variable_14"
        string_val: "training/Adadelta/Variable_15"
        string_val: "training/Adadelta/Variable_2"
        string_val: "training/Adadelta/Variable_3"
        string_val: "training/Adadelta/Variable_4"
        string_val: "training/Adadelta/Variable_5"
        string_val: "training/Adadelta/Variable_6"
        string_val: "training/Adadelta/Variable_7"
        string_val: "training/Adadelta/Variable_8"
        string_val: "training/Adadelta/Variable_9"
      }
    }
  }
}
node {
  name: "save_3/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 59
          }
        }
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
        string_val: ""
      }
    }
  }
}
node {
  name: "save_3/RestoreV2"
  op: "RestoreV2"
  input: "save_3/Const"
  input: "save_3/RestoreV2/tensor_names"
  input: "save_3/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_FLOAT
        type: DT_INT64
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
        type: DT_FLOAT
      }
    }
  }
}
node {
  name: "save_3/Assign"
  op: "Assign"
  input: "Adadelta/decay"
  input: "save_3/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/decay"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_1"
  op: "Assign"
  input: "Adadelta/iterations"
  input: "save_3/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_2"
  op: "Assign"
  input: "Adadelta/lr"
  input: "save_3/RestoreV2:2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Adadelta/lr"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_3"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "save_3/RestoreV2:3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_4"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "save_3/RestoreV2:4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_5"
  op: "Assign"
  input: "conv2d_1_1/bias"
  input: "save_3/RestoreV2:5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_6"
  op: "Assign"
  input: "conv2d_1_1/kernel"
  input: "save_3/RestoreV2:6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_7"
  op: "Assign"
  input: "conv2d_1_2/bias"
  input: "save_3/RestoreV2:7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_8"
  op: "Assign"
  input: "conv2d_1_2/kernel"
  input: "save_3/RestoreV2:8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_9"
  op: "Assign"
  input: "conv2d_1_3/bias"
  input: "save_3/RestoreV2:9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_10"
  op: "Assign"
  input: "conv2d_1_3/kernel"
  input: "save_3/RestoreV2:10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_11"
  op: "Assign"
  input: "conv2d_1_4/bias"
  input: "save_3/RestoreV2:11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_12"
  op: "Assign"
  input: "conv2d_1_4/kernel"
  input: "save_3/RestoreV2:12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_13"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "save_3/RestoreV2:13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_14"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "save_3/RestoreV2:14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_15"
  op: "Assign"
  input: "conv2d_2_1/bias"
  input: "save_3/RestoreV2:15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_16"
  op: "Assign"
  input: "conv2d_2_1/kernel"
  input: "save_3/RestoreV2:16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_17"
  op: "Assign"
  input: "conv2d_2_2/bias"
  input: "save_3/RestoreV2:17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_18"
  op: "Assign"
  input: "conv2d_2_2/kernel"
  input: "save_3/RestoreV2:18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_19"
  op: "Assign"
  input: "conv2d_2_3/bias"
  input: "save_3/RestoreV2:19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_20"
  op: "Assign"
  input: "conv2d_2_3/kernel"
  input: "save_3/RestoreV2:20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_21"
  op: "Assign"
  input: "conv2d_2_4/bias"
  input: "save_3/RestoreV2:21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_22"
  op: "Assign"
  input: "conv2d_2_4/kernel"
  input: "save_3/RestoreV2:22"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_23"
  op: "Assign"
  input: "dense_1/bias"
  input: "save_3/RestoreV2:23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_24"
  op: "Assign"
  input: "dense_1/kernel"
  input: "save_3/RestoreV2:24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_25"
  op: "Assign"
  input: "dense_1_1/bias"
  input: "save_3/RestoreV2:25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_26"
  op: "Assign"
  input: "dense_1_1/kernel"
  input: "save_3/RestoreV2:26"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_27"
  op: "Assign"
  input: "dense_1_2/bias"
  input: "save_3/RestoreV2:27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_28"
  op: "Assign"
  input: "dense_1_2/kernel"
  input: "save_3/RestoreV2:28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_29"
  op: "Assign"
  input: "dense_1_3/bias"
  input: "save_3/RestoreV2:29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_30"
  op: "Assign"
  input: "dense_1_3/kernel"
  input: "save_3/RestoreV2:30"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_31"
  op: "Assign"
  input: "dense_1_4/bias"
  input: "save_3/RestoreV2:31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_32"
  op: "Assign"
  input: "dense_1_4/kernel"
  input: "save_3/RestoreV2:32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_33"
  op: "Assign"
  input: "dense_2/bias"
  input: "save_3/RestoreV2:33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_34"
  op: "Assign"
  input: "dense_2/kernel"
  input: "save_3/RestoreV2:34"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_35"
  op: "Assign"
  input: "dense_2_1/bias"
  input: "save_3/RestoreV2:35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_36"
  op: "Assign"
  input: "dense_2_1/kernel"
  input: "save_3/RestoreV2:36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_37"
  op: "Assign"
  input: "dense_2_2/bias"
  input: "save_3/RestoreV2:37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_38"
  op: "Assign"
  input: "dense_2_2/kernel"
  input: "save_3/RestoreV2:38"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_39"
  op: "Assign"
  input: "dense_2_3/bias"
  input: "save_3/RestoreV2:39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_40"
  op: "Assign"
  input: "dense_2_3/kernel"
  input: "save_3/RestoreV2:40"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_41"
  op: "Assign"
  input: "dense_2_4/bias"
  input: "save_3/RestoreV2:41"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_42"
  op: "Assign"
  input: "dense_2_4/kernel"
  input: "save_3/RestoreV2:42"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2_4/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_43"
  op: "Assign"
  input: "training/Adadelta/Variable"
  input: "save_3/RestoreV2:43"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_44"
  op: "Assign"
  input: "training/Adadelta/Variable_1"
  input: "save_3/RestoreV2:44"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_45"
  op: "Assign"
  input: "training/Adadelta/Variable_10"
  input: "save_3/RestoreV2:45"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_10"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_46"
  op: "Assign"
  input: "training/Adadelta/Variable_11"
  input: "save_3/RestoreV2:46"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_11"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_47"
  op: "Assign"
  input: "training/Adadelta/Variable_12"
  input: "save_3/RestoreV2:47"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_12"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_48"
  op: "Assign"
  input: "training/Adadelta/Variable_13"
  input: "save_3/RestoreV2:48"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_13"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_49"
  op: "Assign"
  input: "training/Adadelta/Variable_14"
  input: "save_3/RestoreV2:49"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_14"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_50"
  op: "Assign"
  input: "training/Adadelta/Variable_15"
  input: "save_3/RestoreV2:50"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_15"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_51"
  op: "Assign"
  input: "training/Adadelta/Variable_2"
  input: "save_3/RestoreV2:51"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_52"
  op: "Assign"
  input: "training/Adadelta/Variable_3"
  input: "save_3/RestoreV2:52"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_53"
  op: "Assign"
  input: "training/Adadelta/Variable_4"
  input: "save_3/RestoreV2:53"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_54"
  op: "Assign"
  input: "training/Adadelta/Variable_5"
  input: "save_3/RestoreV2:54"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_55"
  op: "Assign"
  input: "training/Adadelta/Variable_6"
  input: "save_3/RestoreV2:55"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_56"
  op: "Assign"
  input: "training/Adadelta/Variable_7"
  input: "save_3/RestoreV2:56"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_57"
  op: "Assign"
  input: "training/Adadelta/Variable_8"
  input: "save_3/RestoreV2:57"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/Assign_58"
  op: "Assign"
  input: "training/Adadelta/Variable_9"
  input: "save_3/RestoreV2:58"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/Adadelta/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save_3/restore_shard"
  op: "NoOp"
  input: "^save_3/Assign"
  input: "^save_3/Assign_1"
  input: "^save_3/Assign_2"
  input: "^save_3/Assign_3"
  input: "^save_3/Assign_4"
  input: "^save_3/Assign_5"
  input: "^save_3/Assign_6"
  input: "^save_3/Assign_7"
  input: "^save_3/Assign_8"
  input: "^save_3/Assign_9"
  input: "^save_3/Assign_10"
  input: "^save_3/Assign_11"
  input: "^save_3/Assign_12"
  input: "^save_3/Assign_13"
  input: "^save_3/Assign_14"
  input: "^save_3/Assign_15"
  input: "^save_3/Assign_16"
  input: "^save_3/Assign_17"
  input: "^save_3/Assign_18"
  input: "^save_3/Assign_19"
  input: "^save_3/Assign_20"
  input: "^save_3/Assign_21"
  input: "^save_3/Assign_22"
  input: "^save_3/Assign_23"
  input: "^save_3/Assign_24"
  input: "^save_3/Assign_25"
  input: "^save_3/Assign_26"
  input: "^save_3/Assign_27"
  input: "^save_3/Assign_28"
  input: "^save_3/Assign_29"
  input: "^save_3/Assign_30"
  input: "^save_3/Assign_31"
  input: "^save_3/Assign_32"
  input: "^save_3/Assign_33"
  input: "^save_3/Assign_34"
  input: "^save_3/Assign_35"
  input: "^save_3/Assign_36"
  input: "^save_3/Assign_37"
  input: "^save_3/Assign_38"
  input: "^save_3/Assign_39"
  input: "^save_3/Assign_40"
  input: "^save_3/Assign_41"
  input: "^save_3/Assign_42"
  input: "^save_3/Assign_43"
  input: "^save_3/Assign_44"
  input: "^save_3/Assign_45"
  input: "^save_3/Assign_46"
  input: "^save_3/Assign_47"
  input: "^save_3/Assign_48"
  input: "^save_3/Assign_49"
  input: "^save_3/Assign_50"
  input: "^save_3/Assign_51"
  input: "^save_3/Assign_52"
  input: "^save_3/Assign_53"
  input: "^save_3/Assign_54"
  input: "^save_3/Assign_55"
  input: "^save_3/Assign_56"
  input: "^save_3/Assign_57"
  input: "^save_3/Assign_58"
}
node {
  name: "save_3/restore_all"
  op: "NoOp"
  input: "^save_3/restore_shard"
}
versions {
  producer: 26
}
