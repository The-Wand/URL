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

import WandURL
import Wand

extension GitHubAPI.Repo: GitHubAPI.Model {    

    public 
    static
    var path: String {
        base! + "repositories"
    }

}

/// Get Model
/// 
/// 42 | .get { (repo: Repo) in
///
/// }
///
@discardableResult
@inline(__always)
func |(id: Int,
       get: Ask<GitHubAPI.Repo>.Get) -> Wand {

    let wand: Wand = nil

    let path = GitHubAPI.Repo.path + "/\(id)"
    wand.store(path)

    return wand | get
}

/// Head Repo
///
/// id | .head { (done: Int) in
///
/// }
///
@discardableResult
@inline(__always)
func |(id: Int,
       head: Ask<GitHubAPI.Repo>.Head) -> Wand {

    let wand: Wand = nil

    let path = GitHubAPI.Repo.path + "/\(id)"
    wand.store(path)

    return wand | head
}

@discardableResult
@inline(__always)
func |(query: (org: String, limit: Int),
       get: Ask<[GitHubAPI.Repo]>.Get) -> Wand {

    let wand: Wand = nil

    let path = "https://api.github.com/orgs/\(query.org)/repos"
    wand.store(path, key: "base")
    
    wand.store(query.limit)

    return wand | get
}
