@_functionBuilder public struct DictionaryBuilder<Key: Hashable, Value> {
    public static func buildBlock(_ dictionaries: [Key: Value]...) -> [Key: Value] {
        dictionaries.reduce(into: [:]) {
            $0.merge($1) { _, new in new }
        }
    }
    
    public static func buildEither(first: [Key: Value]) -> [Key: Value] {
        first
    }
    
    public static func buildEither(second: [Key: Value]) -> [Key: Value] {
        second
    }
    
    public static func buildIf(_ dictionary: [Key: Value]?) -> [Key: Value] {
        dictionary ?? [:]
    }
}

extension Dictionary {
    public init(@DictionaryBuilder<Key, Value> _ builder: () -> [Key: Value]) {
        self = builder()
    }
}
