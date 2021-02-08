node {
  name: "Input/Inputs"
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
          size: 1
        }
        dim {
          size: 128
        }
        dim {
          size: 128
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "ModZeroOut/cosh/Cosh"
  op: "Cosh"
  input: "Input/Inputs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution/random_normal/shape"
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
        tensor_content: "\005\000\000\000\005\000\000\000\003\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution/random_normal/mean"
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
  name: "ModZeroOut/Convolution/random_normal/stddev"
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
  name: "ModZeroOut/Convolution/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Convolution/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution/random_normal"
  op: "Add"
  input: "ModZeroOut/Convolution/random_normal/mul"
  input: "ModZeroOut/Convolution/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution/conv_weights"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 3
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
  name: "ModZeroOut/Convolution/conv_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution/conv_weights"
  input: "ModZeroOut/Convolution/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution/conv_weights"
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
  name: "ModZeroOut/Convolution/conv_weights/read"
  op: "Identity"
  input: "ModZeroOut/Convolution/conv_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution/conv_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution/ModZeroOut/Convolution/conv_weights_0/tag"
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
        string_val: "ModZeroOut/Convolution/ModZeroOut/Convolution/conv_weights_0"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution/ModZeroOut/Convolution/conv_weights_0"
  op: "HistogramSummary"
  input: "ModZeroOut/Convolution/ModZeroOut/Convolution/conv_weights_0/tag"
  input: "ModZeroOut/Convolution/conv_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution/random_normal_1/shape"
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
  name: "ModZeroOut/Convolution/random_normal_1/mean"
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
  name: "ModZeroOut/Convolution/random_normal_1/stddev"
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
  name: "ModZeroOut/Convolution/random_normal_1/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution/random_normal_1/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution/random_normal_1/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution/random_normal_1/RandomStandardNormal"
  input: "ModZeroOut/Convolution/random_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution/random_normal_1"
  op: "Add"
  input: "ModZeroOut/Convolution/random_normal_1/mul"
  input: "ModZeroOut/Convolution/random_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution/conv_biases"
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
  name: "ModZeroOut/Convolution/conv_biases/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution/conv_biases"
  input: "ModZeroOut/Convolution/random_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution/conv_biases"
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
  name: "ModZeroOut/Convolution/conv_biases/read"
  op: "Identity"
  input: "ModZeroOut/Convolution/conv_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution/conv_biases"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution/Conv2D"
  op: "Conv2D"
  input: "ModZeroOut/cosh/Cosh"
  input: "ModZeroOut/Convolution/conv_weights/read"
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
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
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
  name: "ModZeroOut/Convolution/add"
  op: "AddV2"
  input: "ModZeroOut/Convolution/Conv2D"
  input: "ModZeroOut/Convolution/conv_biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation/Relu6"
  op: "Relu6"
  input: "ModZeroOut/Convolution/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/random_normal/shape"
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
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/random_normal/mean"
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
  name: "ModZeroOut/Convolution_1/random_normal/stddev"
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
  name: "ModZeroOut/Convolution_1/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_1/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_1/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Convolution_1/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/random_normal"
  op: "Add"
  input: "ModZeroOut/Convolution_1/random_normal/mul"
  input: "ModZeroOut/Convolution_1/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/conv_weights"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 32
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
  name: "ModZeroOut/Convolution_1/conv_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_1/conv_weights"
  input: "ModZeroOut/Convolution_1/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_1/conv_weights"
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
  name: "ModZeroOut/Convolution_1/conv_weights/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_1/conv_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_1/conv_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/ModZeroOut/Convolution_1/conv_weights_0/tag"
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
        string_val: "ModZeroOut/Convolution_1/ModZeroOut/Convolution_1/conv_weights_0"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/ModZeroOut/Convolution_1/conv_weights_0"
  op: "HistogramSummary"
  input: "ModZeroOut/Convolution_1/ModZeroOut/Convolution_1/conv_weights_0/tag"
  input: "ModZeroOut/Convolution_1/conv_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/random_normal_1/shape"
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
  name: "ModZeroOut/Convolution_1/random_normal_1/mean"
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
  name: "ModZeroOut/Convolution_1/random_normal_1/stddev"
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
  name: "ModZeroOut/Convolution_1/random_normal_1/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_1/random_normal_1/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/random_normal_1/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_1/random_normal_1/RandomStandardNormal"
  input: "ModZeroOut/Convolution_1/random_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/random_normal_1"
  op: "Add"
  input: "ModZeroOut/Convolution_1/random_normal_1/mul"
  input: "ModZeroOut/Convolution_1/random_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/conv_biases"
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
  name: "ModZeroOut/Convolution_1/conv_biases/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_1/conv_biases"
  input: "ModZeroOut/Convolution_1/random_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_1/conv_biases"
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
  name: "ModZeroOut/Convolution_1/conv_biases/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_1/conv_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_1/conv_biases"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_1/Conv2D"
  op: "Conv2D"
  input: "ModZeroOut/Activation/Relu6"
  input: "ModZeroOut/Convolution_1/conv_weights/read"
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
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
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
  name: "ModZeroOut/Convolution_1/add"
  op: "AddV2"
  input: "ModZeroOut/Convolution_1/Conv2D"
  input: "ModZeroOut/Convolution_1/conv_biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation_1/Relu6"
  op: "Relu6"
  input: "ModZeroOut/Convolution_1/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Pooling/MaxPool2d"
  op: "MaxPool"
  input: "ModZeroOut/Activation_1/Relu6"
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
      s: "SAME"
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
  name: "ModZeroOut/cosh_1/Cosh"
  op: "Cosh"
  input: "ModZeroOut/Pooling/MaxPool2d"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/random_normal/shape"
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
        tensor_content: "\005\000\000\000\005\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/random_normal/mean"
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
  name: "ModZeroOut/Convolution_2/random_normal/stddev"
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
  name: "ModZeroOut/Convolution_2/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_2/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_2/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Convolution_2/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/random_normal"
  op: "Add"
  input: "ModZeroOut/Convolution_2/random_normal/mul"
  input: "ModZeroOut/Convolution_2/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/conv_weights"
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
          size: 5
        }
        dim {
          size: 5
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
  name: "ModZeroOut/Convolution_2/conv_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_2/conv_weights"
  input: "ModZeroOut/Convolution_2/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_2/conv_weights"
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
  name: "ModZeroOut/Convolution_2/conv_weights/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_2/conv_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_2/conv_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/ModZeroOut/Convolution_2/conv_weights_0/tag"
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
        string_val: "ModZeroOut/Convolution_2/ModZeroOut/Convolution_2/conv_weights_0"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/ModZeroOut/Convolution_2/conv_weights_0"
  op: "HistogramSummary"
  input: "ModZeroOut/Convolution_2/ModZeroOut/Convolution_2/conv_weights_0/tag"
  input: "ModZeroOut/Convolution_2/conv_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/random_normal_1/shape"
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
  name: "ModZeroOut/Convolution_2/random_normal_1/mean"
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
  name: "ModZeroOut/Convolution_2/random_normal_1/stddev"
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
  name: "ModZeroOut/Convolution_2/random_normal_1/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_2/random_normal_1/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/random_normal_1/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_2/random_normal_1/RandomStandardNormal"
  input: "ModZeroOut/Convolution_2/random_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/random_normal_1"
  op: "Add"
  input: "ModZeroOut/Convolution_2/random_normal_1/mul"
  input: "ModZeroOut/Convolution_2/random_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/conv_biases"
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
  name: "ModZeroOut/Convolution_2/conv_biases/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_2/conv_biases"
  input: "ModZeroOut/Convolution_2/random_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_2/conv_biases"
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
  name: "ModZeroOut/Convolution_2/conv_biases/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_2/conv_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_2/conv_biases"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_2/Conv2D"
  op: "Conv2D"
  input: "ModZeroOut/cosh_1/Cosh"
  input: "ModZeroOut/Convolution_2/conv_weights/read"
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
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
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
  name: "ModZeroOut/Convolution_2/add"
  op: "AddV2"
  input: "ModZeroOut/Convolution_2/Conv2D"
  input: "ModZeroOut/Convolution_2/conv_biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation_2/Relu6"
  op: "Relu6"
  input: "ModZeroOut/Convolution_2/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/random_normal/shape"
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
        tensor_content: "\005\000\000\000\005\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/random_normal/mean"
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
  name: "ModZeroOut/Convolution_3/random_normal/stddev"
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
  name: "ModZeroOut/Convolution_3/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_3/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_3/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Convolution_3/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/random_normal"
  op: "Add"
  input: "ModZeroOut/Convolution_3/random_normal/mul"
  input: "ModZeroOut/Convolution_3/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/conv_weights"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 64
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
  name: "ModZeroOut/Convolution_3/conv_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_3/conv_weights"
  input: "ModZeroOut/Convolution_3/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_3/conv_weights"
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
  name: "ModZeroOut/Convolution_3/conv_weights/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_3/conv_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_3/conv_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/ModZeroOut/Convolution_3/conv_weights_0/tag"
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
        string_val: "ModZeroOut/Convolution_3/ModZeroOut/Convolution_3/conv_weights_0"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/ModZeroOut/Convolution_3/conv_weights_0"
  op: "HistogramSummary"
  input: "ModZeroOut/Convolution_3/ModZeroOut/Convolution_3/conv_weights_0/tag"
  input: "ModZeroOut/Convolution_3/conv_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/random_normal_1/shape"
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
  name: "ModZeroOut/Convolution_3/random_normal_1/mean"
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
  name: "ModZeroOut/Convolution_3/random_normal_1/stddev"
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
  name: "ModZeroOut/Convolution_3/random_normal_1/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_3/random_normal_1/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/random_normal_1/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_3/random_normal_1/RandomStandardNormal"
  input: "ModZeroOut/Convolution_3/random_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/random_normal_1"
  op: "Add"
  input: "ModZeroOut/Convolution_3/random_normal_1/mul"
  input: "ModZeroOut/Convolution_3/random_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/conv_biases"
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
  name: "ModZeroOut/Convolution_3/conv_biases/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_3/conv_biases"
  input: "ModZeroOut/Convolution_3/random_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_3/conv_biases"
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
  name: "ModZeroOut/Convolution_3/conv_biases/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_3/conv_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_3/conv_biases"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_3/Conv2D"
  op: "Conv2D"
  input: "ModZeroOut/Activation_2/Relu6"
  input: "ModZeroOut/Convolution_3/conv_weights/read"
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
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
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
  name: "ModZeroOut/Convolution_3/add"
  op: "AddV2"
  input: "ModZeroOut/Convolution_3/Conv2D"
  input: "ModZeroOut/Convolution_3/conv_biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation_3/Relu6"
  op: "Relu6"
  input: "ModZeroOut/Convolution_3/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Pooling_1/MaxPool2d"
  op: "MaxPool"
  input: "ModZeroOut/Activation_3/Relu6"
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
      s: "SAME"
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
  name: "ModZeroOut/cosh_2/Cosh"
  op: "Cosh"
  input: "ModZeroOut/Pooling_1/MaxPool2d"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/random_normal/shape"
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
        tensor_content: "\005\000\000\000\005\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/random_normal/mean"
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
  name: "ModZeroOut/Convolution_4/random_normal/stddev"
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
  name: "ModZeroOut/Convolution_4/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_4/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_4/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Convolution_4/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/random_normal"
  op: "Add"
  input: "ModZeroOut/Convolution_4/random_normal/mul"
  input: "ModZeroOut/Convolution_4/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/conv_weights"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 64
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
  name: "ModZeroOut/Convolution_4/conv_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_4/conv_weights"
  input: "ModZeroOut/Convolution_4/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_4/conv_weights"
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
  name: "ModZeroOut/Convolution_4/conv_weights/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_4/conv_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_4/conv_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/ModZeroOut/Convolution_4/conv_weights_0/tag"
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
        string_val: "ModZeroOut/Convolution_4/ModZeroOut/Convolution_4/conv_weights_0"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/ModZeroOut/Convolution_4/conv_weights_0"
  op: "HistogramSummary"
  input: "ModZeroOut/Convolution_4/ModZeroOut/Convolution_4/conv_weights_0/tag"
  input: "ModZeroOut/Convolution_4/conv_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/random_normal_1/shape"
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
  name: "ModZeroOut/Convolution_4/random_normal_1/mean"
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
  name: "ModZeroOut/Convolution_4/random_normal_1/stddev"
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
  name: "ModZeroOut/Convolution_4/random_normal_1/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_4/random_normal_1/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/random_normal_1/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_4/random_normal_1/RandomStandardNormal"
  input: "ModZeroOut/Convolution_4/random_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/random_normal_1"
  op: "Add"
  input: "ModZeroOut/Convolution_4/random_normal_1/mul"
  input: "ModZeroOut/Convolution_4/random_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/conv_biases"
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
  name: "ModZeroOut/Convolution_4/conv_biases/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_4/conv_biases"
  input: "ModZeroOut/Convolution_4/random_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_4/conv_biases"
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
  name: "ModZeroOut/Convolution_4/conv_biases/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_4/conv_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_4/conv_biases"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_4/Conv2D"
  op: "Conv2D"
  input: "ModZeroOut/cosh_2/Cosh"
  input: "ModZeroOut/Convolution_4/conv_weights/read"
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
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
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
  name: "ModZeroOut/Convolution_4/add"
  op: "AddV2"
  input: "ModZeroOut/Convolution_4/Conv2D"
  input: "ModZeroOut/Convolution_4/conv_biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation_4/Relu6"
  op: "Relu6"
  input: "ModZeroOut/Convolution_4/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/random_normal/shape"
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
        tensor_content: "\005\000\000\000\005\000\000\000\200\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/random_normal/mean"
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
  name: "ModZeroOut/Convolution_5/random_normal/stddev"
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
  name: "ModZeroOut/Convolution_5/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_5/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_5/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Convolution_5/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/random_normal"
  op: "Add"
  input: "ModZeroOut/Convolution_5/random_normal/mul"
  input: "ModZeroOut/Convolution_5/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/conv_weights"
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
          size: 5
        }
        dim {
          size: 5
        }
        dim {
          size: 128
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
  name: "ModZeroOut/Convolution_5/conv_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_5/conv_weights"
  input: "ModZeroOut/Convolution_5/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_5/conv_weights"
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
  name: "ModZeroOut/Convolution_5/conv_weights/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_5/conv_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_5/conv_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/ModZeroOut/Convolution_5/conv_weights_0/tag"
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
        string_val: "ModZeroOut/Convolution_5/ModZeroOut/Convolution_5/conv_weights_0"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/ModZeroOut/Convolution_5/conv_weights_0"
  op: "HistogramSummary"
  input: "ModZeroOut/Convolution_5/ModZeroOut/Convolution_5/conv_weights_0/tag"
  input: "ModZeroOut/Convolution_5/conv_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/random_normal_1/shape"
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
  name: "ModZeroOut/Convolution_5/random_normal_1/mean"
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
  name: "ModZeroOut/Convolution_5/random_normal_1/stddev"
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
  name: "ModZeroOut/Convolution_5/random_normal_1/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Convolution_5/random_normal_1/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/random_normal_1/mul"
  op: "Mul"
  input: "ModZeroOut/Convolution_5/random_normal_1/RandomStandardNormal"
  input: "ModZeroOut/Convolution_5/random_normal_1/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/random_normal_1"
  op: "Add"
  input: "ModZeroOut/Convolution_5/random_normal_1/mul"
  input: "ModZeroOut/Convolution_5/random_normal_1/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/conv_biases"
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
  name: "ModZeroOut/Convolution_5/conv_biases/Assign"
  op: "Assign"
  input: "ModZeroOut/Convolution_5/conv_biases"
  input: "ModZeroOut/Convolution_5/random_normal_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_5/conv_biases"
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
  name: "ModZeroOut/Convolution_5/conv_biases/read"
  op: "Identity"
  input: "ModZeroOut/Convolution_5/conv_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution_5/conv_biases"
      }
    }
  }
}
node {
  name: "ModZeroOut/Convolution_5/Conv2D"
  op: "Conv2D"
  input: "ModZeroOut/Activation_4/Relu6"
  input: "ModZeroOut/Convolution_5/conv_weights/read"
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
    key: "explicit_paddings"
    value {
      list {
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
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
  name: "ModZeroOut/Convolution_5/add"
  op: "AddV2"
  input: "ModZeroOut/Convolution_5/Conv2D"
  input: "ModZeroOut/Convolution_5/conv_biases/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation_5/Relu6"
  op: "Relu6"
  input: "ModZeroOut/Convolution_5/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Pooling_2/MaxPool2d"
  op: "MaxPool"
  input: "ModZeroOut/Activation_5/Relu6"
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
      s: "SAME"
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
  name: "ModZeroOut/Flatten/Reshape/shape"
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
        tensor_content: "\377\377\377\377\000\200\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Flatten/Reshape"
  op: "Reshape"
  input: "ModZeroOut/Pooling_2/MaxPool2d"
  input: "ModZeroOut/Flatten/Reshape/shape"
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
  name: "ModZeroOut/Dense/random_normal/shape"
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
        tensor_content: "\000\200\000\000\310\000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense/random_normal/mean"
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
  name: "ModZeroOut/Dense/random_normal/stddev"
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
  name: "ModZeroOut/Dense/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Dense/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Dense/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Dense/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Dense/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense/random_normal"
  op: "Add"
  input: "ModZeroOut/Dense/random_normal/mul"
  input: "ModZeroOut/Dense/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense/dense_weights"
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
          size: 32768
        }
        dim {
          size: 200
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
  name: "ModZeroOut/Dense/dense_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Dense/dense_weights"
  input: "ModZeroOut/Dense/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense/dense_weights"
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
  name: "ModZeroOut/Dense/dense_weights/read"
  op: "Identity"
  input: "ModZeroOut/Dense/dense_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense/dense_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense/ModZeroOut/Dense/dense_weights_0/tag"
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
        string_val: "ModZeroOut/Dense/ModZeroOut/Dense/dense_weights_0"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense/ModZeroOut/Dense/dense_weights_0"
  op: "HistogramSummary"
  input: "ModZeroOut/Dense/ModZeroOut/Dense/dense_weights_0/tag"
  input: "ModZeroOut/Dense/dense_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense/dense_biases/shape"
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
        int_val: 200
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense/dense_biases/mean"
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
  name: "ModZeroOut/Dense/dense_biases/stddev"
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
  name: "ModZeroOut/Dense/dense_biases/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Dense/dense_biases/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Dense/dense_biases/mul"
  op: "Mul"
  input: "ModZeroOut/Dense/dense_biases/RandomStandardNormal"
  input: "ModZeroOut/Dense/dense_biases/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense/dense_biases"
  op: "Add"
  input: "ModZeroOut/Dense/dense_biases/mul"
  input: "ModZeroOut/Dense/dense_biases/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense/Variable"
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
          size: 200
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
  name: "ModZeroOut/Dense/Variable/Assign"
  op: "Assign"
  input: "ModZeroOut/Dense/Variable"
  input: "ModZeroOut/Dense/dense_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense/Variable"
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
  name: "ModZeroOut/Dense/Variable/read"
  op: "Identity"
  input: "ModZeroOut/Dense/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense/Variable"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense/MatMul"
  op: "MatMul"
  input: "ModZeroOut/Flatten/Reshape"
  input: "ModZeroOut/Dense/dense_weights/read"
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
  name: "ModZeroOut/Dense/add"
  op: "AddV2"
  input: "ModZeroOut/Dense/MatMul"
  input: "ModZeroOut/Dense/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation_6/Sigmoid"
  op: "Sigmoid"
  input: "ModZeroOut/Dense/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/random_normal/shape"
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
        tensor_content: "\310\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/random_normal/mean"
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
  name: "ModZeroOut/Dense_1/random_normal/stddev"
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
  name: "ModZeroOut/Dense_1/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Dense_1/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Dense_1/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Dense_1/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/random_normal"
  op: "Add"
  input: "ModZeroOut/Dense_1/random_normal/mul"
  input: "ModZeroOut/Dense_1/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/dense_weights"
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
          size: 200
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
  name: "ModZeroOut/Dense_1/dense_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Dense_1/dense_weights"
  input: "ModZeroOut/Dense_1/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense_1/dense_weights"
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
  name: "ModZeroOut/Dense_1/dense_weights/read"
  op: "Identity"
  input: "ModZeroOut/Dense_1/dense_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense_1/dense_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/ModZeroOut/Dense_1/dense_weights_0/tag"
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
        string_val: "ModZeroOut/Dense_1/ModZeroOut/Dense_1/dense_weights_0"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/ModZeroOut/Dense_1/dense_weights_0"
  op: "HistogramSummary"
  input: "ModZeroOut/Dense_1/ModZeroOut/Dense_1/dense_weights_0/tag"
  input: "ModZeroOut/Dense_1/dense_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/dense_biases/shape"
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
  name: "ModZeroOut/Dense_1/dense_biases/mean"
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
  name: "ModZeroOut/Dense_1/dense_biases/stddev"
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
  name: "ModZeroOut/Dense_1/dense_biases/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Dense_1/dense_biases/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/dense_biases/mul"
  op: "Mul"
  input: "ModZeroOut/Dense_1/dense_biases/RandomStandardNormal"
  input: "ModZeroOut/Dense_1/dense_biases/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/dense_biases"
  op: "Add"
  input: "ModZeroOut/Dense_1/dense_biases/mul"
  input: "ModZeroOut/Dense_1/dense_biases/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/Variable"
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
  name: "ModZeroOut/Dense_1/Variable/Assign"
  op: "Assign"
  input: "ModZeroOut/Dense_1/Variable"
  input: "ModZeroOut/Dense_1/dense_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense_1/Variable"
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
  name: "ModZeroOut/Dense_1/Variable/read"
  op: "Identity"
  input: "ModZeroOut/Dense_1/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense_1/Variable"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense_1/MatMul"
  op: "MatMul"
  input: "ModZeroOut/Activation_6/Sigmoid"
  input: "ModZeroOut/Dense_1/dense_weights/read"
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
  name: "ModZeroOut/Dense_1/add"
  op: "AddV2"
  input: "ModZeroOut/Dense_1/MatMul"
  input: "ModZeroOut/Dense_1/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation_7/Sigmoid"
  op: "Sigmoid"
  input: "ModZeroOut/Dense_1/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/random_normal/shape"
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
        tensor_content: " \000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/random_normal/mean"
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
  name: "ModZeroOut/Dense_2/random_normal/stddev"
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
  name: "ModZeroOut/Dense_2/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Dense_2/random_normal/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/random_normal/mul"
  op: "Mul"
  input: "ModZeroOut/Dense_2/random_normal/RandomStandardNormal"
  input: "ModZeroOut/Dense_2/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/random_normal"
  op: "Add"
  input: "ModZeroOut/Dense_2/random_normal/mul"
  input: "ModZeroOut/Dense_2/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/dense_weights"
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
        dim {
          size: 2
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
  name: "ModZeroOut/Dense_2/dense_weights/Assign"
  op: "Assign"
  input: "ModZeroOut/Dense_2/dense_weights"
  input: "ModZeroOut/Dense_2/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense_2/dense_weights"
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
  name: "ModZeroOut/Dense_2/dense_weights/read"
  op: "Identity"
  input: "ModZeroOut/Dense_2/dense_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense_2/dense_weights"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/dense_biases/shape"
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
        int_val: 2
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/dense_biases/mean"
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
  name: "ModZeroOut/Dense_2/dense_biases/stddev"
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
  name: "ModZeroOut/Dense_2/dense_biases/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "ModZeroOut/Dense_2/dense_biases/shape"
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
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/dense_biases/mul"
  op: "Mul"
  input: "ModZeroOut/Dense_2/dense_biases/RandomStandardNormal"
  input: "ModZeroOut/Dense_2/dense_biases/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/dense_biases"
  op: "Add"
  input: "ModZeroOut/Dense_2/dense_biases/mul"
  input: "ModZeroOut/Dense_2/dense_biases/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/Variable"
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
          size: 2
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
  name: "ModZeroOut/Dense_2/Variable/Assign"
  op: "Assign"
  input: "ModZeroOut/Dense_2/Variable"
  input: "ModZeroOut/Dense_2/dense_biases"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense_2/Variable"
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
  name: "ModZeroOut/Dense_2/Variable/read"
  op: "Identity"
  input: "ModZeroOut/Dense_2/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Dense_2/Variable"
      }
    }
  }
}
node {
  name: "ModZeroOut/Dense_2/MatMul"
  op: "MatMul"
  input: "ModZeroOut/Activation_7/Sigmoid"
  input: "ModZeroOut/Dense_2/dense_weights/read"
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
  name: "ModZeroOut/Dense_2/add"
  op: "AddV2"
  input: "ModZeroOut/Dense_2/MatMul"
  input: "ModZeroOut/Dense_2/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Activation_8/softmax_output"
  op: "Softmax"
  input: "ModZeroOut/Dense_2/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ModZeroOut/Zeroout/zero_out"
  op: "ZeroOut"
  input: "ModZeroOut/Activation_8/softmax_output"
}
node {
  name: "save/filename/input"
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
  name: "save/filename"
  op: "PlaceholderWithDefault"
  input: "save/filename/input"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
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
  name: "save/Const"
  op: "PlaceholderWithDefault"
  input: "save/filename"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
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
            size: 18
          }
        }
        string_val: "ModZeroOut/Convolution/conv_biases"
        string_val: "ModZeroOut/Convolution/conv_weights"
        string_val: "ModZeroOut/Convolution_1/conv_biases"
        string_val: "ModZeroOut/Convolution_1/conv_weights"
        string_val: "ModZeroOut/Convolution_2/conv_biases"
        string_val: "ModZeroOut/Convolution_2/conv_weights"
        string_val: "ModZeroOut/Convolution_3/conv_biases"
        string_val: "ModZeroOut/Convolution_3/conv_weights"
        string_val: "ModZeroOut/Convolution_4/conv_biases"
        string_val: "ModZeroOut/Convolution_4/conv_weights"
        string_val: "ModZeroOut/Convolution_5/conv_biases"
        string_val: "ModZeroOut/Convolution_5/conv_weights"
        string_val: "ModZeroOut/Dense/Variable"
        string_val: "ModZeroOut/Dense/dense_weights"
        string_val: "ModZeroOut/Dense_1/Variable"
        string_val: "ModZeroOut/Dense_1/dense_weights"
        string_val: "ModZeroOut/Dense_2/Variable"
        string_val: "ModZeroOut/Dense_2/dense_weights"
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
            size: 18
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
  input: "ModZeroOut/Convolution/conv_biases"
  input: "ModZeroOut/Convolution/conv_weights"
  input: "ModZeroOut/Convolution_1/conv_biases"
  input: "ModZeroOut/Convolution_1/conv_weights"
  input: "ModZeroOut/Convolution_2/conv_biases"
  input: "ModZeroOut/Convolution_2/conv_weights"
  input: "ModZeroOut/Convolution_3/conv_biases"
  input: "ModZeroOut/Convolution_3/conv_weights"
  input: "ModZeroOut/Convolution_4/conv_biases"
  input: "ModZeroOut/Convolution_4/conv_weights"
  input: "ModZeroOut/Convolution_5/conv_biases"
  input: "ModZeroOut/Convolution_5/conv_weights"
  input: "ModZeroOut/Dense/Variable"
  input: "ModZeroOut/Dense/dense_weights"
  input: "ModZeroOut/Dense_1/Variable"
  input: "ModZeroOut/Dense_1/dense_weights"
  input: "ModZeroOut/Dense_2/Variable"
  input: "ModZeroOut/Dense_2/dense_weights"
  attr {
    key: "dtypes"
    value {
      list {
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
            size: 18
          }
        }
        string_val: "ModZeroOut/Convolution/conv_biases"
        string_val: "ModZeroOut/Convolution/conv_weights"
        string_val: "ModZeroOut/Convolution_1/conv_biases"
        string_val: "ModZeroOut/Convolution_1/conv_weights"
        string_val: "ModZeroOut/Convolution_2/conv_biases"
        string_val: "ModZeroOut/Convolution_2/conv_weights"
        string_val: "ModZeroOut/Convolution_3/conv_biases"
        string_val: "ModZeroOut/Convolution_3/conv_weights"
        string_val: "ModZeroOut/Convolution_4/conv_biases"
        string_val: "ModZeroOut/Convolution_4/conv_weights"
        string_val: "ModZeroOut/Convolution_5/conv_biases"
        string_val: "ModZeroOut/Convolution_5/conv_weights"
        string_val: "ModZeroOut/Dense/Variable"
        string_val: "ModZeroOut/Dense/dense_weights"
        string_val: "ModZeroOut/Dense_1/Variable"
        string_val: "ModZeroOut/Dense_1/dense_weights"
        string_val: "ModZeroOut/Dense_2/Variable"
        string_val: "ModZeroOut/Dense_2/dense_weights"
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
            size: 18
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
  input: "ModZeroOut/Convolution/conv_biases"
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
        s: "loc:@ModZeroOut/Convolution/conv_biases"
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
  input: "ModZeroOut/Convolution/conv_weights"
  input: "save/RestoreV2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@ModZeroOut/Convolution/conv_weights"
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
  input: "ModZeroOut/Convolution_1/conv_biases"
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
        s: "loc:@ModZeroOut/Convolution_1/conv_biases"
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
  input: "ModZeroOut/Convolution_1/conv_weights"
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
        s: "loc:@ModZeroOut/Convolution_1/conv_weights"
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
  input: "ModZeroOut/Convolution_2/conv_biases"
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
        s: "loc:@ModZeroOut/Convolution_2/conv_biases"
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
  input: "ModZeroOut/Convolution_2/conv_weights"
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
        s: "loc:@ModZeroOut/Convolution_2/conv_weights"
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
  input: "ModZeroOut/Convolution_3/conv_biases"
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
        s: "loc:@ModZeroOut/Convolution_3/conv_biases"
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
  input: "ModZeroOut/Convolution_3/conv_weights"
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
        s: "loc:@ModZeroOut/Convolution_3/conv_weights"
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
  input: "ModZeroOut/Convolution_4/conv_biases"
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
        s: "loc:@ModZeroOut/Convolution_4/conv_biases"
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
  input: "ModZeroOut/Convolution_4/conv_weights"
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
        s: "loc:@ModZeroOut/Convolution_4/conv_weights"
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
  input: "ModZeroOut/Convolution_5/conv_biases"
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
        s: "loc:@ModZeroOut/Convolution_5/conv_biases"
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
  input: "ModZeroOut/Convolution_5/conv_weights"
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
        s: "loc:@ModZeroOut/Convolution_5/conv_weights"
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
  input: "ModZeroOut/Dense/Variable"
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
        s: "loc:@ModZeroOut/Dense/Variable"
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
  input: "ModZeroOut/Dense/dense_weights"
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
        s: "loc:@ModZeroOut/Dense/dense_weights"
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
  input: "ModZeroOut/Dense_1/Variable"
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
        s: "loc:@ModZeroOut/Dense_1/Variable"
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
  input: "ModZeroOut/Dense_1/dense_weights"
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
        s: "loc:@ModZeroOut/Dense_1/dense_weights"
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
  input: "ModZeroOut/Dense_2/Variable"
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
        s: "loc:@ModZeroOut/Dense_2/Variable"
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
  input: "ModZeroOut/Dense_2/dense_weights"
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
        s: "loc:@ModZeroOut/Dense_2/dense_weights"
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
  input: "^save/Assign_10"
  input: "^save/Assign_11"
  input: "^save/Assign_12"
  input: "^save/Assign_13"
  input: "^save/Assign_14"
  input: "^save/Assign_15"
  input: "^save/Assign_16"
  input: "^save/Assign_17"
  input: "^save/Assign_2"
  input: "^save/Assign_3"
  input: "^save/Assign_4"
  input: "^save/Assign_5"
  input: "^save/Assign_6"
  input: "^save/Assign_7"
  input: "^save/Assign_8"
  input: "^save/Assign_9"
}
node {
  name: "Merge/MergeSummary"
  op: "MergeSummary"
  input: "ModZeroOut/Convolution/ModZeroOut/Convolution/conv_weights_0"
  input: "ModZeroOut/Convolution_1/ModZeroOut/Convolution_1/conv_weights_0"
  input: "ModZeroOut/Convolution_2/ModZeroOut/Convolution_2/conv_weights_0"
  input: "ModZeroOut/Convolution_3/ModZeroOut/Convolution_3/conv_weights_0"
  input: "ModZeroOut/Convolution_4/ModZeroOut/Convolution_4/conv_weights_0"
  input: "ModZeroOut/Convolution_5/ModZeroOut/Convolution_5/conv_weights_0"
  input: "ModZeroOut/Dense/ModZeroOut/Dense/dense_weights_0"
  input: "ModZeroOut/Dense_1/ModZeroOut/Dense_1/dense_weights_0"
  attr {
    key: "N"
    value {
      i: 8
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^ModZeroOut/Convolution/conv_biases/Assign"
  input: "^ModZeroOut/Convolution/conv_weights/Assign"
  input: "^ModZeroOut/Convolution_1/conv_biases/Assign"
  input: "^ModZeroOut/Convolution_1/conv_weights/Assign"
  input: "^ModZeroOut/Convolution_2/conv_biases/Assign"
  input: "^ModZeroOut/Convolution_2/conv_weights/Assign"
  input: "^ModZeroOut/Convolution_3/conv_biases/Assign"
  input: "^ModZeroOut/Convolution_3/conv_weights/Assign"
  input: "^ModZeroOut/Convolution_4/conv_biases/Assign"
  input: "^ModZeroOut/Convolution_4/conv_weights/Assign"
  input: "^ModZeroOut/Convolution_5/conv_biases/Assign"
  input: "^ModZeroOut/Convolution_5/conv_weights/Assign"
  input: "^ModZeroOut/Dense/Variable/Assign"
  input: "^ModZeroOut/Dense/dense_weights/Assign"
  input: "^ModZeroOut/Dense_1/Variable/Assign"
  input: "^ModZeroOut/Dense_1/dense_weights/Assign"
  input: "^ModZeroOut/Dense_2/Variable/Assign"
  input: "^ModZeroOut/Dense_2/dense_weights/Assign"
}
versions {
  producer: 134
}
