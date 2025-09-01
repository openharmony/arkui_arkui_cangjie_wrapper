#  Copyright (c) 2025 Huawei Device Co., Ltd.
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
# 
#      http://www.apache.org/licenses/LICENSE-2.0
# 
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import sys
import os

from dotenv import load_dotenv
load_dotenv('D:\\.env')
framework_dir_path = os.environ['FRAMEWORK_PATH']

if framework_dir_path not in sys.path:
    sys.path.insert(0, framework_dir_path)

from deveco_project import DevecoProject
from testsuite_builder import TestSuiteBuilder
from config import config
from bundle import Bundle
from file_system import *

config.deveco_home = os.environ['DEVECO_HOME']
config.node = os.path.join(config.deveco_home, 'tools', 'node', 'node.exe')
config.hvigorw = os.path.join(config.deveco_home, 'tools', 'hvigor', 'bin', 'hvigorw.js')
config.tmp_path = 'D:\\tmp'

def build():
    testsuite_dir_path = os.path.join(os.path.dirname(os.path.abspath(__file__)))
    tb = TestSuiteBuilder(testsuite_dir_path=testsuite_dir_path)
    test_project = DevecoProject(os.path.join(tb.testsuite_dir_path, 'test'))
    test_bundle = Bundle(test_project)
    test_project.build(build_mode='debug')
    test_project.do_signing()
    copy_file(test_project.get_signed_hap_file_path(), os.path.join(tb.product_dir_path, 'entry.hap'))
    tb.test_file_name.append(os.path.join(tb.product_dir_path, 'entry.hap'))
    tb.dump_json(project_type='pure')
    

if __name__ == '__main__':
    build()
