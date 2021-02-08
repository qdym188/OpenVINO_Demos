import tensorflow as tf


zero_out_op = tf.load_op_library('./zero_out.so')
#with tf.Session():
#    print(zero_out_op.zero_out([[1,2,3,4,5],[1,2,3,4,5]]).eval())


input_data = tf.constant( [[0, 10, -10],[-1,2,-3]] , dtype = tf.float32 )
#output = tf.nn.relu(input_data)
output =zero_out_op.zero_out(input_data)
sess=tf.Session()
print(sess.run(output))
