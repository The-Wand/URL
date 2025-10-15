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
@_exported
import Foundation.NSURLSession
@_exported
import Wand

/// Obtain
///
/// let task: URLSessionDataTask = request|
///
@available(visionOS, unavailable)
extension URLSessionDataTask: Obtainable {

    @inline(__always)
    public 
    static 
    func obtain(by wand: Core?) -> Self {

        let wand = wand ?? Core()

        let session: URLSession = wand.get()
        let request = URLRequest.obtain(by: wand)

//        let ask = wand.asking["Data"]?.last as? Ask<Data>

        let task = session.dataTask(with: request) { data, response, error in
            
            print(request)
            
            if let error = error {
                wand.add(error)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                wand.add(Core.Error.HTTP("Not http?"))
                return
            }

            let statusCode = httpResponse.statusCode
            if !(200...299).contains(httpResponse.statusCode)  {
                wand.add(Core.Error.HTTP("Code: \(statusCode)"))
                return
            }

            guard let data = data else {
                wand.add(Core.Error.HTTP("No data"))
                return
            }

            if !data.isEmpty {
                //BUG: mimeType == "text/plain" for empty "content-type"
                let mime = httpResponse.mimeType
                if mime != "application/json" {
                    wand.add(Core.Error.HTTP("Mime: \(mime ?? "")"))
                    return
                }
            }

            wand.add(httpResponse)
            wand.add(data)//, for: ask?.key)

        } as! Self

        return task

    }

}

public
extension Core.Error {

    public
    static
    func HTTP(_ reason: String) -> Error {
        Self(reason: reason)
    }

}

#endif
