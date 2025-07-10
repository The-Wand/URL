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

#if canImport(Foundation)
import Foundation.NSURL


@inline(__always)
public
func + (url: URL, item: (String, String) ) -> URL {
    url + item|
}

@inlinable
public
func + (url: URL, q: URLQueryItem) -> URL {
    if #available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *) {
        return url.appending(queryItems: [q])
    } else {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        var items = components.queryItems ?? []
        items.append(q)
        components.queryItems = items
        
        return components.url!
    }
}

@inlinable
public
func + (url: URL, items: [String: String]) -> URL {

    let queryItems = items.map {
        URLQueryItem(name: $0.key, value: String(describing: $0.value))
    }
    
    if #available(iOS 16.0, *) {
        return url.appending(queryItems: queryItems)
    } else {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        
        var items = components.queryItems ?? []
        items.append(contentsOf: queryItems)
        components.queryItems = items
        
        return components.url!
    }

}

#endif
