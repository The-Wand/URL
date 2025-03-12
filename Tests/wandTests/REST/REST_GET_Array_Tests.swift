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

import XCTest

import Wand_URL
import Wand

@available(visionOS, unavailable)
class Codable_Array_GET_Tests: XCTestCase {

    @available(iOS 16.0, *)
    func test_Codable_Array() {
        let e = expectation()

        |.get { (result: [GitHubAPI.Repo]) in

            if
                !result.isEmpty,
                result.first?.id != 0
            {
                e.fulfill()
            }

        }

        waitForExpectations(timeout: .default * 4)
    }

    @available(iOS 16.0, *)
    func test_Path_to_Codable_Array() {
        let e = expectation()

        let path = "https://api.github.com/repositories?q=ios"
        path | .get { (array: [GitHubAPI.Repo]) in
            e.fulfill()
        }

        waitForExpectations()
    }

    @available(iOS 16, macOS 13, tvOS 16, watchOS 9, *)
    func test_URL_to_Codable_Array() {
        let e = expectation()

        let q = URLQueryItem(name: "q", value: "swift")
        let url = URL(string: "https://api.github.com/repositories")!

        url + q | .get { (array: [GitHubAPI.Repo]) in
            e.fulfill()
        }

        waitForExpectations()
    }

}
