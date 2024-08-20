NODE_LEGACY_PARSING = false --[[
Set this to true to enable legacy parsing. Legacy parsing is an older form of node parsing that parses in chains instead of trees.
Legacy node parsing's verbs and conditions are esoteric and unintuitive. It is not recommended to use legacy node parsing unless
you have already designed your entire levelpack around legacy parsing. In addition, legacy parsing will not get any nodes added to
or after the 2.0.0 update, nor will its parser have any of its bugs patched, though bugs relating to reparsing and the special noun
may be patched, and redesigns to old nodes will be applied.
]]

