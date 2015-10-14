#!/bin/bash

# Copyright 2015 The Android Open Source Project

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#      http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

rm -rf generated
mkdir -p generated
python ../vk-generate.py dispatch-table-ops layer > generated/vk_dispatch_table_helper.h

python ../vk_helper.py --gen_enum_string_helper ../include/vulkan.h --abs_out_dir generated
python ../vk_helper.py --gen_struct_wrappers ../include/vulkan.h --abs_out_dir generated

python ../vk-layer-generate.py Generic ../include/vulkan.h > generated/generic_layer.cpp
python ../vk-layer-generate.py APIDump ../include/vulkan.h > generated/api_dump.cpp
python ../vk-layer-generate.py ObjectTracker ../include/vulkan.h > generated/object_track.cpp
python ../vk-layer-generate.py Threading ../include/vulkan.h > generated/threading.cpp
