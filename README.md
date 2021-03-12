
# AssetCatalogKit

A Swift package for generating asset catalogs.

## License

See the LICENSE file for licensing information.

## Example

```swift
let assetCatalog = AssetCatalog(name: "MyAssets", children: [...])
try assetCatalog.write(to: "/tmp/test-assets")
```
