
## API for Any (thing) |

### Usage
```bash

#Ask Data
"https://api.github.com/gists" | { (data: Data) in

}

#Ask JSON model
URL(string: "https://api.github.com/gists") | { (dictionary: [String: Any]) in

}

#Ask JSON Models array
"https://api.github.com/gists" | { (array: [Any]) in

}

```

```bash
#REST
protocol GitHubAPI.Model: Rest.Model {
}

extension GitHubAPI.Repo: GitHubAPI.Model {    
}

|.get { (result: [GitHubAPI.Repo]) in

}

#Ask Codable Model
let id = 804244016
id | .get { (repo: GitHubAPI.Repo) in

}

#Post Codable Model
repo | .post { (done: GitHubAPI.Repo) in

}

```
### How to
[![How to Add REST API support to Swift project](https://img.youtube.com/vi/I81GEbc1ES8/0.jpg)](https://www.youtube.com/watch?v=I81GEbc1ES8)

### Idea
  Imagine that you have a black box that can give you any object 💡  
  You don't know what is already in box or what will happens inside ⚙️   
  Simply ask for objects that you need

### Сoncept

Wand started from idea about receiving anything in most efficient and fast way 🪄  
Just add on¯e sign to completion handler and retreive the result 📦  

You ideas, comments, contribution are welcome |

Tasks

- [x] Notification
- [x] Data
- [x] URL
- [x] Data
- [x] JsonObject
- [x] REST

[Alex Kozin](mailto:al@el-machine.com)  
[El Machine 🤖](https://el-machine.com) 2024
