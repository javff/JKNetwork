# SPNetwork

in progress ...


# How to use.

- Create a ProviderConfiguration.
- Define yours enpoints.
- Instantiate NetworkProvider.
- Enjoy 🚀🚀🚀🚀


# Example 


## Basic network provider

```
struct CatFactProviderConfiguration: ProviderConfiguration {
    var baseURL: URL {
        return URL(string: "https://catfact.ninja")!
    }
}

```

## Basic Endpoint definition

```
struct CatFactEndpoint: EndpointDefinition {
    func makeRequest(_ urlRequestBuilder: URLRequestBuilder) -> URLRequest {
        return urlRequestBuilder
            .withPath("fact")
            .build()
    }
}
```

## Define your DecodableModel

```
struct CatFact: Decodable {
    let fact: String
    let length: Int
}
```

## Basic Usage

```
  let provider = NetworkApiProvider<CatFactProviderConfiguration>()
  let endpoint = CatFactEndpoint()

  do {
       let cat: CatFact = try await provider.request(endpoint: endpoint)
       print(cat.fact)
       print(cat.endpoint)
  } catch {
     // capture any error
  }


```
