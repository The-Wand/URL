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

public
extension Ask { // where T: Rest.Model { where T: CloudKit.Model {

    class Get: One {
    }

    class Post: One {
    }

    class Put: One {
    }

    class Head: One {
    }

    class Patch: One {
    }

    class Delete: One {
    }

    class Next: One {
    }

}

@available(visionOS, unavailable)
public
extension Ask where T: Rest.Model {


    @inline(__always)
    static
    func get(handler: @escaping (T)->() ) -> Get {
        .init(handler: handler)
    }

    @inline(__always)
    static
    func post(handler: @escaping (T)->() ) -> Post {
        .init(handler: handler)
    }

    @inline(__always)
    static
    func put(handler: @escaping (T)->() ) -> Put {
        .init(handler: handler)
    }

    @inline(__always)
    static
    func head(handler: @escaping (T)->() ) -> Head {
        .init(handler: handler)
    }

    @inline(__always)
    static
    func patch(handler: @escaping (T)->() ) -> Patch {
        .init(handler: handler)
    }

    @inline(__always)
    static
    func delete(handler: @escaping (T)->() ) -> Delete {
        .init(handler: handler)
    }

    @inline(__always)
    static
    func next(handler: @escaping (T)->() ) -> Next {
        .init(handler: handler)
    }

}

#endif
