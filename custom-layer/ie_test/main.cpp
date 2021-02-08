// Copyright (C) 2018-2020 Intel Corporation
// SPDX-License-Identifier: Apache-2.0
//

#include <vector>
#include <memory>
#include <string>

#include <inference_engine.hpp>
#include "zero_out_ext.hpp"

using namespace InferenceEngine;

int main(int argc, char *argv[]) {
    try {
        const std::string input_model = argv[1];
        Core ie;
#if 0
        const std::string ext_path = "../../ie_extension/build/libzeroout_cpu_extension.so";
        const auto extension_ptr = InferenceEngine::make_so_pointer<InferenceEngine::IExtension>(ext_path);      
        ie.AddExtension(extension_ptr);
#else
        IExtensionPtr inPlaceExtension;
        inPlaceExtension = std::make_shared<InPlaceExtension>();
        ie.AddExtension(inPlaceExtension);
#endif
        std::cout << "CPU (MKLDNN) extensions is loaded " << std::endl;
        CNNNetwork network = ie.ReadNetwork(input_model);
        InputInfo::Ptr input_info = network.getInputsInfo().begin()->second;
        std::string input_name = network.getInputsInfo().begin()->first;
        //input_info->getPreProcess().setResizeAlgorithm(RESIZE_BILINEAR);
        //input_info->setLayout(Layout::NHWC);
        input_info->setPrecision(Precision::FP32);
        DataPtr output_info = network.getOutputsInfo().begin()->second;
        std::string output_name = network.getOutputsInfo().begin()->first;

        output_info->setPrecision(Precision::FP32);
        ExecutableNetwork executable_network = ie.LoadNetwork(network, "CPU");
        InferRequest infer_request = executable_network.CreateInferRequest();

        int idx = 0;
        Blob::Ptr InputPara = infer_request.GetBlob(input_name);
        MemoryBlob::Ptr minput = as<MemoryBlob>(InputPara);
        auto minputHolder = minput->wmap();
        float *p = minputHolder.as<PrecisionTrait<Precision::FP32>::value_type *>();
        for(int i = 0; i < 128; i++)
        {
            p[i] = 2*idx + 1;
        }
        idx++;

        infer_request.Infer();
        Blob::Ptr output = infer_request.GetBlob(output_name);
        // -----------------------------------------------------------------------------------------------------
    } catch (const std::exception & ex) {
        std::cerr << ex.what() << std::endl;
        return EXIT_FAILURE;
    }
    std::cout << "This sample is an API example, for any performance measurements "
                 "please use the dedicated benchmark_app tool" << std::endl;
    return EXIT_SUCCESS;
}
