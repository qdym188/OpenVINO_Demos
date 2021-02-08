#!/usr/bin/env python3

import tensorflow as tf
from tensorflow.python.framework import graph_io
from NetworkBuilder import NetworkBuilder
import datetime
import numpy as np
import os, os.path, sys


savedir = "tf_model/"

def getLayerNames():
    tensor_names = [t.name for op in tf.get_default_graph().get_operations() for t in op.values()]
    for t in tensor_names:
        print("\t{}".format(t))

def getModel(input_data):
    model = input_data
    nb = NetworkBuilder()
    model = nb.attach_cosh_layer(model)
    model = nb.attach_conv_layer(model, 32, summary='True')
    model = nb.attach_relu_layer(model)
    model = nb.attach_conv_layer(model, 32, summary='True')
    model = nb.attach_relu_layer(model)
    model = nb.attach_pooling_layer(model)

    model = nb.attach_cosh_layer(model)
    model = nb.attach_conv_layer(model, 64, summary=True)
    model = nb.attach_relu_layer(model)
    model = nb.attach_conv_layer(model, 64, summary=True)
    model = nb.attach_relu_layer(model)
    model = nb.attach_pooling_layer(model)

    model = nb.attach_cosh_layer(model)
    model = nb.attach_conv_layer(model, 128, summary=True)
    model = nb.attach_relu_layer(model)
    model = nb.attach_conv_layer(model, 128, summary=True)
    model = nb.attach_relu_layer(model)
    model = nb.attach_pooling_layer(model)

    model = nb.flatten(model)
    model = nb.attach_dense_layer(model, 200, summary=True)
    model = nb.attach_sigmoid_layer(model)
    model = nb.attach_dense_layer(model, 32, summary=True)
    model = nb.attach_sigmoid_layer(model)
    model = nb.attach_dense_layer(model, 2)
    model = nb.attach_softmax_layer(model)
    prediction = nb.attach_zeroout_layer(model)
    return prediction

def freezeTestModel():
    with tf.name_scope("Input") as scope:
        input_img = tf.compat.v1.placeholder(dtype='float', shape=[1, 128, 128, 3], name="Inputs")

    with tf.name_scope("Target") as scope:
        nb = NetworkBuilder()

    with tf.name_scope("ModZeroOut") as scope:
        model = getModel(input_img)
    
    with tf.compat.v1.Session() as sess:
        output_layer = "ModZeroOut/Zeroout/zero_out"
        saver = tf.compat.v1.train.Saver()
        summaryMerged = tf.compat.v1.summary.merge_all()
        LOGDIR="logs"
        writer = tf.compat.v1.summary.FileWriter(LOGDIR)
        writer.add_graph(sess.graph)
        tf.compat.v1.global_variables_initializer().run()
        nodes = [n.name for n in tf.compat.v1.get_default_graph().as_graph_def().node]
        for t in nodes:
            print("\t{}".format(t))
        #save_path = saver.save(sess, "{}/{}".format(savedir, model))
        tf.compat.v1.train.write_graph(sess.graph_def, savedir, 'graph.pb')

        save_path = saver.save(sess, "{}/{}".format(savedir, "model.ckpt"))
        print("Model saved in path: %s" % save_path)

        frozen = tf.compat.v1.graph_util.convert_variables_to_constants(sess, sess.graph_def, [output_layer])
        graph_io.write_graph(frozen, savedir, 'frozen_inference_graph.pb', as_text=False)

def buildInputData():
    input_data = np.zeros( [1, 128, 128, 3], dtype = np.float32 )   
    return input_data


freezeTestModel()
