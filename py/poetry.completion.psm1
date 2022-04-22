
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

    $completions = @(switch ($command) {
            'poetry' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('-V', 'V', [CompletionResultType]::ParameterName, "Display the application's version")
                [CompletionResult]::new('--version', 'version', [CompletionResultType]::ParameterName, "Display the application's version")
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                # ? Commands
                [CompletionResult]::new('about', 'about', [CompletionResultType]::ParameterName, 'Shows information about Poetry.')
                [CompletionResult]::new('add', 'add', [CompletionResultType]::ParameterName, 'Adds a new dependency to pyproject.toml.')
                [CompletionResult]::new('build', 'build', [CompletionResultType]::ParameterName, 'Builds a package, as a tarball and a wheel by default.')
                [CompletionResult]::new('cache', 'cache', [CompletionResultType]::ParameterName, "Interact with Poetry's cache")
                [CompletionResult]::new('check', 'check', [CompletionResultType]::ParameterName, 'Checks the validity of the pyproject.toml file.')
                [CompletionResult]::new('config', 'config', [CompletionResultType]::ParameterName, 'Manages configuration settings.')
                [CompletionResult]::new('debug', 'debug', [CompletionResultType]::ParameterName, 'Debug various elements of Poetry.')
                [CompletionResult]::new('env', 'env', [CompletionResultType]::ParameterName, "Interact with Poetry's project environments.")
                [CompletionResult]::new('export', 'export', [CompletionResultType]::ParameterName, 'Exports the lock file to alternative formats.')
                [CompletionResult]::new('help', 'help', [CompletionResultType]::ParameterName, 'Display the manual of a command')
                [CompletionResult]::new('init', 'init', [CompletionResultType]::ParameterName, 'Creates a basic pyproject.toml file in the current directory.')
                [CompletionResult]::new('install', 'install', [CompletionResultType]::ParameterName, 'Installs the project dependencies.')
                [CompletionResult]::new('lock', 'lock', [CompletionResultType]::ParameterName, 'Locks the project dependencies.')
                [CompletionResult]::new('new', 'new', [CompletionResultType]::ParameterName, 'Creates a new Python project at <path>')
                [CompletionResult]::new('publish', 'publish', [CompletionResultType]::ParameterName, 'Publishes a package to a remote repository.')
                [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterName, 'Removes a package from the project dependencies.')
                [CompletionResult]::new('run', 'run', [CompletionResultType]::ParameterName, 'Runs a command in the appropriate environment.')
                [CompletionResult]::new('search', 'search', [CompletionResultType]::ParameterName, 'Searches for packages on remote repositories')
                [CompletionResult]::new('self', 'self', [CompletionResultType]::ParameterName, 'Interact with Poetry directly.')
                [CompletionResult]::new('shell', 'shell', [CompletionResultType]::ParameterName, 'Spawns a shell within the virtual environment.')
                [CompletionResult]::new('show', 'show', [CompletionResultType]::ParameterName, 'Shows information about packages.')
                [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterName, 'Update the dependencies according to the pyproject.toml file.')
                [CompletionResult]::new('version', 'version', [CompletionResultType]::ParameterName, 'Shows the version of the project of bumps it when a valid bump rule is provided.')
            }
            'poetry>about' {}
            'poetry>add' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('-D', 'D', [CompletionResultType]::ParameterName, 'Add as a development dependency.')
                [CompletionResult]::new('--dev', 'dev', [CompletionResultType]::ParameterName, 'Add as a development dependency.')
                [CompletionResult]::new('-E', 'E', [CompletionResultType]::ParameterName, 'Extras to activate for the dependency (multiple values allowed)')
                [CompletionResult]::new('--extras', 'extras', [CompletionResultType]::ParameterName, 'Extras to activate for the dependency. (multiple values allowed)')
                [CompletionResult]::new('--optional', 'optional', [CompletionResultType]::ParameterName, 'Add as an optional dependency.')
                [CompletionResult]::new('--python', 'python', [CompletionResultType]::ParameterName, 'Python version for which the dependency must be installed.')
                [CompletionResult]::new('--platform', 'platform', [CompletionResultType]::ParameterName, 'Platforms for which the dependency must be installed.')
                [CompletionResult]::new('--source', 'source', [CompletionResultType]::ParameterName, 'Name of the source to use to insall the package.')
                [CompletionResult]::new('--allow-prereleases', 'allow-prereleases', [CompletionResultType]::ParameterName, 'Accept prereleases.')
                [CompletionResult]::new('--dry-run', 'dry-run', [CompletionResultType]::ParameterName, 'Output the operations but do not execute anything (implicitly enables --verbose).')
                [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Do not perform operations (only update the lockfile).')
            }
            'poetry>build' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-v', 'v', [CompletionResultType]::ParameterName, 'Increase the verbosity of messages: "-v" for normal output')
                [CompletionResult]::new('-vv', 'vv', [CompletionResultType]::ParameterName, 'Increase the verbosity of messages: "-vv" for more verbose output')
                [CompletionResult]::new('-vvv', 'vvv', [CompletionResultType]::ParameterName, 'Increase the verbosity of messages: "-vvv" for debug')
                [CompletionResult]::new('--verbose', 'verbose', [CompletionResultType]::ParameterName, 'Increase the verbosity of messages: "-v" for normal output, "-vv" for more verbose output and "-vvv" for debug')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Limit the format to either sdist or wheel.')
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Limit the format to either sdist or wheel.')
            }
            'poetry>cache' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Commands
                [CompletionResult]::new('clear', 'clear', [CompletionResultType]::ParameterName, "Clears Poetry's cache.")
                [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterName, "List Poetry's caches.")
            }
            'poetry>cache>clear' {
                [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Clear all entries in the cache.')
            }
            'poetry>cache>list' {}
            'poetry>check' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
            }
            'poetry>debug' {}
            'poetry>env' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Commands
                [CompletionResult]::new('info', 'info', [CompletionResultType]::ParameterName, 'Displays information about the current environment.')
                [CompletionResult]::new('list', 'list', [CompletionResultType]::ParameterName, 'Lists all virtualenvs associated with the current project.')
                [CompletionResult]::new('remove', 'remove', [CompletionResultType]::ParameterName, 'Removes a specific virtualenv associated with the project.')
                [CompletionResult]::new('use', 'use', [CompletionResultType]::ParameterName, 'Activates or creates a new virtualenv for the current project.')
            }
            'poetry>env>info' {
                [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, "Only display the environment's path.")
                [CompletionResult]::new('--path', 'path', [CompletionResultType]::ParameterName, "Only display the environment's path")
            }
            'poetry>env>list' {
                [CompletionResult]::new('--full-path', 'full-path', [CompletionResultType]::ParameterName, 'Output the full paths of the virtualenvs.')
            }
            'poetry>export' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('-f', 'f', [CompletionResultType]::ParameterName, 'Format to export to. Currently, only requirements.txt is supported. (default: "requirements.txt")')
                [CompletionResult]::new('--format', 'format', [CompletionResultType]::ParameterName, 'Format to export to. Currently, only requirements.txt is supported. (default: "requirements.txt")')
                [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'The name of the output file.')
                [CompletionResult]::new('--output', 'output', [CompletionResultType]::ParameterName, 'The name of the output file.')
                [CompletionResult]::new('--without-hashes', 'without-hashes', [CompletionResultType]::ParameterName, 'Exclude hashes from the exported file.')
                [CompletionResult]::new('--dev', 'dev', [CompletionResultType]::ParameterName, 'Include development dependencies.')
                [CompletionResult]::new('-E', 'E', [CompletionResultType]::ParameterName, 'Extra sets of dependencies to include. (multiple values allowed)')
                [CompletionResult]::new('--extras', 'extras', [CompletionResultType]::ParameterName, 'Extra sets of dependencies to include. (multiple values allowed)')
                [CompletionResult]::new('--with-credentails', 'with-credentials', [CompletionResultType]::ParameterName, 'Include credentials for extra indices.')
            }
            'poetry>help' {}
            'poetry>init' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('--name', 'name', [CompletionResultType]::ParameterName, 'Name of the package.')
                [CompletionResult]::new('--description', 'description', [CompletionResultType]::ParameterName, 'Description of the package.')
                [CompletionResult]::new('--author', 'author', [CompletionResultType]::ParameterName, 'Author name of the package.')
                [CompletionResult]::new('--python', 'python', [CompletionResultType]::ParameterName, 'Compatible Python versions.')
                [CompletionResult]::new('--dependency', 'dependency', [CompletionResultType]::ParameterName, 'Package to require, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)')
                [CompletionResult]::new('--dev-dependency', 'dev-dependency', [CompletionResultType]::ParameterName, 'Package to require for development, with an optional version constraint, e.g. requests:^2.10.0 or requests=2.11.1. (multiple values allowed)')
                [CompletionResult]::new('-l', 'l', [CompletionResultType]::ParameterName, 'License of the package.')
                [CompletionResult]::new('--license', 'license', [CompletionResultType]::ParameterName, 'License of the package.')
            }
            'poetry>install' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('--no-dev', 'no-dev', [CompletionResultType]::ParameterName, 'Do not install the development dependencies.')
                [CompletionResult]::new('--no-root', 'no-root', [CompletionResultType]::ParameterName, 'Do not install the root package (the current project).')
                [CompletionResult]::new('--dry-run', 'dry-run', [CompletionResultType]::ParameterName, 'Output the operations but do not execute anything (implicitly enables --verbose).')
                [CompletionResult]::new('--remove-untracked', 'remove-untracked', [CompletionResultType]::ParameterName, 'Removes packages not present in the lock file.')
                [CompletionResult]::new('-E', 'E', [CompletionResultType]::ParameterName, 'Extra sets of dependencies to install. (multiple values allowed)')
                [CompletionResult]::new('--extras', 'extras', [CompletionResultType]::ParameterName, 'Extra sets of dependencies to install. (multiple values allowed)')
            }
            'poetry>lock' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('--no-update', 'no-update', [CompletionResultType]::ParameterName, 'Do not update locked versions, only refresh lock file.')
            }
            'poetry>new' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('--name', 'name', [CompletionResultType]::ParameterName, 'Set the resulting package name.')
                [CompletionResult]::new('--src', 'src', [CompletionResultType]::ParameterName, 'Use the src layout for the project.')
            }
            'poetry>publish' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('-r', 'r', [CompletionResultType]::ParameterName, 'The repository to publish the package to.')
                [CompletionResult]::new('--repository', 'repository', [CompletionResultType]::ParameterName, 'The repository to publish the package to.')
                [CompletionResult]::new('-u', 'u', [CompletionResultType]::ParameterName, 'The username to access the repository.')
                [CompletionResult]::new('--username', 'username', [CompletionResultType]::ParameterName, 'The username to access the repository.')
                [CompletionResult]::new('-p', 'p', [CompletionResultType]::ParameterName, 'The password to access the repository.')
                [CompletionResult]::new('--password', 'password', [CompletionResultType]::ParameterName, 'The password to access the repository.')
                [CompletionResult]::new('--cert', 'cert', [CompletionResultType]::ParameterName, 'Certificate authority to access the repository.')
                [CompletionResult]::new('--client-cert', 'client-cert', [CompletionResultType]::ParameterName, 'Client certificate to access the repository.')
                [CompletionResult]::new('--build', 'build', [CompletionResultType]::ParameterName, 'Build the package before publishing.')
                [CompletionResult]::new('--dry-run', 'dry-run', [CompletionResultType]::ParameterName, 'Perform all actions except upload the package.')
            }
            'poetry>remove' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('-D', 'D', [CompletionResultType]::ParameterName, 'Remove a package from the development dependencies.')
                [CompletionResult]::new('--dev', 'dev', [CompletionResultType]::ParameterName, 'Remove a package from the development dependencies.')
                [CompletionResult]::new('--dry-run', 'dry-run', [CompletionResultType]::ParameterName, 'Output the operations but do not execute anything (implicitly enables --verbose).')
            }
            'poetry>run' {}
            'poetry>search' {}
            'poetry>self' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Commands
                [CompletionResult]::new('update', 'update', [CompletionResultType]::ParameterName, 'Updates Poetry to the latest version.')
            }
            'poetry>shell' {}
            'poetry>show' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                # ? Options
                [CompletionResult]::new('--no-dev', 'no-dev', [CompletionResultType]::ParameterName, 'Do not list the development dependencies.')
                [CompletionResult]::new('-t', 't', [CompletionResultType]::ParameterName, 'List the dependencies as a tree.')
                [CompletionResult]::new('--tree', 'tree', [CompletionResultType]::ParameterName, 'List the dependencies as a tree.')
                [CompletionResult]::new('-l', 'l', [CompletionResultType]::ParameterName, 'Show the latest version.')
                [CompletionResult]::new('--latest', 'latest', [CompletionResultType]::ParameterName, 'Show the latest version.')
                [CompletionResult]::new('-o', 'o', [CompletionResultType]::ParameterName, 'Show the latest version but only for packages that are outdated.')
                [CompletionResult]::new('--outdated', 'outdated', [CompletionResultType]::ParameterName, 'Show the latest version but only for packages that are outdated.')
                [CompletionResult]::new('-a', 'a', [CompletionResultType]::ParameterName, 'Show all packages (even those not compatible with current system).')
                [CompletionResult]::new('--all', 'all', [CompletionResultType]::ParameterName, 'Show all packages (even those not compatible with current system).')
            }
            'poetry>update' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                [CompletionResult]::new('-q', 'q', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('--quiet', 'quiet', [CompletionResultType]::ParameterName, 'Do not output any message')
                [CompletionResult]::new('-n', 'n', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                [CompletionResult]::new('--no-interaction', 'no-interaction', [CompletionResultType]::ParameterName, 'Do not ask any interactive question')
                # ? Options
                [CompletionResult]::new('--no-dev', 'no-dev', [CompletionResultType]::ParameterName, 'Do not update the development dependencies.')
                [CompletionResult]::new('--dry-run', 'dry-run', [CompletionResultType]::ParameterName, 'Output the operations but do not execute anything (implicitly enables --verbose).')
                [CompletionResult]::new('--lock', 'lock', [CompletionResultType]::ParameterName, 'Do not perform operations (only update the lockfile).')
            }
            'poetry>version' {
                # ? Global Options
                [CompletionResult]::new('-h', 'h', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--help', 'help', [CompletionResultType]::ParameterName, 'Display the help message')
                [CompletionResult]::new('--ansi', 'ansi', [CompletionResultType]::ParameterName, 'Force ANSI output')
                [CompletionResult]::new('--no-ansi', 'no-ansi', [CompletionResultType]::ParameterName, 'Disable ANSI output')
                # ? Options
                [CompletionResult]::new('-s', 's', [CompletionResultType]::ParameterName, 'Output the version number only')
                [CompletionResult]::new('--short', 'short', [CompletionResultType]::ParameterName, 'Output the version number only')
            }
            'poetry>config' {
                [CompletionResult]::new('cache-dir', 'cache-dir', [CompletionResultType]::ParameterName, 'The path to the cache directory used by Poetry')
                [CompletionResult]::new('installer.parallel', 'installer.parallel', [CompletionResultType]::ParameterName, 'Use parallel execution when using the new (>=1.1.0) installer. Defaults to true.')
                [CompletionResult]::new('virtualenvs.create', 'virtualenvs.create', [CompletionResultType]::ParameterName, "Create a new virtual environment if one doesn't already exist. Defaults to true.")
                [CompletionResult]::new('virtualenvs.in-project', 'virtualenvs.in-project', [CompletionResultType]::ParameterName, "Create the virtualenv inside the project's root directory. Defaults to None.")
                [CompletionResult]::new('virtualenvs.path', 'virtualenvs.path', [CompletionResultType]::ParameterName, 'Directory where virtual environments will be created. Defaults to {cache-dir}/virtualenvs ({cache-dir}\virtualenvs on Windows).')
                [CompletionResult]::new('repositories.', 'repositories.', [CompletionResultType]::ParameterName, 'Set a new alternative repository. See Repositories for more information.')
            }
            'poetry>config>installer.parallel' {
                [CompletionResult]::new('true', 'true', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('false', 'false', [CompletionResultType]::ParameterName, '')
            }
            'poetry>config>virtualenvs.create' {
                [CompletionResult]::new('true', 'true', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('false', 'false', [CompletionResultType]::ParameterName, '')
            }
            'poetry>config>virtualenvs.in-project' {
                [CompletionResult]::new('true', 'true', [CompletionResultType]::ParameterName, '')
                [CompletionResult]::new('false', 'false', [CompletionResultType]::ParameterName, '')
            }
        })
    $completions.Where{ $_.CompletionText -like "$WordToComplete*" } |
    Sort-Object -Property ListItemText
}
# [CompletionResult]::new('', '', [CompletionResultType]::ParameterName, '')