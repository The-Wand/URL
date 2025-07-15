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
protocol Rest_ModelPagedURL: Rest.Paged {

    static
    var nextPage: String? {get set}

}

extension Rest {
    
    public
    typealias PagedURL = Rest_ModelPagedURL
    
}

@available(visionOS, unavailable)
@discardableResult
@inline(__always)
prefix
public
func |<T: Rest.PagedURL> (get: Ask<[T]>.Get) -> Core {
    nil | get
}

/// Ask
///
/// wand | .get { (array: [Rest.Model]) in
///
/// }
///
@available(visionOS, unavailable)
@inline(__always)
@discardableResult
public
func |<T: Rest.PagedURL> (wand: Core, get: Ask<[T]>.Get) -> Core {
    
    let limit: Int  = wand.get() ?? T.limit
    let limitKey    = T.limitKey
    
//    let path: String = (wand.get(for: "base") ?? T.path) + (limitKey, "\(limit)")
//    
//    if offset == -1 {
//        wand.add(Wand.Error.HTTP("Request is out of bounds: \(path)"))
//        return wand
//    }
//    
//    wand.store(path)
    wand.putDefault(T.headers)

    _ = wand.append(ask: get)

    return wand | .one { (data: Data) in
        
        do  {
            let reply = try JSONDecoder().decode([T].self, from: data)
            let _: Data? = wand.extract()
        
//            let newOffset = if reply.count < limit {
//                -1
//            } else {
//                offset + 1
//            }
//            wand.store(newOffset, key: offsetKey)
            
            wand.add(reply)
        }
        catch(let e)
        {
            wand.add(e)
        }

    }
}

/// Ask Paged with nextURL
///
/// wand | .get { (models: [T]) in
///
/// }
///
/// wand | .next { (models: [T]) in
///
/// }
///
@available(visionOS, unavailable)
@inline(__always)
@discardableResult
public
func |<T: Rest.PagedURL> (wand: Core, next: Ask<[T]>.Next) -> Core {
    wand | (next as Ask<[T]>.Get)
}

#endif
