///
/// Copyright 2020 Aleksander Kozin
///
/// Licensed under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License.
/// You may obtain a copy of the License at
///
///     http://www.apache.org/licenses/LICENSE-2.0
///
/// Unless required by applicable law or agreed to in writing, software
/// distributed under the License is distributed on an "AS IS" BASIS,
/// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
/// See the License for the specific language governing permissions and
/// limitations under the License.
///
/// Created by Aleksander Kozin
/// The Wand

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
extension URLSessionDataTask: @retroactive Obtainable {

    @inline(__always)
    public 
    static 
    func obtain<C>(with scope: C?, by wand: Core?) -> Self {

        let wand = wand ?? Core()

        let session: URLSession = wand.get()
        let request: URLRequest = wand.get()

        //TODO: Key change
        let ask = scope as! Ask<C>
        
        var handler: (@Sendable (Data?, URLResponse?, (any Error)?) -> Void)!
        handler = { data, response, error in


            let retry = {
                let task = session.dataTask(with: request, completionHandler: handler)
                wand.add(task)

//                handler = nil //?

                task.resume()
            }

            if let error = error {
                wand.add(error, retry: retry)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                wand.add(Core.Error.HTTP("Not http?"), retry: retry)
                return
            }

            let statusCode = httpResponse.statusCode
            if !(200...299).contains(httpResponse.statusCode)  {
                wand.add(Core.Error.HTTP("Code: \(statusCode)"), retry: retry)
                return
            }

            guard let data = data else {
                wand.add(Core.Error.HTTP("No data"), retry: retry)
                return
            }

            if !data.isEmpty {
                //BUG: mimeType == "text/plain" for empty "content-type"
                let mime = httpResponse.mimeType //TODO: handle request.value(forHTTPHeaderField: "Accept") == nil
                if mime != request.value(forHTTPHeaderField: "Accept") {
                    wand.add(Core.Error.HTTP("Mime: \(mime ?? "")"), retry: retry)
                    return
                }
            }

            wand.add(httpResponse)
            wand.add(data, for: ask.key)
            
            //wand.add(data)//, for: ask?.key)
        }

        let task = session.dataTask(with: request, completionHandler: handler)  as! Self

        return task
    }

}

public
extension Error {

    public
    static
    func HTTP(_ reason: String) -> Error {
        Core.Error.with(reason: reason)
    }

}

#endif

