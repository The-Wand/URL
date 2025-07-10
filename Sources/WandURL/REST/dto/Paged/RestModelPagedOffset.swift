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
protocol Rest_ModelPagedOffset: Rest.Paged {

    static
    var offsetKey: String {get}
    
}

public
extension Rest_ModelPaged {
    
    static
    var offsetKey: String {
        "offset"
    }
    
}

extension Rest {
    
    public
    typealias PagedOffset = Rest_ModelPagedOffset
    
}

@available(visionOS, unavailable)
@discardableResult
@inline(__always)
prefix
public
func |<T: Rest.PagedOffset> (get: Ask<[T]>.Get) -> Wand {
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
func |<T: Rest.PagedOffset> (wand: Wand, get: Ask<[T]>.Get) -> Wand {
    
    let limit: Int  = wand.get() ?? T.limit
    let limitKey    = T.limitKey
    
    let offsetKey   = T.offsetKey
    let offset: Int = wand.get(for: offsetKey) ?? 1
    
    let url: URL = (wand.get(for: "base") ?? T.path|) + [limitKey: "\(limit)",
                                                        offsetKey: "\(offset)"]
    
    if offset == -1 {
        wand.add(Wand.Error.HTTP("Request is out of bounds: \(url)"))
        return wand
    }
    
    wand.store(url)
    wand.addDefault(T.headers)

    _ = wand.answer(the: get)

    return wand | .one { (data: Data) in
        
        do  {
            print(url)
            
            let reply = try JSONDecoder().decode([T].self, from: data)
            let _: Data? = wand.extract()
        
            let newOffset = if reply.count < limit {
                -1
            } else {
                offset + 1
            }
            wand.store(newOffset, key: offsetKey)
            
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
func |<T: Rest.PagedOffset> (wand: Wand, next: Ask<[T]>.Next) -> Wand {
    wand | (next as Ask<[T]>.Get)
}

#endif
