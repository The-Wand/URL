
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
### 🕹️ How to
[![How to add REST API support to Swift project](https://img.youtube.com/vi/I81GEbc1ES8/0.jpg)](https://www.youtube.com/watch?v=I81GEbc1ES8)

### ❗ Error handling

```swift
//Attach Ask<Error> to the scope
any | { (error: Error) in
    
}
```
```swift
//Or use the result handler
//Nil error means successed result
any | { (error: Error?) in
    
}
```

### 📝 Jump to Definition
  A long time ago in a galaxy far, far away....   
  There was proper Jump to Definition ability in Xcode   
  For predefined operators so as custom too:   
  [Feedback](https://github.com/The-Wand/Wand/issues/17)   
     
  Today the Wand introducing Xcode Source Editor Extension:   
     
  Run   🔧 Extension > Mac   
  Editor > Extension > Jump (App Shortcuts -> +)   
  
### 📑 Documentation
  DocC, or Documentation Compiler, makes it easy to produce rich and engaging developer   
  documentation for your apps, frameworks, and packages:   
     
  Product > Build Documentation (⌃ ⇧ ⌘ D)   

The Wand may collect usage data   
You must attribute the author   
[Aleksandr Kozin](mailto:al.kozin@gmail.com)  
Apps since 2008
