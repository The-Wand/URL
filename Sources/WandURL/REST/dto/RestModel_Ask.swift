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

extension Ask { // where T: Rest.Model { where T: CloudKit.Model {

    open
    class Get: Ask {
    }

    open
    class Post: Ask {
    }

    open
    class Put: Ask {
    }

    open
    class Head: Ask {
    }

    open
    class Patch: Ask {
    }

    open
    class Delete: Ask {
    }

    open
    class Next: Page {
    }
    
    open
    class Page: Get {
    }

}

@available(visionOS, unavailable)
public
extension Ask {

    @inline(__always)
    static
    func post(handler: @escaping (T)->() ) -> Post {
        .init(once: true, handler: handler)
    }

    @inline(__always)
    static
    func put(handler: @escaping (T)->() ) -> Put {
        .init(once: true, handler: handler)
    }

    @inline(__always)
    static
    func head(handler: @escaping (T)->() ) -> Head {
        .init(once: true, handler: handler)
    }

    @inline(__always)
    static
    func patch(handler: @escaping (T)->() ) -> Patch {
        .init(once: true, handler: handler)
    }
    
    @inline(__always)
    static
    func delete(handler: @escaping (T)->() ) -> Delete {
        .init(once: true, handler: handler)
    }
    
    @inline(__always)
    static
    func next(handler: @escaping (T)->(Bool) ) -> Next {
        .init(once: true, handler: handler)
    }
    
    @inline(__always)
    static
    func page(handler: @escaping (T)->() ) -> Page {
        .init(once: true, handler: handler)
    }

}

#endif
