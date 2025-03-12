///
/// Copyright © 2020-2024 El Machine 🤖
/// https://el-machine.com/
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
/// 1) LICENSE file
/// 2) https://apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Alex Kozin
/// 2020 El Machine

#if canImport(Foundation)
import Foundation
import Wand

@available(visionOS, unavailable)
public
protocol Rest_Model: Asking, Wanded, Codable {

    
    static
    var base: String? {get}

    static
    var path: String {get}

    static 
    var headers: [String : String] {get}

}

@available(visionOS, unavailable)
extension Rest_Model {
    
    @inline(__always)
    public
    static
    var path: String? {
        nil
    }
    
    @inline(__always)
    public
    static
    var headers: [String : String] {
        JSON.defaultHeaders
    }
    
}

@available(visionOS, unavailable)
extension Rest_Model {

    @inline(__always)
    public
    static
    var get: Ask<Self>.Get {
        .init(once: true)
    }

    @inline(__always)
    public
    static
    var post: Ask<Self>.Post {
        .init(once: true)
    }

    @inline(__always)
    public
    static
    var put: Ask<Self>.Put {
        .init(once: true)
    }

    //TODO:
    @inline(__always)
    public
    static
    var delete: Ask<Self>.Get {
        .init(once: true)
    }

    @inline(__always)
    public
    static
    var head: Ask<Self>.Get {
        .init(once: true)
    }//

}

#endif
