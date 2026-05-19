///
/// Copyright 2020 Alexander Kozin
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
/// Created by Alex Kozin
/// El Machine 🤖

#if canImport(UIKit) && !os(watchOS)
import UIKit.UIImage
import Wand

@inline(__always)
@discardableResult
public
func | (image: UIImage?, ask: Ask<UIImage>.Operation) -> Core {
    let wand = Core.to(image)
    _ = wand.append(ask: ask)


//    (url, "com.wand.url") | { (image: UIImage) in
//
//    }

    return wand
}

extension URL: Expecting {

}

@available(iOS 15.0, *)
@inline(__always)
@discardableResult
public
func | (url: URL, handler: (UIImage)->()) -> Core {
    let wand: Core = [url, 30]

    let task: URLSessionDownloadTask = wand.get()
    task.delegate = wand.put(Delegate())
    wand.put(task)

    defer {
        task.resume()
    }

    return wand | .one { (data: Data) in
        print(url)
    }
}

@available(iOS 15.0, *)
@inline(__always)
@discardableResult
public
func | (raw: (URL, String), handler: (UIImage)->()) -> Core {

    let url = raw.0
    let backgroundIdentifier = raw.1

    let wand: Core = [raw.0, raw.1, 30]

    let task: URLSessionDownloadTask = wand.get()
    task.delegate = wand.put(Delegate())
    wand.put(task)

    defer {
        task.resume()
    }

    return wand | .one { (data: Data) in
        print(url)
    }
}

extension URLSessionDownloadTask: Obtainable {

    @inlinable
    public
    static
    func obtain<C>(with scope: C?, by wand: Wand.Core?) -> Self {

        let wand = Core.to(scope)

        let config  = scope as? URLSessionConfiguration ?? wand.get() ?? .default
        let session = scope as? URLSession ?? wand.get()

        var request = scope as? URLRequest ?? wand.get()
        request.cachePolicy = wand.get() ?? .returnCacheDataElseLoad

        let backgroundIdentifier: String? = wand.get()
        let cache: URLCache = wand.get()

        let task = if let id = backgroundIdentifier {
            session.downloadTask(with: request)
        } else {
            session.downloadTask(with: request) { url, response, error in
                if
                    let response = response,
                    let url = url,
                    cache.cachedResponse(for: request) == nil,
                    let data: Data = url|
                {
                    wand.add(data)

                    cache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: request)
                }
            }
        }

        return task as! Self
    }


}

class Delegate: NSObject, URLSessionDownloadDelegate, Wanded {

    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {

        guard let wand = isWanded else {
            return
        }

        wand.add(location, for: "Location")

        if
            let request = downloadTask.originalRequest,
            let response = downloadTask.response,
            let data = try? Data(contentsOf: location)
        {

            wand.add(data)

            let cache: URLCache = wand.get()
            cache.storeCachedResponse(CachedURLResponse(response: response, data: data), for: request)
        }
    }

    func urlSession(_ session: URLSession,
                    downloadTask: URLSessionDownloadTask,
                    didWriteData bytesWritten: Int64,
                    totalBytesWritten: Int64,
                    totalBytesExpectedToWrite: Int64) {

        let bytes = (bytesWritten: bytesWritten,
                     totalBytesWritten: totalBytesWritten,
                     totalBytesExpectedToWrite: totalBytesExpectedToWrite)

        isWanded?.add(bytes, for: "Bytes")
    }

}

extension URLSessionConfiguration {

    var isBackground: Bool {
        switch self {
            case .default, .ephemeral:
                false
            default:
                true
        }
    }

}

#endif
