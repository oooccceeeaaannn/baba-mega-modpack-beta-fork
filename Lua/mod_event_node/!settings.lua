--[[ NODE_LEGACY_PARSING = false
Set this to true to enable legacy parsing. Legacy parsing is an older form of node parsing that parses in chains instead of trees.
Legacy node parsing's verbs and conditions are esoteric and unintuitive. It is not recommended to use legacy node parsing unless
you have already designed your entire levelpack around legacy parsing. In addition, legacy parsing will not be able to use branch
nil nodes or bump nil nodes, and will not have its parser's bugs fixed, though bugs relating to reparsing and the special noun may
be patched, and redesigns to old nodes' sprites will be applied.
]]

NODE_SORT_BY_TYPE = false --[[
Set this to true to make nodes in the editor palette sort alphabetically within their type, rather than just alphabetically.
Nils will be grouped further into standard and bump, and nouns will be grouped further into normal and special.
]]