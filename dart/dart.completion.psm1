
Register-ArgumentCompleter -Native -CommandName 'poetry' -ScriptBlock {
    param($WordToComplete, $CommandAST, $CursorPosition)

    $commandElements = $CommandAST.commandElements
    $command = @(
        'poetry'
        for ($i = 1; $i -lt $commandElements.Count; $i++) {
            $element = $commandElements[$i]
            if ($element -isnot [StringConstantExpressionAst] -or
                $element.StringConstantType -ne [StringConstantType]::BareWord -or
                $element.Value.StartsWith('-') -or
                $element.Value -eq $WordToComplete) {
                break
            }
            $element.Value
        }) -join '>'
    
    $compile = "dart>compile"
    $pub = 'dart>pub'

    $completions = @(switch ($command) {
            #! Dart Commands
            'dart' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('--enable-analytics', 'enable-analytics', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('--disable-analytics', 'disable-analytics', [CompletionResultType]::ParameterName, '')
                # ? Commands
                [CompletionResult]::new('analyze', 'analyze', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('compile', 'compile', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('create', 'create', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('devtools', 'devtools', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('doc', 'doc', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('fix', 'fix', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('format', 'format', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('migrate', 'migrate', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('pub', 'pub', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('test', 'test', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterName, '')
            }
            'dart>analyze' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>compile' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                # ? Commands
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>create' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                # ? Templates
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>devtools' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>doc' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>fix' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>format' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>migrate' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                # ? Web Interface Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                # ? Additional Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>pub' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                # ? Commands
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            'dart>run' {
                # ? Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                # ? Debugging Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                # ? Options implied by --observe are currently
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                # ? Other Debugging Options
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')
            }
            #! Dart Compiler
            "$compile>aot-snapshot" {}
            "$compile>exe" {}
            "$compile>jit-snapshot" {}
            "$compile>js" {}
            "$compile>kernel" {}
            #! Pub Package Manager
            "$pub>add" {}
            "$pub>cache" {}
            "$pub>deps" {}
            "$pub>downgrade" {}
            "$pub>get" {}
            "$pub>global" {}
            "$pub>login" {}
            "$pub>logout" {}
            "$pub>outdated" {}
            "$pub>publish" {}
            "$pub>remove" {}
            "$pub>token" {}
            "$pub>upgrade" {}
            "$pub>uploader" {}
        })
    $completions.Where{ $_.CompletionText -like "$WordToComplete*" } |
    Sort-Object -Property ListItemText
}
# [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')