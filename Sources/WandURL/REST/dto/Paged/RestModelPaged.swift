/////
///// Copyright © 2020-2024 El Machine 🤖
///// https://el-machine.com/
/////
///// Licensed under the Apache License, Version 2.0 (the "License");
///// you may not use this file except in compliance with the License.
///// You may obtain a copy of the License at
/////
///// 1) LICENSE file
///// 2) https://apache.org/licenses/LICENSE-2.0
/////
///// Unless required by applicable law or agreed to in writing, software
///// distributed under the License is distributed on an "AS IS" BASIS,
///// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
///// See the License for the specific language governing permissions and
///// limitations under the License.
/////
///// Created by Alex Kozin
///// 2020 El Machine
//
//#if canImport(Foundation)
//import Foundation
//import Wand
//
//public
//extension Ask {
//    
//    @inline(__always)
//    static
//    func next(handler: @escaping (T)->() ) -> Next {
//        .init(once: true, handler: handler)
//    }
//    
//}
//
//@available(visionOS, unavailable)
//public
//protocol Rest_ModelPaged: Rest.Model {
//
//    static
//    var limit: Int {get}
//    
//    static
//    var limitKey: String {get}
//    
//}
//
//public
//extension Rest_ModelPaged {
//    
//    static
//    var limit: Int {
//        20
//    }
//    
//    static
//    var limitKey: String {
//        "limit"
//    }
//    
//}
//
//extension Rest {
//    
//    public
//    typealias Paged = Rest_ModelPaged
//    
//}
//
//#endif
