function __fish_mach_complete_no_command
    for i in (commandline -opc)
        if contains -- $i addtest android android-emulator artifact awsy-test bootstrap browsertime build build-backend buildsymbols busted cargo check-spidermonkey clang-format clobber compare-locales compileflags configure cppunittest cramtest crashtest create-mach-environment devtools-css-db doc doctor environment eslint fetch-condprofile file-info firefox-ui-functional fluent-migration-test geckodriver geckodriver-test geckoview-junit gradle gradle-install gtest hazards ide import-pr install install-moz-phab jit-test jsapi-tests jsshell-bench jstestbrowser jstests lint logspam mach-commands mach-completion mach-debug-commands marionette-test mochitest mozbuild-reference mozharness mozregression node npm package package-multi-locale pastebin perftest perftest-test power prettier-format puppeteer-test python python-test raptor raptor-test reftest release release-history remote repackage resource-usage run run-condprofile rusttests settings show-log static-analysis talos-test taskcluster-build-image taskcluster-load-image taskgraph telemetry-tests-client test test-info tps-build try valgrind-test vcs-setup vendor visualmetrics warnings-list warnings-summary watch web-platform-tests web-platform-tests-update webidl-example webidl-parser-test wpt wpt-manifest-update wpt-metadata-merge wpt-metadata-summary wpt-serve wpt-test-paths wpt-unittest wpt-update xpcshell-test
            return 1
        end
    end
    return 0
end

function __fish_mach_complete_command_matches
    for i in (commandline -opc)
        if contains -- $i addtest android android-emulator artifact awsy-test bootstrap browsertime build build-backend buildsymbols busted cargo check-spidermonkey clang-format clobber compare-locales compileflags configure cppunittest cramtest crashtest create-mach-environment devtools-css-db doc doctor environment eslint fetch-condprofile file-info firefox-ui-functional fluent-migration-test geckodriver geckodriver-test geckoview-junit gradle gradle-install gtest hazards ide import-pr install install-moz-phab jit-test jsapi-tests jsshell-bench jstestbrowser jstests lint logspam mach-commands mach-completion mach-debug-commands marionette-test mochitest mozbuild-reference mozharness mozregression node npm package package-multi-locale pastebin perftest perftest-test power prettier-format puppeteer-test python python-test raptor raptor-test reftest release release-history remote repackage resource-usage run run-condprofile rusttests settings show-log static-analysis talos-test taskcluster-build-image taskcluster-load-image taskgraph telemetry-tests-client test test-info tps-build try valgrind-test vcs-setup vendor visualmetrics warnings-list warnings-summary watch web-platform-tests web-platform-tests-update webidl-example webidl-parser-test wpt wpt-manifest-update wpt-metadata-merge wpt-metadata-summary wpt-serve wpt-test-paths wpt-unittest wpt-update xpcshell-test
            set com $i
            break
        end
    end

    if not set -q com
        return 1
    end

    if test "$com" != "$argv"
        return 1
    end
    return 0
end

function __fish_mach_complete_command
    __fish_mach_complete_command_matches $argv[1]
    if test $status -ne 0
        return 1
    end

    # If a subcommand is already entered, don't complete, we should defer to
    # '__fish_mach_complete_subcommand'.
    for i in (commandline -opc)
        if contains -- $i $argv[2..-1]
            return 1
        end
    end
    return 0
end

function __fish_mach_complete_subcommand
    __fish_mach_complete_command_matches $argv[1]
    if test $status -ne 0
        return 1
    end

    # Command matches, now check for subcommand
    for i in (commandline -opc)
        if contains -- $i $argv[2]
            return 0
        end
    end
    return 1
end

# global options
complete -c mach -n '__fish_mach_complete_no_command' -d 'Print verbose output.' -s v -l verbose
complete -c mach -n '__fish_mach_complete_no_command' -d 'Filename to write log data to.' -s l -l log-file
complete -c mach -n '__fish_mach_complete_no_command' -d 'Prefix log line with interval from last message rather than relative time. Note that this is NOT execution time if there are parallel operations.' -l log-interval
complete -c mach -n '__fish_mach_complete_no_command' -d 'Do not prefix log lines with times. By default, mach will prefix each output line with the time since command start.' -l log-no-times
complete -c mach -n '__fish_mach_complete_no_command' -d 'Show this help message.' -s h -l help
complete -c mach -n '__fish_mach_complete_no_command' -d 'Start a Python debugger when command is dispatched.' -l debug-command
complete -c mach -n '__fish_mach_complete_no_command' -d 'Path to settings file.' -l settings
# commands
complete -c mach -f -n '__fish_mach_complete_no_command' -a addtest -d 'Generate tests based on templates'
complete -c mach -f -n '__fish_mach_complete_no_command' -a android -d 'Run Android-specific commands.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a android-emulator -d 'Run the Android emulator with an AVD from test automation. Environment variable MOZ_EMULATOR_COMMAND_ARGS, if present, will over-ride the command line arguments used to launch the emulator.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a artifact -d 'Use pre-built artifacts to build Firefox.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a awsy-test -d 'Run Are We Slim Yet (AWSY) memory usage testing using marionette.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a bootstrap -d 'Install required system packages for building.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a browsertime -d 'Run [browsertime](https://github.com/sitespeedio/browsertime) performance tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a build -d 'Build the tree.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a build-backend -d 'Generate a backend used to build the tree.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a buildsymbols -d 'Produce a package of Breakpad-format symbols.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a busted -d 'Query known bugs in our tooling, and file new ones.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a cargo -d 'Invoke cargo in useful ways.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a check-spidermonkey -d 'Run SpiderMonkey tests (JavaScript engine).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a clang-format -d 'Run clang-format on current changes'
complete -c mach -f -n '__fish_mach_complete_no_command' -a clobber -d 'Clobber the tree (delete the object directory).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a compare-locales -d 'Run source checks on a localization.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a compileflags -d 'Display the compilation flags for a given source file'
complete -c mach -f -n '__fish_mach_complete_no_command' -a configure -d 'Configure the tree (run configure and config.status).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a cppunittest -d 'Run cpp unit tests (C++ tests).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a cramtest -d 'Mercurial style .t tests for command line applications.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a crashtest -d 'Run crashtests (Check if crashes on a page).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a create-mach-environment -d 'Create the `mach` virtualenvs. If executed with python3 (the default when entering from `mach`), create both a python3 and python2.7 virtualenv. If executed with python2, only create the python2.7 virtualenv.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a devtools-css-db -d 'Rebuild the devtool\'s static css properties database.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a doc -d 'Generate and serve documentation from the tree.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a doctor -d ''
complete -c mach -f -n '__fish_mach_complete_no_command' -a environment -d 'Show info about the mach and build environment.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a eslint -d 'Run eslint or help configure eslint for optimal development.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a fetch-condprofile -d ''
complete -c mach -f -n '__fish_mach_complete_no_command' -a file-info -d 'Query for metadata about files.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a firefox-ui-functional -d 'Run the functional test suite of Firefox UI tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a fluent-migration-test -d 'Test Fluent migration recipes.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a geckodriver -d 'Run the WebDriver implementation for Gecko.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a geckodriver-test -d 'Run geckodriver unit tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a geckoview-junit -d 'Run remote geckoview junit tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a gradle -d 'Run gradle.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a gradle-install -d ''
complete -c mach -f -n '__fish_mach_complete_no_command' -a gtest -d 'Run GTest unit tests (C++ tests).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a hazards -d 'Commands for running the static analysis for GC rooting hazards'
complete -c mach -f -n '__fish_mach_complete_no_command' -a ide -d 'Generate a project and launch an IDE.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a import-pr -d 'Import a pull request from Github to the local repo.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a install -d 'Install the package on the machine (or device in the case of Android).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a install-moz-phab -d 'Install patch submission tool.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a jit-test -d 'Run SpiderMonkey jit-tests in the JS shell.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a jsapi-tests -d 'Run SpiderMonkey JSAPI tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a jsshell-bench -d 'Run benchmarks in the SpiderMonkey JS shell.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a jstestbrowser -d 'Run js/src/tests in the browser.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a jstests -d 'Run SpiderMonkey JS tests in the JS shell.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a lint -d 'Run linters.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a logspam -d 'Warning categorizer for treeherder test runs.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a mach-commands -d 'List all mach commands.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a mach-completion -d 'Prints a list of completion strings for the specified command.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a mach-debug-commands -d 'Show info about available mach commands.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a marionette-test -d 'Remote control protocol to Gecko, used for browser automation.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a mochitest -d 'Run any flavor of mochitest (integration test).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a mozbuild-reference -d 'View reference documentation on mozbuild files.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a mozharness -d 'Run tests using mozharness.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a mozregression -d 'Regression range finder for nightly and inbound builds.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a node -d 'Run the NodeJS interpreter used for building.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a npm -d 'Run the npm executable from the NodeJS used for building.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a package -d 'Package the built product for distribution as an APK, DMG, etc.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a package-multi-locale -d 'Package a multi-locale version of the built product for distribution as an APK, DMG, etc.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a pastebin -d '
Command line interface to paste.mozilla.org.

Takes either a filename whose content should be pasted, or reads
content from standard input. If a highlighter is specified it will
be used, otherwise the file name will be used to determine an
appropriate highlighter.
'
complete -c mach -f -n '__fish_mach_complete_no_command' -a perftest -d 'Run any flavor of perftest'
complete -c mach -f -n '__fish_mach_complete_no_command' -a perftest-test -d 'Run perftest tests'
complete -c mach -f -n '__fish_mach_complete_no_command' -a power -d 'Get system power consumption and related measurements for all running browsers. Available only on Mac OS X 10.10 and above. Requires root access.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a prettier-format -d 'Run prettier on current changes'
complete -c mach -f -n '__fish_mach_complete_no_command' -a puppeteer-test -d 'Run Puppeteer unit tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a python -d 'Run Python.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a python-test -d 'Run Python unit tests with pytest.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a raptor -d 'Run Raptor performance tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a raptor-test -d 'Run Raptor performance tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a reftest -d 'Run reftests (layout and graphics correctness).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a release -d 'Task that are part of the release process.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a release-history -d 'Query balrog for release history used by enable partials generation'
complete -c mach -f -n '__fish_mach_complete_no_command' -a remote -d 'Remote protocol related operations.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a repackage -d 'Repackage artifacts into different formats.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a resource-usage -d 'Show information about system resource usage for a build.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a run -d 'Run the compiled program, possibly under a debugger or DMD.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a run-condprofile -d ''
complete -c mach -f -n '__fish_mach_complete_no_command' -a rusttests -d 'Run rust unit tests (via cargo test).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a settings -d 'Show available config settings.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a show-log -d 'Display mach logs'
complete -c mach -f -n '__fish_mach_complete_no_command' -a static-analysis -d 'Run C++ static analysis checks'
complete -c mach -f -n '__fish_mach_complete_no_command' -a talos-test -d 'Run talos tests (performance testing).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a taskcluster-build-image -d 'Build a Docker image'
complete -c mach -f -n '__fish_mach_complete_no_command' -a taskcluster-load-image -d 'Load a pre-built Docker image. Note that you need to have docker installed and running for this to work.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a taskgraph -d 'Manipulate TaskCluster task graphs defined in-tree'
complete -c mach -f -n '__fish_mach_complete_no_command' -a telemetry-tests-client -d 'Run tests specifically for the Telemetry client'
complete -c mach -f -n '__fish_mach_complete_no_command' -a test -d 'Run tests (detects the kind of test and runs it).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a test-info -d 'Display historical test results.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a tps-build -d 'Build TPS add-on.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a try -d 'Push selected tasks to the try server'
complete -c mach -f -n '__fish_mach_complete_no_command' -a valgrind-test -d 'Run the Valgrind test job (memory-related errors).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a vcs-setup -d 'Help configure a VCS for optimal development.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a vendor -d 'Vendor third-party dependencies into the source repository.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a visualmetrics -d 'Run visualmetrics.py'
complete -c mach -f -n '__fish_mach_complete_no_command' -a warnings-list -d 'Show a list of compiler warnings.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a warnings-summary -d 'Show a summary of compiler warnings.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a watch -d 'Watch and re-build the tree.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a web-platform-tests -d 'Run web-platform-tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a web-platform-tests-update -d 'Update web-platform-test metadata.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a webidl-example -d 'Generate example files for a WebIDL interface.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a webidl-parser-test -d 'Run WebIDL tests (Interface Browser parser).'
complete -c mach -f -n '__fish_mach_complete_no_command' -a wpt -d 'Run web-platform-tests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a wpt-manifest-update -d 'Update web-platform-test manifests.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a wpt-metadata-merge -d ''
complete -c mach -f -n '__fish_mach_complete_no_command' -a wpt-metadata-summary -d 'Create a json summary of the wpt metadata'
complete -c mach -f -n '__fish_mach_complete_no_command' -a wpt-serve -d 'Run the wpt server'
complete -c mach -f -n '__fish_mach_complete_no_command' -a wpt-test-paths -d 'Get a mapping from test ids to files'
complete -c mach -f -n '__fish_mach_complete_no_command' -a wpt-unittest -d 'Run the wpt tools and wptrunner unit tests'
complete -c mach -f -n '__fish_mach_complete_no_command' -a wpt-update -d 'Update web-platform-test metadata.'
complete -c mach -f -n '__fish_mach_complete_no_command' -a xpcshell-test -d 'Run XPCOM Shell tests (API direct unit testing)'
# command options
# addtest
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'suite for the test. If you pass a `test` argument this will be determined based on the filename and the folder it is in' -l suite
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'Overwrite an existing file if it exists.' -s o -l overwrite
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'Document type for the test (if applicable).If you pass a `test` argument this will be determined based on the filename.' -l doc
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'Open the created file(s) in an editor; if a binary is supplied it will be used otherwise the default editor for your environment will be opened' -s e -l editor
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'Test should be given a long timeout (typically 60s rather than 10s, but varies depending on environment)' -l long-timeout
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'Path to the reference file' -s m -l reference
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'Create a mismatch reftest' -l mismatch
complete -c mach -A -n '__fish_mach_complete_command addtest ' -d 'Create a reftest that waits until takeScreenshot() is called' -l wait

# android
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Run Android api-lint.
REMOVED/DEPRECATED: Use \'mach lint --linter android-api-lint\'.' -a api-lint
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Create GeckoView archives.
        See http://firefox-source-docs.mozilla.org/build/buildsystem/toolchains.html#firefox-for-android-with-gradle' -a archive-geckoview
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Assemble Firefox for Android.
        See http://firefox-source-docs.mozilla.org/build/buildsystem/toolchains.html#firefox-for-android-with-gradle' -a assemble-app
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Build geckoview_example ' -a build-geckoview_example
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Run Android checkstyle.
REMOVED/DEPRECATED: Use \'mach lint --linter android-checkstyle\'.' -a checkstyle
complete -c mach -A -n '__fish_mach_complete_subcommand android geckoview-docs' -d 'Generate a javadoc archive.' -l archive
complete -c mach -A -n '__fish_mach_complete_subcommand android geckoview-docs' -d 'Upload geckoview documentation to Github, using the specified USER/REPO.' -l upload
complete -c mach -A -n '__fish_mach_complete_subcommand android geckoview-docs' -d 'Use the specified branch/path for documentation commits.' -l upload-branch
complete -c mach -A -n '__fish_mach_complete_subcommand android geckoview-docs' -d 'Use the specified path for javadoc commits.' -l javadoc-path
complete -c mach -A -n '__fish_mach_complete_subcommand android geckoview-docs' -d 'Use the specified message for commits.' -l upload-message
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Create GeckoView javadoc and optionally upload to Github' -a geckoview-docs
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Generate GeckoView JNI wrappers used when building GeckoView.' -a generate-generated-jni-wrappers
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Generate SDK bindings used when building GeckoView.' -a generate-sdk-bindings
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Collect Android Gradle dependencies.
        See http://firefox-source-docs.mozilla.org/build/buildsystem/toolchains.html#firefox-for-android-with-gradle' -a gradle-dependencies
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Install geckoview_example ' -a install-geckoview_example
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Run Android lint.
REMOVED/DEPRECATED: Use \'mach lint --linter android-lint\'.' -a lint
complete -c mach -A -n '__fish_mach_complete_command android api-lint archive-geckoview assemble-app build-geckoview_example checkstyle geckoview-docs generate-generated-jni-wrappers generate-sdk-bindings gradle-dependencies install-geckoview_example lint test' -d 'Run Android test.
REMOVED/DEPRECATED: Use \'mach lint --linter android-test\'.' -a test

# android-emulator
complete -c mach -A -n '__fish_mach_complete_command android-emulator ' -d 'Specify which AVD to run in emulator. One of "arm-4.3" (Android 4.3 supporting armv7 binaries), or "x86-7.0" (Android 7.0 supporting x86 or x86_64 binaries, recommended for most applications). By default, "arm-4.3" will be used if the current build environment architecture is arm; otherwise "x86-7.0".' -l version
complete -c mach -A -n '__fish_mach_complete_command android-emulator ' -d 'Wait for emulator to be closed.' -l wait
complete -c mach -A -n '__fish_mach_complete_command android-emulator ' -d 'Update AVD definition even when AVD is already installed.' -l force-update
complete -c mach -A -n '__fish_mach_complete_command android-emulator ' -d 'Over-ride the emulator -gpu argument.' -l gpu
complete -c mach -A -n '__fish_mach_complete_command android-emulator ' -d 'Log informative status messages.' -l verbose

# artifact
complete -c mach -A -n '__fish_mach_complete_subcommand artifact clear-cache' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand artifact clear-cache' -d 'Build job.' -l job
complete -c mach -A -n '__fish_mach_complete_subcommand artifact clear-cache' -d 'Firefox tree.' -l tree
complete -c mach -A -n '__fish_mach_complete_command artifact clear-cache install toolchain' -d 'Delete local artifacts and reset local artifact cache.' -a clear-cache
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Build job.' -l job
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Firefox tree.' -l tree
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Skip all local caches to force re-fetching remote artifacts.' -l skip-cache
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Don\'t install tests.' -l no-tests
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Download symbols.' -l symbols
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Download host binaries.' -l host-bins
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Where to install artifacts to.' -l distdir
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Don\'t process (unpack) artifact packages, just download them.' -l no-process
complete -c mach -A -n '__fish_mach_complete_subcommand artifact install' -d 'Download Maven zip (Android-only).' -l maven-zip
complete -c mach -A -n '__fish_mach_complete_command artifact clear-cache install toolchain' -d 'Install a good pre-built artifact.' -a install
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Directory where to store the artifacts cache' -l cache-dir
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Skip all local caches to force re-fetching remote artifacts.' -l skip-cache
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Download toolchains resulting from the given build(s); BUILD is a name of a toolchain task, e.g. linux64-clang' -l from-build
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Explicit tooltool manifest to process' -l tooltool-manifest
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Use the RelengAPI token found in the given file to authenticate' -l authentication-file
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Do not unpack any downloaded file' -l no-unpack
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Number of times to retry failed downloads' -l retry
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Whether this is being called from bootstrap. This verifies the toolchain is annotated as a toolchain used for local development.' -l bootstrap
complete -c mach -A -n '__fish_mach_complete_subcommand artifact toolchain' -d 'Store a manifest about the downloaded taskcluster artifacts' -l artifact-manifest
complete -c mach -A -n '__fish_mach_complete_command artifact clear-cache install toolchain' -d '' -a toolchain

# awsy-test
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Path to web server root directory. If not specified, defaults to topobjdir/_tests/awsy/html.' -l web-root
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Path to page manifest text file containing a list of urls to test. The urls must be served from localhost. If not specified, defaults to page_load_test/tp5n/tp5n.manifest under the web root.' -l page-manifest
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Path to results directory. If not specified, defaults to the parent directory of the web root.' -l results
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Set --entities=3, --iterations=1, --per-tab-pause=1, --settle-wait-time=1 for a quick test. Overrides any explicit argument settings.' -l quick
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Number of urls to load. Defaults to the total number of urls.' -l entities
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Maximum number of tabs to open. Defaults to 30.' -l max-tabs
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Number of times to run through the test suite. Defaults to 5.' -l iterations
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Seconds to wait in between opening tabs. Defaults to 10.' -l per-tab-pause
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Seconds to wait for things to settled down. Defaults to 30.' -l settle-wait-time
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Enable DMD during testing. Requires a DMD-enabled build.' -l dmd
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Use the tp6 pageset during testing.' -l tp6
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'path to gecko executable to launch before running the test' -l binary
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'host:port of running Gecko instance to connect to' -l address
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'If no --address is given, then the harness will launch an emulator. (See Remote options group.) If --address is given, then the harness assumes you are running an emulator already, and will launch gecko app on that emulator.' -l emulator
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'application to use. see marionette_driver.geckoinstance' -l app
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'specify a command line argument to be passed onto the application' -l app-arg
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'profile to use when launching the gecko process. If not passed, then a profile will be constructed and used' -l profile
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'set a browser preference; repeat for multiple preferences.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'read preferences from a JSON or INI file. For INI, use \'file.ini:section\' to specify a particular section.' -l preferences
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'addon to install; repeat for multiple addons.' -l addon
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'number of times to repeat the test(s)' -l repeat
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Run tests repeatedly and stop on the first time a test fails. Default cap is 30 runs, which can be overwritten with the --repeat parameter.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'path to a json file with any test data required' -l testvars
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'absolute path to directory containing breakpad symbols, or the url of a zip file containing symbols' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Set the global timeout for marionette socket operations. Default: %(default)ss.' -l socket-timeout
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'the max number of seconds to wait for a Marionette connection after launching a binary. Default: %(default)ss.' -l startup-timeout
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'run tests in a random order' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Use given seed to shuffle tests' -l shuffle-seed
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'how many chunks to split the tests up into' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'which chunk to run' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'url to a webserver or path to a document root from which content resources are served (default: /Users/johann/Development/mozilla-central/testing/marionette/harness/marionette_harness/www).' -l server-root
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Define the path to store log file. If the path is a directory, the real log file will be created given the format gecko-(timestamp).log. If it is a file, if will be used directly. \'-\' may be passed to write to stdout. Default: \'./gecko.log\'' -l gecko-log
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Define the name to associate with the logger used' -l logger-name
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Enable the jsdebugger for marionette javascript.' -l jsdebugger
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Enable python post-mortem debugger when a test fails. Pass in the debugger you want to use, eg pdb or ipdb.' -l pydebugger
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Enable Fission (site isolation) in Gecko.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Run tests in headless mode.' -s z -l headless
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Filter out tests that don\'t have the given tag. Can be used multiple times in which case the test must contain at least one of the given tags.' -l tag
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Path to directory for Marionette output. (Default: .) (Default profile dest: TMP)' -l workspace
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Increase verbosity to include debug messages with -v, and trace messages with -vv.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Path to emulator binary. By default mozrunner uses `which emulator`' -l emulator-binary
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Path to the adb. By default mozrunner uses `which adb`' -l adb
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Name of an AVD available in your environment.See mozrunner.FennecEmulatorRunner' -l avd
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Path to avd parent directory' -l avd-home
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Serial ID to connect to as seen in `adb devices`,e.g emulator-5444' -l device
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Name of Android package, e.g. org.mozilla.fennec' -l package
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command awsy-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# bootstrap
complete -c mach -A -n '__fish_mach_complete_command bootstrap ' -d 'Pass in an application choice instead of using the default interactive prompt.' -l application-choice
complete -c mach -A -n '__fish_mach_complete_command bootstrap ' -d 'Answer yes to any (Y/n) interactive prompts.' -l no-interactive
complete -c mach -A -n '__fish_mach_complete_command bootstrap ' -d 'Only execute actions that leave the system configuration alone.' -l no-system-changes

# browsertime
complete -c mach -A -n '__fish_mach_complete_command browsertime ' -d 'Verbose output for what commands the build is running.' -l verbose
complete -c mach -A -n '__fish_mach_complete_command browsertime ' -d '' -l update-upstream-url
complete -c mach -A -n '__fish_mach_complete_command browsertime ' -d '' -l setup
complete -c mach -A -n '__fish_mach_complete_command browsertime ' -d '' -l clobber
complete -c mach -A -n '__fish_mach_complete_command browsertime ' -d 'Skip all local caches to force re-fetching remote artifacts.' -l skip-cache
complete -c mach -A -n '__fish_mach_complete_command browsertime ' -d '' -l check
complete -c mach -A -n '__fish_mach_complete_command browsertime ' -d 'Show the browsertime help message.' -l browsertime-help

# build
complete -c mach -A -n '__fish_mach_complete_command build ' -d 'Number of concurrent jobs to run. Default is the number of CPUs.' -l jobs -s j
complete -c mach -A -n '__fish_mach_complete_command build ' -d 'Change to a subdirectory of the build directory first.' -s C -l directory
complete -c mach -A -n '__fish_mach_complete_command build ' -d 'Verbose output for what commands the build is running.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command build ' -d 'Keep building after an error has occurred' -l keep-going

# build-backend
complete -c mach -A -n '__fish_mach_complete_command build-backend ' -d 'Show a diff of changes.' -s d -l diff
complete -c mach -A -n '__fish_mach_complete_command build-backend ' -d 'Which backend to build.' -s b -l backend
complete -c mach -A -n '__fish_mach_complete_command build-backend ' -d 'Verbose output.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command build-backend ' -d 'Do everything except writing files out.' -s n -l dry-run

# buildsymbols

# busted
complete -c mach -A -n '__fish_mach_complete_command busted file' -d 'File a bug for busted tooling.' -a file

# cargo
complete -c mach -A -n '__fish_mach_complete_subcommand cargo check' -d 'Check all of the crates in the tree.' -l all-crates
complete -c mach -A -n '__fish_mach_complete_subcommand cargo check' -d 'Run the tests in parallel using multiple processes.' -l jobs -s j
complete -c mach -A -n '__fish_mach_complete_subcommand cargo check' -d 'Verbose output.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command cargo check' -d 'Run `cargo check` on a given crate.  Defaults to gkrust.' -a check

# check-spidermonkey
complete -c mach -A -n '__fish_mach_complete_command check-spidermonkey ' -d 'Run jit-test suite with valgrind flag' -l valgrind

# clang-format
complete -c mach -A -n '__fish_mach_complete_command clang-format ' -d 'Show diff output on stdout instead of applying changes' -l show -s s
complete -c mach -A -n '__fish_mach_complete_command clang-format ' -d 'This option is usually used in the context of hg-formatsource.When reading from stdin, clang-format assumes this filename to look for a style config file (with -style=file) and to determine the language. When specifying this option only one file should be used as an input and the output will be forwarded to stdin. This option also impairs the download of the clang-tools and assumes the package is already located in it\'s default location' -l assume-filename -s a
complete -c mach -A -n '__fish_mach_complete_command clang-format ' -d 'Specify the path(s) to reformat' -l path -s p
complete -c mach -A -n '__fish_mach_complete_command clang-format ' -d 'Specify a commit to reformat from. For git you can also pass a range of commits (foo..bar) to format all of them at the same time.' -l commit -s c
complete -c mach -A -n '__fish_mach_complete_command clang-format ' -d 'Specify a file handle to write clang-format raw output instead of applying changes. This can be stdout or a file path.' -l output -s o
complete -c mach -A -n '__fish_mach_complete_command clang-format ' -d 'Specify the output format used: diff is the raw patch provided by clang-format, json is a list of atomic changes to process.' -l format -s f
complete -c mach -A -n '__fish_mach_complete_command clang-format ' -d 'Run clang-format on outgoing files from mercurial repository.' -l outgoing

# clobber
complete -c mach -A -n '__fish_mach_complete_command clobber ' -d 'Perform a full clobber' -l full

# compare-locales
complete -c mach -A -n '__fish_mach_complete_command compare-locales ' -d 'Show less data.
Specified once, don\'t show obsolete entities. Specified twice, also hide
missing entities. Specify thrice to exclude warnings and four times to
just show stats' -s q -l quiet
complete -c mach -A -n '__fish_mach_complete_command compare-locales ' -d 'Use this directory to stage merged files' -s m -l merge
complete -c mach -A -n '__fish_mach_complete_command compare-locales ' -d 'Run compare-locales against reference' -l validate
complete -c mach -A -n '__fish_mach_complete_command compare-locales ' -d 'Serialize to JSON. Value is the name of
the output file, pass "-" to serialize to stdout and hide the default output.
' -l json
complete -c mach -A -n '__fish_mach_complete_command compare-locales ' -d 'Overwrite variables in TOML files' -s D
complete -c mach -A -n '__fish_mach_complete_command compare-locales ' -d 'Compare projects that are disabled' -l full
complete -c mach -A -n '__fish_mach_complete_command compare-locales ' -d 'Return 0 regardless of l10n status' -l return-zero

# compileflags

# configure

# cppunittest
complete -c mach -A -n '__fish_mach_complete_command cppunittest ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender

# cramtest

# crashtest
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'absolute path to directory containing XRE (probably xulrunner)' -l xre-path
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'absolute path to directory containing breakpad symbols, or the URL of a zip file containing symbols' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'use the given debugger to launch the application' -l debugger
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'pass the given args to the debugger _before_ the application on the command line' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'prevents the test harness from redirecting stdout and stderr for interactive debuggers' -l debugger-interactive
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'absolute path to application, overriding default' -l appname
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'copy specified files/dirs to testing profile' -l extra-profile-file
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'reftest will timeout in specified number of seconds. [default %(default)s].' -l timeout
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'fail if the number of bytes leaked in default processes through refcounted objects (or bytes in classes with MOZ_COUNT_CTOR and MOZ_COUNT_DTOR) is greater than the given number' -l leak-threshold
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'absolute path to directory containing utility programs (xpcshell, ssltunnel, certutil)' -l utility-path
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'how many chunks to split the tests up into' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'which chunk to run between 1 and --total-chunks' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'file to log output to in addition to stdout' -l log-file
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'skip tests marked as slow when running' -l skip-slow-tests
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'ignore the window size, which may cause spurious failures and passes' -l ignore-window-size
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'install the specified extension in the testing profile. The extension file\'s name should be <id>.xpi where <id> is the extension\'s id as indicated in its install.rdf. An optional path can be specified too.' -l install-extension
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'host:port to use when connecting to Marionette' -l marionette
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'sets the given variable in the application\'s environment' -l setenv
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'specifies a regular expression (as could be passed to the JS RegExp constructor) to test against URLs in the reftest manifest; only test items that have a matching test URL will be run.' -l filter
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'run reftests in random order' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'stop running on the first failure. Useful for RR recordings.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'number of times the select test(s) will be executed. Useful for finding intermittent failures.' -l repeat
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'filters tests to run by whether they require focus. Valid values are `all\', `needs-focus\', or `non-needs-focus\'. Defaults to `all\'.' -l focus-filter-mode
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'disables content processes' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Run tests with fission (site isolation) enabled.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'defines an extra user preference' -l setpref
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Path to the reftest extension' -l reftest-extension-path
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Path to the special powers extension' -l special-powers-extension-path
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Delete pending crash reports before running tests.' -l cleanup-crashes
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'The maximum number of attempts to try and recover from a crash before aborting the test run [default 4].' -l max-retries
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Path to add to the sandbox whitelist.' -l sandbox-read-whitelist
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Run tests in verification mode: Run many times in different ways, to see if there are intermittent failures.' -l verify
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Maximum time, in seconds, to run in --verify mode..' -l verify-max-time
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Run tests in headless mode.' -l headless
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Path to source directory' -l topsrcdir
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command crashtest ' -d 'run tests in parallel if possible' -l run-tests-in-parallel

# create-mach-environment
complete -c mach -A -n '__fish_mach_complete_command create-mach-environment ' -d 'Force re-creating the virtualenv even if it is already up-to-date.' -s f -l force

# devtools-css-db

# doc
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Documentation format to write.' -l format
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Where to write output.' -l outdir
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Write a gzipped tarball of generated docs.' -l archive
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Don\'t automatically open HTML docs in a browser.' -l no-open
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Don\'t serve the generated docs after building.' -l no-serve
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Serve documentation on the specified host and port, default "localhost:5500".' -l http
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Upload generated files to S3.' -l upload
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Distribute the build over N processes in parallel.' -s j -l jobs
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Write S3 Upload URL to text file' -l write-url
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Run Sphinx in verbose mode' -l verbose
complete -c mach -A -n '__fish_mach_complete_command doc mach-telemetry' -d 'Generate documentation from Glean metrics.yaml files' -a mach-telemetry

# doctor
complete -c mach -A -n '__fish_mach_complete_command doctor ' -d 'Attempt to fix found problems.' -l fix

# environment
complete -c mach -A -n '__fish_mach_complete_command environment ' -d 'Print data in the given format.' -l format
complete -c mach -A -n '__fish_mach_complete_command environment ' -d 'Output to the given file.' -l output -s o
complete -c mach -A -n '__fish_mach_complete_command environment ' -d 'Print verbose output.' -l verbose -s v

# eslint
complete -c mach -A -n '__fish_mach_complete_command eslint ' -d 'Configure eslint for optimal development.' -s s -l setup
complete -c mach -A -n '__fish_mach_complete_command eslint ' -d 'Path to eslint binary.' -s b -l binary
complete -c mach -A -n '__fish_mach_complete_command eslint ' -d 'Request that eslint automatically fix errors, where possible.' -l fix

# fetch-condprofile
complete -c mach -A -n '__fish_mach_complete_command fetch-condprofile ' -d 'Target directory' -l target-dir
complete -c mach -A -n '__fish_mach_complete_command fetch-condprofile ' -d 'Platform' -l platform
complete -c mach -A -n '__fish_mach_complete_command fetch-condprofile ' -d 'Scenario' -l scenario
complete -c mach -A -n '__fish_mach_complete_command fetch-condprofile ' -d 'Customization' -l customization
complete -c mach -A -n '__fish_mach_complete_command fetch-condprofile ' -d 'Task ID' -l task-id
complete -c mach -A -n '__fish_mach_complete_command fetch-condprofile ' -d '' -l download-cache
complete -c mach -A -n '__fish_mach_complete_command fetch-condprofile ' -d 'Repository' -l repo

# file-info
complete -c mach -A -n '__fish_mach_complete_command file-info bugzilla-automation bugzilla-component missing-bugzilla schedules' -d 'Perform Bugzilla metadata analysis as required for automation' -a bugzilla-automation
complete -c mach -A -n '__fish_mach_complete_subcommand file-info bugzilla-component' -d 'Version control revision to look up info from' -s r -l rev
complete -c mach -A -n '__fish_mach_complete_subcommand file-info bugzilla-component' -d 'Output format' -l format
complete -c mach -A -n '__fish_mach_complete_command file-info bugzilla-automation bugzilla-component missing-bugzilla schedules' -d 'Show Bugzilla component info for files listed.' -a bugzilla-component
complete -c mach -A -n '__fish_mach_complete_subcommand file-info missing-bugzilla' -d 'Version control revision to look up info from' -s r -l rev
complete -c mach -A -n '__fish_mach_complete_subcommand file-info missing-bugzilla' -d 'Output format' -l format
complete -c mach -A -n '__fish_mach_complete_command file-info bugzilla-automation bugzilla-component missing-bugzilla schedules' -d 'Show files missing Bugzilla component info' -a missing-bugzilla
complete -c mach -A -n '__fish_mach_complete_command file-info bugzilla-automation bugzilla-component missing-bugzilla schedules' -d 'Show the combined SCHEDULES for the files listed.' -a schedules

# firefox-ui-functional
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'path to gecko executable to launch before running the test' -l binary
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'host:port of running Gecko instance to connect to' -l address
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'If no --address is given, then the harness will launch an emulator. (See Remote options group.) If --address is given, then the harness assumes you are running an emulator already, and will launch gecko app on that emulator.' -l emulator
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'application to use. see marionette_driver.geckoinstance' -l app
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'specify a command line argument to be passed onto the application' -l app-arg
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'profile to use when launching the gecko process. If not passed, then a profile will be constructed and used' -l profile
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'set a browser preference; repeat for multiple preferences.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'read preferences from a JSON or INI file. For INI, use \'file.ini:section\' to specify a particular section.' -l preferences
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'addon to install; repeat for multiple addons.' -l addon
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'number of times to repeat the test(s)' -l repeat
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Run tests repeatedly and stop on the first time a test fails. Default cap is 30 runs, which can be overwritten with the --repeat parameter.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'path to a json file with any test data required' -l testvars
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'absolute path to directory containing breakpad symbols, or the url of a zip file containing symbols' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Set the global timeout for marionette socket operations. Default: %(default)ss.' -l socket-timeout
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'the max number of seconds to wait for a Marionette connection after launching a binary. Default: %(default)ss.' -l startup-timeout
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'run tests in a random order' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Use given seed to shuffle tests' -l shuffle-seed
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'how many chunks to split the tests up into' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'which chunk to run' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'url to a webserver or path to a document root from which content resources are served (default: /Users/johann/Development/mozilla-central/testing/marionette/harness/marionette_harness/www).' -l server-root
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Define the path to store log file. If the path is a directory, the real log file will be created given the format gecko-(timestamp).log. If it is a file, if will be used directly. \'-\' may be passed to write to stdout. Default: \'./gecko.log\'' -l gecko-log
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Define the name to associate with the logger used' -l logger-name
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Enable the jsdebugger for marionette javascript.' -l jsdebugger
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Enable python post-mortem debugger when a test fails. Pass in the debugger you want to use, eg pdb or ipdb.' -l pydebugger
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Enable Fission (site isolation) in Gecko.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Run tests in headless mode.' -s z -l headless
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Filter out tests that don\'t have the given tag. Can be used multiple times in which case the test must contain at least one of the given tags.' -l tag
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Path to directory for Marionette output. (Default: .) (Default profile dest: TMP)' -l workspace
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Increase verbosity to include debug messages with -v, and trace messages with -vv.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Path to emulator binary. By default mozrunner uses `which emulator`' -l emulator-binary
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Path to the adb. By default mozrunner uses `which adb`' -l adb
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Name of an AVD available in your environment.See mozrunner.FennecEmulatorRunner' -l avd
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Path to avd parent directory' -l avd-home
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Serial ID to connect to as seen in `adb devices`,e.g emulator-5444' -l device
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Name of Android package, e.g. org.mozilla.fennec' -l package
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command firefox-ui-functional ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# fluent-migration-test

# geckodriver
complete -c mach -A -n '__fish_mach_complete_command geckodriver ' -d 'Firefox binary (defaults to the local build).' -l binary
complete -c mach -A -n '__fish_mach_complete_command geckodriver ' -d 'Enable the debugger. Not specifying a --debugger option will result in the default debugger being used.' -l debug
complete -c mach -A -n '__fish_mach_complete_command geckodriver ' -d 'Name of debugger to use.' -l debugger
complete -c mach -A -n '__fish_mach_complete_command geckodriver ' -d 'Flags to pass to the debugger itself; split as the Bourne shell would.' -l debugger-args

# geckodriver-test
complete -c mach -A -n '__fish_mach_complete_command geckodriver-test ' -d 'Verbose output for what commands the build is running.' -s v -l verbose

# geckoview-junit
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Do not try to install application on device before running (default: False)' -l no-install
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Test package name.' -l appname
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Path to adb binary.' -l adbpath
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'adb serial number of remote device. This is required when more than one device is connected to the host. Use \'adb devices\' to see connected devices. ' -l deviceSerial
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Set target environment variable, like FOO=BAR' -l setenv
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Remote directory to use as test root (eg. /data/local/tmp/test_root).' -l remoteTestRoot
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Disable multiprocess mode in test app.' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Max time in seconds to wait for tests (default 2400s).' -l max-time
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Test runner name.' -l runner
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Path to directory containing breakpad symbols, or the URL of a zip file containing symbols.' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Path to directory containing host utility programs.' -l utility-path
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Total number of chunks to split tests into.' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'If running tests by chunks, the chunk number to run.' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Enable code coverage collection.' -l enable-coverage
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'If collecting code coverage, save the report file in this dir.' -l coverage-output-dir
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Repeat the tests the given number of times.' -l repeat
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Run tests repeatedly but stop the first time a test fails.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Defines an extra user preference.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Path to directory containing certificate store.' -l certificate-path
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'http port of the remote web server.' -l http-port
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'IP address of the remote web server.' -l remote-webserver
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'ssl port of the remote web server.' -l ssl-port
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Line-delimited file containing test filter(s)' -l test-filters-file
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command geckoview-junit ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# gradle
complete -c mach -A -n '__fish_mach_complete_command gradle ' -d 'Verbose output for what commands the build is running.' -s v -l verbose

# gradle-install

# gtest
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Run the tests in parallel using multiple processes.' -l jobs -s j
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Output test results in a format that can be parsed by TBPL.' -l tbpl-parser -s t
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Randomize the execution order of tests.' -l shuffle -s s
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Package name of test app.' -l package
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Path to adb binary.' -l adbpath
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'adb serial number of remote device. Required when more than one device is connected to the host. Use \'adb devices\' to see connected devices.' -l deviceSerial
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Remote directory to use as test root (eg. /data/local/tmp/test_root).' -l remoteTestRoot
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Path to gtest libxul.so.' -l libxul
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Skip the installation of the APK.' -l no-install
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Enable the debugger. Not specifying a --debugger option will result in the default debugger being used.' -l debug
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Name of debugger to use.' -l debugger
complete -c mach -A -n '__fish_mach_complete_command gtest ' -d 'Command-line arguments to pass to the debugger itself; split as the Bourne shell would.' -l debugger-args

# hazards
complete -c mach -A -n '__fish_mach_complete_command hazards analyze bootstrap build-shell compile gather' -d 'Analyzed gathered data for rooting hazards' -a analyze
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Directory where to store the artifacts cache' -l cache-dir
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Skip all local caches to force re-fetching remote artifacts.' -l skip-cache
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Download toolchains resulting from the given build(s); BUILD is a name of a toolchain task, e.g. linux64-clang' -l from-build
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Explicit tooltool manifest to process' -l tooltool-manifest
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Use the RelengAPI token found in the given file to authenticate' -l authentication-file
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Do not unpack any downloaded file' -l no-unpack
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Number of times to retry failed downloads' -l retry
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Whether this is being called from bootstrap. This verifies the toolchain is annotated as a toolchain used for local development.' -l bootstrap
complete -c mach -A -n '__fish_mach_complete_subcommand hazards bootstrap' -d 'Store a manifest about the downloaded taskcluster artifacts' -l artifact-manifest
complete -c mach -A -n '__fish_mach_complete_command hazards analyze bootstrap build-shell compile gather' -d 'Install prerequisites for the hazard analysis' -a bootstrap
complete -c mach -A -n '__fish_mach_complete_subcommand hazards build-shell' -d 'Build with the given mozconfig.' -l mozconfig
complete -c mach -A -n '__fish_mach_complete_subcommand hazards build-shell' -d 'Number of concurrent jobs to run. Default is the number of CPUs.' -l jobs -s j
complete -c mach -A -n '__fish_mach_complete_subcommand hazards build-shell' -d 'Change to a subdirectory of the build directory first.' -s C -l directory
complete -c mach -A -n '__fish_mach_complete_subcommand hazards build-shell' -d 'Verbose output for what commands the build is running.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_subcommand hazards build-shell' -d 'Keep building after an error has occurred' -l keep-going
complete -c mach -A -n '__fish_mach_complete_command hazards analyze bootstrap build-shell compile gather' -d 'Build a shell for the hazard analysis' -a build-shell
complete -c mach -A -n '__fish_mach_complete_subcommand hazards compile' -d 'Build with the given mozconfig.' -l mozconfig
complete -c mach -A -n '__fish_mach_complete_subcommand hazards compile' -d 'Build the given application.' -l application
complete -c mach -A -n '__fish_mach_complete_subcommand hazards compile' -d 'Number of concurrent jobs to run. Default is the number of CPUs.' -l jobs -s j
complete -c mach -A -n '__fish_mach_complete_subcommand hazards compile' -d 'Change to a subdirectory of the build directory first.' -s C -l directory
complete -c mach -A -n '__fish_mach_complete_subcommand hazards compile' -d 'Verbose output for what commands the build is running.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_subcommand hazards compile' -d 'Keep building after an error has occurred' -l keep-going
complete -c mach -A -n '__fish_mach_complete_command hazards analyze bootstrap build-shell compile gather' -d '==SUPPRESS==' -a compile
complete -c mach -A -n '__fish_mach_complete_subcommand hazards gather' -d 'Build the given application.' -l application
complete -c mach -A -n '__fish_mach_complete_command hazards analyze bootstrap build-shell compile gather' -d 'Gather analysis data by compiling the given application' -a gather

# ide

# import-pr
complete -c mach -A -n '__fish_mach_complete_command import-pr ' -d 'Bug number to use in the commit messages.' -s b -l bug-number
complete -c mach -A -n '__fish_mach_complete_command import-pr ' -d 'Bugzilla API token used to file a new bug if no bug number is provided.' -s t -l bugzilla-token
complete -c mach -A -n '__fish_mach_complete_command import-pr ' -d 'Reviewer nick to apply to commit messages.' -s r -l reviewer

# install
complete -c mach -A -n '__fish_mach_complete_command install ' -d 'show this help message and exit' -s h -l help

# install-moz-phab
complete -c mach -A -n '__fish_mach_complete_command install-moz-phab ' -d 'Force installation even if already installed.' -l force -s f

# jit-test
complete -c mach -A -n '__fish_mach_complete_command jit-test ' -d 'The shell to be used' -l shell

# jsapi-tests

# jsshell-bench
complete -c mach -A -n '__fish_mach_complete_command jsshell-bench ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command jsshell-bench ' -d 'Path to the JS shell binary to use.' -s b -l binary
complete -c mach -A -n '__fish_mach_complete_command jsshell-bench ' -d 'Extra arguments to pass to the JS shell.' -l arg
complete -c mach -A -n '__fish_mach_complete_command jsshell-bench ' -d 'Log PERFHERDER_DATA to stdout using the given suite name.' -l perfherder

# jstestbrowser
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'absolute path to directory containing XRE (probably xulrunner)' -l xre-path
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'absolute path to directory containing breakpad symbols, or the URL of a zip file containing symbols' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'use the given debugger to launch the application' -l debugger
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'pass the given args to the debugger _before_ the application on the command line' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'prevents the test harness from redirecting stdout and stderr for interactive debuggers' -l debugger-interactive
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'absolute path to application, overriding default' -l appname
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'copy specified files/dirs to testing profile' -l extra-profile-file
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'reftest will timeout in specified number of seconds. [default %(default)s].' -l timeout
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'fail if the number of bytes leaked in default processes through refcounted objects (or bytes in classes with MOZ_COUNT_CTOR and MOZ_COUNT_DTOR) is greater than the given number' -l leak-threshold
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'absolute path to directory containing utility programs (xpcshell, ssltunnel, certutil)' -l utility-path
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'how many chunks to split the tests up into' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'which chunk to run between 1 and --total-chunks' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'file to log output to in addition to stdout' -l log-file
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'skip tests marked as slow when running' -l skip-slow-tests
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'ignore the window size, which may cause spurious failures and passes' -l ignore-window-size
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'install the specified extension in the testing profile. The extension file\'s name should be <id>.xpi where <id> is the extension\'s id as indicated in its install.rdf. An optional path can be specified too.' -l install-extension
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'host:port to use when connecting to Marionette' -l marionette
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'sets the given variable in the application\'s environment' -l setenv
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'specifies a regular expression (as could be passed to the JS RegExp constructor) to test against URLs in the reftest manifest; only test items that have a matching test URL will be run.' -l filter
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'run reftests in random order' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'stop running on the first failure. Useful for RR recordings.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'number of times the select test(s) will be executed. Useful for finding intermittent failures.' -l repeat
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'filters tests to run by whether they require focus. Valid values are `all\', `needs-focus\', or `non-needs-focus\'. Defaults to `all\'.' -l focus-filter-mode
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'disables content processes' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Run tests with fission (site isolation) enabled.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'defines an extra user preference' -l setpref
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Path to the reftest extension' -l reftest-extension-path
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Path to the special powers extension' -l special-powers-extension-path
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Delete pending crash reports before running tests.' -l cleanup-crashes
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'The maximum number of attempts to try and recover from a crash before aborting the test run [default 4].' -l max-retries
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Path to add to the sandbox whitelist.' -l sandbox-read-whitelist
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Run tests in verification mode: Run many times in different ways, to see if there are intermittent failures.' -l verify
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Maximum time, in seconds, to run in --verify mode..' -l verify-max-time
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Run tests in headless mode.' -l headless
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Path to source directory' -l topsrcdir
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command jstestbrowser ' -d 'run tests in parallel if possible' -l run-tests-in-parallel

# jstests
complete -c mach -A -n '__fish_mach_complete_command jstests ' -d 'The shell to be used' -l shell

# lint
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Linters to run, e.g \'eslint\'. By default all linters are run for all the appropriate files.' -s l -l linter
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'List all available linters and exit.' -l list
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Display and fail on warnings in addition to errors.' -s W -l warnings
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Enable verbose logging.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Formatter to use. Defaults to \'stylish\' on stdout. You can specify an optional path as --format formatter:path that will be used instead of stdout. You can also use multiple formatters at the same time. Formatters available: compact, json, stylish, summary, treeherder, unix.' -s f -l format
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Ignore all filtering. This is useful for quickly testing a directory that otherwise wouldn\'t be run, without needing to modify the config file.' -s n -l no-filter
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Lint files touched by commits that are not on the remote repository. Without arguments, finds the default remote that would be pushed to. The remote branch can also be specified manually. Works with mercurial or git.' -s o -l outgoing
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Lint files touched by changes in the working directory (i.e haven\'t been committed yet). On git, --workdir=staged can be used to only consider staged files. Works with mercurial or git.' -s w -l workdir
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Lint files touched by changes in revisions described by REV. For mercurial, it may be any revset. For git, it is a single tree-ish.' -s r -l rev
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Fix lint errors if possible. Any errors that could not be fixed will be printed as normal.' -l fix
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Each file containing lint errors will be opened in $EDITOR one after the other.' -l edit
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Bootstrap linter dependencies without running any of the linters.' -l setup
complete -c mach -A -n '__fish_mach_complete_command lint ' -d 'Number of worker processes to spawn when running linters. Defaults to the number of cores in your CPU.' -s j -l jobs

# logspam
complete -c mach -A -n '__fish_mach_complete_subcommand logspam bisect' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand logspam bisect' -d 'Platform to get logs for. Default: linux1804-64' -l platform
complete -c mach -A -n '__fish_mach_complete_subcommand logspam bisect' -d 'Regex used to match lines. Can be used to match debug messages that are not proper warnings.' -l warning-re
complete -c mach -A -n '__fish_mach_complete_subcommand logspam bisect' -d 'Ignore line numbers when bisecting warnings. Useful if the line number of the warning has changed. Not so useful if there are a lot of similar warnings in the file.' -l ignore-lines
complete -c mach -A -n '__fish_mach_complete_subcommand logspam bisect' -d 'The threshold of warnings for going from good to bad. Default: 1000.' -l warning-limit
complete -c mach -A -n '__fish_mach_complete_subcommand logspam bisect' -d 'Test that must be present to compare revisions' -l required-test
complete -c mach -A -n '__fish_mach_complete_command logspam bisect file report' -d '' -a bisect
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Platform to get logs for. Default: linux1804-64' -l platform
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Regex used to match lines. Can be used to match debug messages that are not proper warnings.' -l warning-re
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Repository the revision corresponds to. Default: mozilla-central' -l repo
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Redownload logs if already present.' -l no-cache
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Directory to cache logs to. Default: <repo>-<revision>' -l cache-dir
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Number of warnings to show in the default summary. Default: 40' -l warning-count
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Number of tests to list in warning summary mode. Default: 10' -l test-summary-count
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Print the least common warnings instead.' -l reverse
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Component to file the bug in.' -l component
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'local mozilla repo to use for mapping components' -l hgroot
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'Product to file the bug in. Default: Core' -l product
complete -c mach -A -n '__fish_mach_complete_subcommand logspam file' -d 'The API key to use when creating the bug. Default: extracted from .hgrc' -l api-key
complete -c mach -A -n '__fish_mach_complete_command logspam bisect file report' -d '' -a file
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'Platform to get logs for. Default: linux1804-64' -l platform
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'Regex used to match lines. Can be used to match debug messages that are not proper warnings.' -l warning-re
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'Repository the revision corresponds to. Default: mozilla-central' -l repo
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'Redownload logs if already present.' -l no-cache
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'Directory to cache logs to. Default: <repo>-<revision>' -l cache-dir
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'Number of warnings to show in the default summary. Default: 40' -l warning-count
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'Number of tests to list in warning summary mode. Default: 10' -l test-summary-count
complete -c mach -A -n '__fish_mach_complete_subcommand logspam report' -d 'Print the least common warnings instead.' -l reverse
complete -c mach -A -n '__fish_mach_complete_command logspam bisect file report' -d '' -a report

# mach-commands

# mach-completion
complete -c mach -A -n '__fish_mach_complete_subcommand mach-completion bash' -d 'File path to save completion script.' -s f -l file
complete -c mach -A -n '__fish_mach_complete_command mach-completion bash fish zsh' -d 'Print mach completion script for bash shell' -a bash
complete -c mach -A -n '__fish_mach_complete_subcommand mach-completion fish' -d 'File path to save completion script.' -s f -l file
complete -c mach -A -n '__fish_mach_complete_command mach-completion bash fish zsh' -d 'Print mach completion script for fish shell' -a fish
complete -c mach -A -n '__fish_mach_complete_subcommand mach-completion zsh' -d 'File path to save completion script.' -s f -l file
complete -c mach -A -n '__fish_mach_complete_command mach-completion bash fish zsh' -d 'Print mach completion script for zsh shell' -a zsh

# mach-debug-commands

# marionette-test
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'path to gecko executable to launch before running the test' -l binary
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'host:port of running Gecko instance to connect to' -l address
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'If no --address is given, then the harness will launch an emulator. (See Remote options group.) If --address is given, then the harness assumes you are running an emulator already, and will launch gecko app on that emulator.' -l emulator
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'application to use. see marionette_driver.geckoinstance' -l app
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'specify a command line argument to be passed onto the application' -l app-arg
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'profile to use when launching the gecko process. If not passed, then a profile will be constructed and used' -l profile
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'set a browser preference; repeat for multiple preferences.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'read preferences from a JSON or INI file. For INI, use \'file.ini:section\' to specify a particular section.' -l preferences
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'addon to install; repeat for multiple addons.' -l addon
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'number of times to repeat the test(s)' -l repeat
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Run tests repeatedly and stop on the first time a test fails. Default cap is 30 runs, which can be overwritten with the --repeat parameter.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'path to a json file with any test data required' -l testvars
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'absolute path to directory containing breakpad symbols, or the url of a zip file containing symbols' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Set the global timeout for marionette socket operations. Default: %(default)ss.' -l socket-timeout
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'the max number of seconds to wait for a Marionette connection after launching a binary. Default: %(default)ss.' -l startup-timeout
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'run tests in a random order' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Use given seed to shuffle tests' -l shuffle-seed
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'how many chunks to split the tests up into' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'which chunk to run' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'url to a webserver or path to a document root from which content resources are served (default: /Users/johann/Development/mozilla-central/testing/marionette/harness/marionette_harness/www).' -l server-root
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Define the path to store log file. If the path is a directory, the real log file will be created given the format gecko-(timestamp).log. If it is a file, if will be used directly. \'-\' may be passed to write to stdout. Default: \'./gecko.log\'' -l gecko-log
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Define the name to associate with the logger used' -l logger-name
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Enable the jsdebugger for marionette javascript.' -l jsdebugger
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Enable python post-mortem debugger when a test fails. Pass in the debugger you want to use, eg pdb or ipdb.' -l pydebugger
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Enable Fission (site isolation) in Gecko.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Run tests in headless mode.' -s z -l headless
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Filter out tests that don\'t have the given tag. Can be used multiple times in which case the test must contain at least one of the given tags.' -l tag
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Path to directory for Marionette output. (Default: .) (Default profile dest: TMP)' -l workspace
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Increase verbosity to include debug messages with -v, and trace messages with -vv.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Path to emulator binary. By default mozrunner uses `which emulator`' -l emulator-binary
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Path to the adb. By default mozrunner uses `which adb`' -l adb
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Name of an AVD available in your environment.See mozrunner.FennecEmulatorRunner' -l avd
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Path to avd parent directory' -l avd-home
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Serial ID to connect to as seen in `adb devices`,e.g emulator-5444' -l device
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Name of Android package, e.g. org.mozilla.fennec' -l package
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command marionette-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# mochitest
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Only run tests of this flavor.' -s f -l flavor
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Always keep the browser open after tests complete. Or always close the browser with --keep-open=false' -l keep-open
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Override the default binary used to run tests with the path provided, e.g /usr/bin/firefox. If you have run ./mach package beforehand, you can specify \'dist\' to run tests against the distribution bundle\'s binary.' -l appname
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Do not start running tests automatically.' -l no-autorun
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'The per-test timeout in seconds (default: 60 seconds).' -l timeout
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'The maximum number of timeouts permitted before halting testing.' -l max-timeouts
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Total number of chunks to split tests into.' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'If running tests by chunks, the chunk number to run.' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Group tests such that each chunk has roughly the same runtime.' -l chunk-by-runtime
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Group tests together in the same chunk that are in the same top chunkByDir directories.' -l chunk-by-dir
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Shuffle execution order of tests.' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Specify the failing test name to find the previous tests that may be causing the failure.' -l bisect-chunk
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Start running the test sequence at this test.' -l start-at
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Stop running the test sequence at this test.' -l end-at
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Subsuite of tests to run. Unlike tags, subsuites also remove tests from the default set. Only one can be specified at once.' -l subsuite
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Sets the given variable in the application\'s environment.' -l setenv
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Install the specified extension in the testing profile. Can be a path to a .xpi file.' -l install-extension
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Repeat the tests the given number of times.' -l repeat
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run tests repeatedly but stop the first time a test fails. Default cap is 30 runs, which can be overridden with the --repeat parameter.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Delay execution between tests.' -l run-slower
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Defines an extra user preference.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Open the Browser Console.' -l jsconsole
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Start the browser JS debugger before running the test. Implies --no-autorun.' -l jsdebugger
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Path to a Firefox binary that will be used to run the toolbox. Should be used together with --jsdebugger.' -l jsdebugger-path
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Breaks execution and enters the JS debugger on a test failure. Should be used together with --jsdebugger.' -l debug-on-failure
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run tests with electrolysis preferences and test filtering disabled.' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run tests with fission (site isolation) enabled.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run tests in a cross origin iframe.' -l enable-xorigin-tests
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run tests with DMD active.' -l dmd
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Specifies the directory in which to place dumped memory reports.' -l dump-output-directory
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Dump an about:memory log after each test in the directory specified by --dump-output-directory.' -l dump-about-memory-after-test
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Dump a DMD log (and an accompanying about:memory log) after each test. These will be dumped into your default temp directory, NOT the directory specified by --dump-output-directory. The logs are numbered by test, and each test will include output that indicates the DMD output filename.' -l dump-dmd-after-test
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Take screenshots on all test failures. Set $MOZ_UPLOAD_DIR to a directory for storing the screenshots.' -l screenshot-on-fail
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Do not print test log lines unless a failure occurs.' -l quiet
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run tests in headless mode.' -l headless
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Use test media device drivers for media testing.' -l use-test-media-devices
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Debugger binary to run tests in. Program name or path.' -l debugger
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Arguments to pass to the debugger.' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Valgrind binary to run tests with. Program name or path.' -l valgrind
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Comma-separated list of extra arguments to pass to Valgrind.' -l valgrind-args
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Comma-separated list of suppression files to pass to Valgrind.' -l valgrind-supp-files
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Filter out tests that don\'t have the given tag. Can be used multiple times in which case the test must contain at least one of the given tags.' -l tag
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'host:port to use when connecting to Marionette' -l marionette
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Port for websocket/process bridge. Default 8191.' -l websocket-process-bridge-port
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run tests in verification mode: Run many times in different ways, to see if there are intermittent failures.' -l verify
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run tests once without Fission, once with Fission' -l verify-fission
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Maximum time, in seconds, to run in --verify mode.' -l verify-max-time
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run the Firefox Profiler and get a performance profile of the mochitest. This is useful to find performance issues, and also to see what exactly the test is doing. To get profiler options run: `MOZ_PROFILER_HELP=1 ./mach run`' -l profiler
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Run the Firefox Profiler and save it to the path specified by the MOZ_UPLOAD_DIR environment variable.' -l profiler-save-only
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command mochitest ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# mozbuild-reference
complete -c mach -A -n '__fish_mach_complete_command mozbuild-reference ' -d 'Print symbol names only.' -l name-only -s n

# mozharness
complete -c mach -A -n '__fish_mach_complete_command mozharness ' -d 'show this help message and exit' -s h -l help

# mozregression
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'print the mozregression version number and exits.' -l version
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'first known bad build, default is today. It can be a date (YYYY-MM-DD), a build id, a release number or a changeset.' -s b -l bad
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'last known good build. Same possible values as the --bad option.' -s g -l good
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'list all known releases and exit' -l list-releases
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Build type to use, e.g. opt, debug. See --list-build-types for available values. Defaults to shippable for desktop Fx, opt for everything else.' -s B -l build-type
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'List available build types combinations.' -l list-build-types
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Search for a bug fix instead of a regression.' -l find-fix
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'addon to install; repeat for multiple addons.' -s e -l addon
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'profile to use with nightlies.' -s p -l profile
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Path to use on android devices for storing the profile. Generally you should not need to specify this, and an appropriate path will be used. Specifying this to a value, e.g. \'/sdcard/tests\' will forcibly try to create the profile inside that folder.' -l adb-profile-dir
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Persistence of the used profile. Before each tested build, a profile is used. If the value of this option is \'clone\', each test uses a fresh clone. If the value is \'clone-first\', the profile is cloned once then reused for all builds during the  bisection. If the value is \'reuse\', the given profile is directly used. Note that the profile might be modified by mozregression. Defaults to %(default)s.' -l profile-persistence
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'a command-line argument to pass to the application; repeat for multiple arguments. Use --arg=\'-option\' to pass in options starting with `-`.' -s a -l arg
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d ' A preference to set. Must be a key-value pair separated by a \':\'. Note that if your preference is of type float, you should pass it as a string, e.g.: --pref "layers.low-precision-opacity:\'0.0\'"' -l pref
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'read preferences from a JSON or INI file. For INI, use \'file.ini:section\' to specify a particular section.' -l preferences
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'application name. Default: %(default)s.' -s n -l app
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'build language. Only valid when app is firefox-l10n.' -l lang
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'repository name used for the bisection.' -l repo
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'force 32 or 64 bit version (only applies to x86_64 boxes). Default: None bits.' -l bits
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Force x86_64 build (only applies to GVE app). Default: arm' -l arch
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Test command to evaluate builds automatically. A return code of 0 will evaluate the build as good, and any other value as bad. Variables like {binary} can be used, which will be replaced with their value as retrieved by the actual build.' -s c -l command
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'the directory in which downloaded files are to persist. Defaults to %(default)r.' -l persist
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Size limit for the persist directory in gigabytes (GiB). When the limit is reached, old builds are removed. 0 means no limit. Note that at least 5 build files are kept, regardless of this value. Defaults to %(default)s.' -l persist-size-limit
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Timeout in seconds to abort requests when there is no activity from the server. Default to %(default)s seconds - increase this if you are under a really slow network.' -l http-timeout
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Do not download next builds in the background while evaluating the current build.' -l no-background-dl
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Policy to use for background downloads. Possible values are "cancel" to cancel all pending background downloads or "keep" to keep downloading them when persist mode is enabled. The default is %(default)s.' -l background-dl-policy
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Policy to reuse approximate persistent builds instead of downloading the accurate ones. When auto, mozregression will try its best to reuse the files, meaning that for 7 days of bisection range it will try to reuse a build which date approximates the build to download by one day (before or after). Use none to disable this behavior. Defaults to %(default)s.' -l approx-policy
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Launch only one specific build. Same possible values as the --bad option.' -l launch
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Manage process output logging. Set to stdout by default when the build type is not \'opt\'.' -s P -l process-output
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'bisection mode. \'classic\' will check for the first good and bad builds to really be good and bad, and \'no-first-check\' won\'t. Defaults to %(default)s.' -s M -l mode
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Base url used to find the archived builds. Defaults to %(default)s' -l archive-base-url
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Helps to write the configuration file.' -l write-config
complete -c mach -A -n '__fish_mach_complete_command mozregression ' -d 'Show the debug output.' -l debug -s d

# node

# npm

# package
complete -c mach -A -n '__fish_mach_complete_command package ' -d 'Verbose output for what commands the packaging process is running.' -s v -l verbose

# package-multi-locale
complete -c mach -A -n '__fish_mach_complete_command package-multi-locale ' -d 'List of locales to package, including "en-US"' -l locales
complete -c mach -A -n '__fish_mach_complete_command package-multi-locale ' -d 'Log informative status messages.' -l verbose

# pastebin
complete -c mach -A -n '__fish_mach_complete_command pastebin ' -d 'List known highlighters and exit' -l list-highlighters
complete -c mach -A -n '__fish_mach_complete_command pastebin ' -d 'Syntax highlighting to use for paste' -l highlighter
complete -c mach -A -n '__fish_mach_complete_command pastebin ' -d 'Expire paste after given time duration (default: %(default)s)' -l expires
complete -c mach -A -n '__fish_mach_complete_command pastebin ' -d 'Print extra info such as selected syntax highlighter' -l verbose

# perftest

# perftest-test
complete -c mach -A -n '__fish_mach_complete_command perftest-test ' -d 'Skip flake8 and black' -s s -l skip-linters
complete -c mach -A -n '__fish_mach_complete_command perftest-test ' -d 'Verbose mode' -s v -l verbose

# power
complete -c mach -A -n '__fish_mach_complete_command power ' -d 'The sample period, measured in milliseconds. Defaults to 30000.' -s i -l interval

# prettier-format
complete -c mach -A -n '__fish_mach_complete_command prettier-format ' -d 'Specify the path to reformat to stdout.' -l path -s p
complete -c mach -A -n '__fish_mach_complete_command prettier-format ' -d 'This option is usually used in the context of hg-formatsource.When reading from stdin, Prettier assumes this filename to decide which style and parser to use.' -l assume-filename -s a

# puppeteer-test
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d '' -l product
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Path to browser binary.  Defaults to local Firefox build.' -l binary
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Enable Fission (site isolation) in Gecko.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Run browser in headless mode.' -s z -l headless
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Defines additional user preferences.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Defines additional options for `puppeteer.launch`.' -l setopt
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Increase remote agent logging verbosity to include debug level messages with -v, trace messages with -vv,and to not truncate long trace messages with -vvv' -s v
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Path to write updated results to (defaults to the expectations file if the argument is provided but no path is passed)' -l write-results
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Indicate that only a subset of the tests are running, so checks for missing tests should be skipped' -l subset
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command puppeteer-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# python
complete -c mach -A -n '__fish_mach_complete_command python ' -d 'Do not set up a virtualenv' -l no-virtualenv
complete -c mach -A -n '__fish_mach_complete_command python ' -d 'Execute this Python file using `exec`' -l exec-file
complete -c mach -A -n '__fish_mach_complete_command python ' -d 'Use ipython instead of the default Python REPL.' -l ipython

# python-test
complete -c mach -A -n '__fish_mach_complete_command python-test ' -d 'Verbose output.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command python-test ' -d 'Number of concurrent jobs to run. Default is the number of CPUs in the system.' -s j -l jobs
complete -c mach -A -n '__fish_mach_complete_command python-test ' -d 'Runs all tests sequentially and breaks at the first failure.' -s x -l exitfirst
complete -c mach -A -n '__fish_mach_complete_command python-test ' -d 'Python subsuite to run. If not specified, all subsuites are run. Use the string `default` to only run tests without a subsuite.' -l subsuite

# raptor
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Name of Raptor test to run (can be a top-level suite name i.e. \'--test raptor-speedometer\',\'--test raptor-tp6-1\', or for page-load tests a suite sub-test i.e. \'--test raptor-tp6-google-firefox\')' -s t -l test
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Name of the application we are testing (default: firefox)' -l app
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'path to the browser executable that we are testing' -s b -l binary
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Name of Android activity used to launch the Android app.i.e.: [\'geckoview:org.mozilla.geckoview_example.GeckoViewActivity\', \'refbrow:org.mozilla.reference.browser.BrowserTestActivity\', \'fenix:org.mozilla.fenix.IntentReceiverActivity\', \'chrome-m:com.android.chrome/com.google.android.apps.chrome.Main\']' -s a -l activity
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Name of Android intent action used to launch the Android app.i.e.: [\'geckoview:android.intent.action.MAIN\', \'refbrow:android.intent.action.MAIN\', \'fenix:android.intent.action.VIEW\', \'chrome-m:android.intent.action.VIEW\']' -s i -l intent
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Hostname from which to serve URLs; defaults to 127.0.0.1. The value HOST_IP will cause the value of host to be loaded from the environment variable HOST_IP.' -l host
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Use Raptor to measure power usage on Android browsers (Geckoview Example, Fenix, Refbrow, and Fennec) as well as on Intel-based MacOS machines that have Intel Power Gadget installed.' -l power-test
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Use Raptor to measure memory usage.' -l memory-test
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Use Raptor to measure CPU usage. Currently supported for Android only.' -l cpu-test
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Run tests using live sites instead of recorded sites.' -l live-sites
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Run tests in chimera mode. Each browser cycle will run a cold and warm test.' -l chimera
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Whether the build is a release build which requires workarounds using MOZ_DISABLE_NONLOCAL_CONNECTIONS to support installing unsigned webextensions. Defaults to False.' -l is-release-build
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Profile the run and out-put the results in $MOZ_UPLOAD_DIR. After talos is finished, profiler.firefox.com will be launched in Firefox so you can analyze the local profiles. To disable auto-launching of profiler.firefox.com, set the DISABLE_PROFILE_LAUNCH=1 env var.' -l gecko-profile
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'How many samples to take with the profiler' -l gecko-profile-entries
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'How frequently to take samples (milliseconds)' -l gecko-profile-interval
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Name of the extra thread to be profiled' -l gecko-profile-thread
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Path to the symbols for the build we are testing' -l symbolsPath
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'How many times to repeat loading the test page (for page load tests); for benchmark tests, this is how many times the benchmark test will be run' -l page-cycles
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'How long to wait (ms) for one page_cycle to complete, before timing out' -l page-timeout
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'How long to wait (ms) after browser start-up before starting the tests' -l post-startup-delay
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'The number of times a cold load test is repeated (for cold load tests only, where the browser is shutdown and restarted between test iterations)' -l browser-cycles
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Project name (try, mozilla-central, etc.)' -l project
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Parameters to add to the test_url query string' -l test-url-params
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Print all available Raptor tests' -l print-tests
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Run Raptor in debug mode (open browser console, limited page-cycles, etc.)' -l debug-mode
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Run without multiple processes (e10s).' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Run Raptor tests without a conditioned profile.' -l no-conditioned-profile
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Device name of mobile device.' -l device-name
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Enable Fission (site isolation) in Gecko.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Set a browser preference. May be used multiple times.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Flag which indicates if Raptor should not offer to install Android APK.' -l noinstall
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Location where Android browser APK was extracted to before installation.' -l installerpath
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Disable performance tuning on android.' -l disable-perf-tuning
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Name of profile scenario.' -l conditioned-profile-scenario
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Enable cold page-load for browsertime tp6' -l cold
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Whether to use browsertime to execute pageload tests' -l browsertime
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'path to Node.js executable' -l browsertime-node
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'path to browsertime.js script' -l browsertime-browsertimejs
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'path to visualmetrics.py script' -l browsertime-vismet-script
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'path to chromedriver executable' -l browsertime-chromedriver
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'records the viewport' -l browsertime-video
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'enables visual metrics' -l browsertime-visualmetrics
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'disable the firefox window recorder' -l browsertime-no-ffwindowrecorder
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'path to ffmpeg executable (for `--video=true`)' -l browsertime-ffmpeg
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'path to geckodriver executable' -l browsertime-geckodriver
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Verbose output' -l verbose
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command raptor ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# raptor-test
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Name of Raptor test to run (can be a top-level suite name i.e. \'--test raptor-speedometer\',\'--test raptor-tp6-1\', or for page-load tests a suite sub-test i.e. \'--test raptor-tp6-google-firefox\')' -s t -l test
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Name of the application we are testing (default: firefox)' -l app
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'path to the browser executable that we are testing' -s b -l binary
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Name of Android activity used to launch the Android app.i.e.: [\'geckoview:org.mozilla.geckoview_example.GeckoViewActivity\', \'refbrow:org.mozilla.reference.browser.BrowserTestActivity\', \'fenix:org.mozilla.fenix.IntentReceiverActivity\', \'chrome-m:com.android.chrome/com.google.android.apps.chrome.Main\']' -s a -l activity
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Name of Android intent action used to launch the Android app.i.e.: [\'geckoview:android.intent.action.MAIN\', \'refbrow:android.intent.action.MAIN\', \'fenix:android.intent.action.VIEW\', \'chrome-m:android.intent.action.VIEW\']' -s i -l intent
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Hostname from which to serve URLs; defaults to 127.0.0.1. The value HOST_IP will cause the value of host to be loaded from the environment variable HOST_IP.' -l host
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Use Raptor to measure power usage on Android browsers (Geckoview Example, Fenix, Refbrow, and Fennec) as well as on Intel-based MacOS machines that have Intel Power Gadget installed.' -l power-test
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Use Raptor to measure memory usage.' -l memory-test
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Use Raptor to measure CPU usage. Currently supported for Android only.' -l cpu-test
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Run tests using live sites instead of recorded sites.' -l live-sites
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Run tests in chimera mode. Each browser cycle will run a cold and warm test.' -l chimera
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Whether the build is a release build which requires workarounds using MOZ_DISABLE_NONLOCAL_CONNECTIONS to support installing unsigned webextensions. Defaults to False.' -l is-release-build
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Profile the run and out-put the results in $MOZ_UPLOAD_DIR. After talos is finished, profiler.firefox.com will be launched in Firefox so you can analyze the local profiles. To disable auto-launching of profiler.firefox.com, set the DISABLE_PROFILE_LAUNCH=1 env var.' -l gecko-profile
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'How many samples to take with the profiler' -l gecko-profile-entries
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'How frequently to take samples (milliseconds)' -l gecko-profile-interval
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Name of the extra thread to be profiled' -l gecko-profile-thread
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Path to the symbols for the build we are testing' -l symbolsPath
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'How many times to repeat loading the test page (for page load tests); for benchmark tests, this is how many times the benchmark test will be run' -l page-cycles
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'How long to wait (ms) for one page_cycle to complete, before timing out' -l page-timeout
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'How long to wait (ms) after browser start-up before starting the tests' -l post-startup-delay
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'The number of times a cold load test is repeated (for cold load tests only, where the browser is shutdown and restarted between test iterations)' -l browser-cycles
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Project name (try, mozilla-central, etc.)' -l project
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Parameters to add to the test_url query string' -l test-url-params
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Print all available Raptor tests' -l print-tests
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Run Raptor in debug mode (open browser console, limited page-cycles, etc.)' -l debug-mode
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Run without multiple processes (e10s).' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Run Raptor tests without a conditioned profile.' -l no-conditioned-profile
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Device name of mobile device.' -l device-name
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Enable Fission (site isolation) in Gecko.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Set a browser preference. May be used multiple times.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Flag which indicates if Raptor should not offer to install Android APK.' -l noinstall
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Location where Android browser APK was extracted to before installation.' -l installerpath
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Disable performance tuning on android.' -l disable-perf-tuning
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Name of profile scenario.' -l conditioned-profile-scenario
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Enable cold page-load for browsertime tp6' -l cold
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Whether to use browsertime to execute pageload tests' -l browsertime
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'path to Node.js executable' -l browsertime-node
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'path to browsertime.js script' -l browsertime-browsertimejs
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'path to visualmetrics.py script' -l browsertime-vismet-script
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'path to chromedriver executable' -l browsertime-chromedriver
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'records the viewport' -l browsertime-video
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'enables visual metrics' -l browsertime-visualmetrics
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'disable the firefox window recorder' -l browsertime-no-ffwindowrecorder
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'path to ffmpeg executable (for `--video=true`)' -l browsertime-ffmpeg
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'path to geckodriver executable' -l browsertime-geckodriver
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Verbose output' -l verbose
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command raptor-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# reftest
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'absolute path to directory containing XRE (probably xulrunner)' -l xre-path
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'absolute path to directory containing breakpad symbols, or the URL of a zip file containing symbols' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'use the given debugger to launch the application' -l debugger
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'pass the given args to the debugger _before_ the application on the command line' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'prevents the test harness from redirecting stdout and stderr for interactive debuggers' -l debugger-interactive
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'absolute path to application, overriding default' -l appname
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'copy specified files/dirs to testing profile' -l extra-profile-file
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'reftest will timeout in specified number of seconds. [default %(default)s].' -l timeout
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'fail if the number of bytes leaked in default processes through refcounted objects (or bytes in classes with MOZ_COUNT_CTOR and MOZ_COUNT_DTOR) is greater than the given number' -l leak-threshold
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'absolute path to directory containing utility programs (xpcshell, ssltunnel, certutil)' -l utility-path
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'how many chunks to split the tests up into' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'which chunk to run between 1 and --total-chunks' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'file to log output to in addition to stdout' -l log-file
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'skip tests marked as slow when running' -l skip-slow-tests
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'ignore the window size, which may cause spurious failures and passes' -l ignore-window-size
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'install the specified extension in the testing profile. The extension file\'s name should be <id>.xpi where <id> is the extension\'s id as indicated in its install.rdf. An optional path can be specified too.' -l install-extension
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'host:port to use when connecting to Marionette' -l marionette
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'sets the given variable in the application\'s environment' -l setenv
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'specifies a regular expression (as could be passed to the JS RegExp constructor) to test against URLs in the reftest manifest; only test items that have a matching test URL will be run.' -l filter
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'run reftests in random order' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'stop running on the first failure. Useful for RR recordings.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'number of times the select test(s) will be executed. Useful for finding intermittent failures.' -l repeat
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'filters tests to run by whether they require focus. Valid values are `all\', `needs-focus\', or `non-needs-focus\'. Defaults to `all\'.' -l focus-filter-mode
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'disables content processes' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Run tests with fission (site isolation) enabled.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'defines an extra user preference' -l setpref
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Path to the reftest extension' -l reftest-extension-path
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Path to the special powers extension' -l special-powers-extension-path
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Delete pending crash reports before running tests.' -l cleanup-crashes
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'The maximum number of attempts to try and recover from a crash before aborting the test run [default 4].' -l max-retries
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Path to add to the sandbox whitelist.' -l sandbox-read-whitelist
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Run tests in verification mode: Run many times in different ways, to see if there are intermittent failures.' -l verify
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Maximum time, in seconds, to run in --verify mode..' -l verify-max-time
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Run tests in headless mode.' -l headless
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Path to source directory' -l topsrcdir
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command reftest ' -d 'run tests in parallel if possible' -l run-tests-in-parallel

# release
complete -c mach -A -n '__fish_mach_complete_subcommand release buglist' -d 'The version being built.' -l version
complete -c mach -A -n '__fish_mach_complete_subcommand release buglist' -d 'The product being built.' -l product
complete -c mach -A -n '__fish_mach_complete_subcommand release buglist' -d 'The repo being built.' -l repo
complete -c mach -A -n '__fish_mach_complete_subcommand release buglist' -d 'The revision being built.' -l revision
complete -c mach -A -n '__fish_mach_complete_command release buglist push-scriptworker-canary send-buglist-email' -d 'Generate list of bugs since the last release.' -a buglist
complete -c mach -A -n '__fish_mach_complete_subcommand release push-scriptworker-canary' -d 'The email address to send notifications to (may be specified more than once).' -l address
complete -c mach -A -n '__fish_mach_complete_subcommand release push-scriptworker-canary' -d 'Scriptworker to run canary for (may be specified more than once).' -l scriptworker
complete -c mach -A -n '__fish_mach_complete_subcommand release push-scriptworker-canary' -d 'Taskcluster secret with ssh-key to use for hg.mozilla.org' -l ssh-key-secret
complete -c mach -A -n '__fish_mach_complete_command release buglist push-scriptworker-canary send-buglist-email' -d 'Push tasks to try, to test new scriptworker deployments.' -a push-scriptworker-canary
complete -c mach -A -n '__fish_mach_complete_subcommand release send-buglist-email' -d 'The email address to send the bug list to (may be specified more than once.' -l address
complete -c mach -A -n '__fish_mach_complete_subcommand release send-buglist-email' -d 'The version being built.' -l version
complete -c mach -A -n '__fish_mach_complete_subcommand release send-buglist-email' -d 'The product being built.' -l product
complete -c mach -A -n '__fish_mach_complete_subcommand release send-buglist-email' -d 'The repo being built.' -l repo
complete -c mach -A -n '__fish_mach_complete_subcommand release send-buglist-email' -d 'The revision being built.' -l revision
complete -c mach -A -n '__fish_mach_complete_subcommand release send-buglist-email' -d 'The build number' -l build-number
complete -c mach -A -n '__fish_mach_complete_subcommand release send-buglist-email' -d 'The task group of the build.' -l task-group-id
complete -c mach -A -n '__fish_mach_complete_command release buglist push-scriptworker-canary send-buglist-email' -d 'Send an email with the bugs since the last release.' -a send-buglist-email

# release-history
complete -c mach -A -n '__fish_mach_complete_command release-history ' -d 'The gecko project branch used in balrog, such as mozilla-central, release, maple' -s b -l branch
complete -c mach -A -n '__fish_mach_complete_command release-history ' -d 'The product identifier, such as \'Firefox\'' -l product

# remote
complete -c mach -A -n '__fish_mach_complete_subcommand remote vendor-puppeteer' -d 'The (possibly remote) repository to clone from.' -l repository
complete -c mach -A -n '__fish_mach_complete_subcommand remote vendor-puppeteer' -d 'The commit or tag object name to check out.' -l commitish
complete -c mach -A -n '__fish_mach_complete_command remote vendor-puppeteer' -d 'Pull in latest changes of the Puppeteer client.' -a vendor-puppeteer

# repackage
complete -c mach -A -n '__fish_mach_complete_subcommand repackage dmg' -d 'Input filename' -l input -s i
complete -c mach -A -n '__fish_mach_complete_subcommand repackage dmg' -d 'Output filename' -l output -s o
complete -c mach -A -n '__fish_mach_complete_command repackage dmg installer mar msi' -d 'Repackage a tar file into a .dmg for OSX' -a dmg
complete -c mach -A -n '__fish_mach_complete_subcommand repackage installer' -d 'The .tag file used to build the installer' -l tag
complete -c mach -A -n '__fish_mach_complete_subcommand repackage installer' -d 'setup.exe file inside the installer' -l setupexe
complete -c mach -A -n '__fish_mach_complete_subcommand repackage installer' -d 'Optional package .zip for building a full installer' -l package
complete -c mach -A -n '__fish_mach_complete_subcommand repackage installer' -d 'Output filename' -l output -s o
complete -c mach -A -n '__fish_mach_complete_subcommand repackage installer' -d 'Name of the package being rebuilt' -l package-name
complete -c mach -A -n '__fish_mach_complete_subcommand repackage installer' -d 'Path to the self-extraction stub.' -l sfx-stub
complete -c mach -A -n '__fish_mach_complete_subcommand repackage installer' -d 'Run UPX on the self-extraction stub.' -l use-upx
complete -c mach -A -n '__fish_mach_complete_command repackage dmg installer mar msi' -d 'Repackage into a Windows installer exe' -a installer
complete -c mach -A -n '__fish_mach_complete_subcommand repackage mar' -d 'Input filename' -l input -s i
complete -c mach -A -n '__fish_mach_complete_subcommand repackage mar' -d 'Mar binary path' -l mar
complete -c mach -A -n '__fish_mach_complete_subcommand repackage mar' -d 'Output filename' -l output -s o
complete -c mach -A -n '__fish_mach_complete_subcommand repackage mar' -d 'The archtecture you are building.' -l arch
complete -c mach -A -n '__fish_mach_complete_subcommand repackage mar' -d 'Mar channel id' -l mar-channel-id
complete -c mach -A -n '__fish_mach_complete_command repackage dmg installer mar msi' -d 'Repackage into complete MAR file' -a mar
complete -c mach -A -n '__fish_mach_complete_subcommand repackage msi' -d 'The wsx file used to build the installer' -l wsx
complete -c mach -A -n '__fish_mach_complete_subcommand repackage msi' -d 'The Firefox version used to create the installer' -l version
complete -c mach -A -n '__fish_mach_complete_subcommand repackage msi' -d 'The locale of the installer' -l locale
complete -c mach -A -n '__fish_mach_complete_subcommand repackage msi' -d 'The archtecture you are building.' -l arch
complete -c mach -A -n '__fish_mach_complete_subcommand repackage msi' -d 'setup.exe installer' -l setupexe
complete -c mach -A -n '__fish_mach_complete_subcommand repackage msi' -d 'location of candle binary' -l candle
complete -c mach -A -n '__fish_mach_complete_subcommand repackage msi' -d 'location of light binary' -l light
complete -c mach -A -n '__fish_mach_complete_subcommand repackage msi' -d 'Output filename' -l output -s o
complete -c mach -A -n '__fish_mach_complete_command repackage dmg installer mar msi' -d 'Repackage into a MSI' -a msi

# resource-usage
complete -c mach -A -n '__fish_mach_complete_command resource-usage ' -d 'Address the HTTP server should listen on.' -l address
complete -c mach -A -n '__fish_mach_complete_command resource-usage ' -d 'Port number the HTTP server should listen on.' -l port
complete -c mach -A -n '__fish_mach_complete_command resource-usage ' -d 'Web browser to automatically open. See webbrowser Python module.' -l browser
complete -c mach -A -n '__fish_mach_complete_command resource-usage ' -d 'URL of JSON document to display' -l url

# run
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Run a packaged build.' -l packaged
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Do not pass the --no-remote argument by default.' -l remote -s r
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Do not pass the --foreground argument by default on Mac.' -l background -s b
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Do not pass the --profile argument by default.' -l noprofile -s n
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Run the program with electrolysis disabled.' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Run the program with the crash reporter enabled.' -l enable-crash-reporter
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Run the program with fission (site isolation) enabled.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Set the specified pref before starting the program. Can be set multiple times. Prefs can also be set in ~/.mozbuild/machrc in the [runprefs] section - see `./mach settings` for more information.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Run the program using a new temporary profile created inside the objdir.' -l temp-profile
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'On macOS, run the program using the open(1) command. Per open(1), the browser is launched "just as if you had double-clicked the file\'s icon". The browser can not be launched under a debugger with this option.' -l macos-open
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Enable the debugger. Not specifying a --debugger option will result in the default debugger being used.' -l debug
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Name of debugger to use.' -l debugger
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Command-line arguments to pass to the debugger itself; split as the Bourne shell would.' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Enable DMD. The following arguments have no effect without this.' -l dmd
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Profiling mode. The default is \'dark-matter\'.' -l mode
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Allocation stack trace coverage. The default is \'partial\'.' -l stacks
complete -c mach -A -n '__fish_mach_complete_command run ' -d 'Show stats when doing dumps.' -l show-dump-stats

# run-condprofile
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Firefox Binary' -l firefox
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Scenario to use' -l scenario
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Existing profile Dir' -l profile
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Profile customization to use' -l customization
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Don\'t use headless mode' -l visible
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Archives local dir' -l archives-dir
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Create from scratch' -l force-new
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Errors out immediatly on a scenario failure' -l strict
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Path to the geckodriver binary' -l geckodriver
complete -c mach -A -n '__fish_mach_complete_command run-condprofile ' -d 'Name of the device' -l device-name

# rusttests

# settings
complete -c mach -A -n '__fish_mach_complete_command settings ' -d 'Show settings in a concise list' -s l -l list

# show-log

# static-analysis
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis autotest' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis autotest' -d 'Generate the baseline for the regression test. Based on this baseline we will test future results.' -l dump-results -s d
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis autotest' -d 'Use a pre-aquired in-tree clang-tidy package from the automation env. This option is only valid on automation environments.' -l intree-tool -s i
complete -c mach -A -n '__fish_mach_complete_command static-analysis autotest check check-coverity check-java check-syntax clear-cache install print-checks' -d 'Run the auto-test suite in order to determine that the analysis did not regress.' -a autotest
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Static analysis checks to enable.  By default, this enables only checks that are published here: https://mzl.la/2DRHeTh, but can be any clang-tidy checks syntax.' -l checks -s c
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Number of concurrent jobs to run. Default is the number of CPUs.' -l jobs -s j
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Strip NUM leading components from file names in diff mode.' -l strip -s p
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Try to autofix errors detected by clang-tidy checkers.' -l fix -s f
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Regular expression matching the names of the headers to output diagnostics from. Diagnostics from the main file of each translation unit are always displayed' -l header-filter -s h-f
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Write clang-tidy output in a file' -l output -s o
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Output format to write in a file' -l format
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check' -d 'Run static analysis checks on outgoing files from mercurial repository' -l outgoing
complete -c mach -A -n '__fish_mach_complete_command static-analysis autotest check check-coverity check-java check-syntax clear-cache install print-checks' -d 'Run the checks using the helper tool' -a check
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-coverity' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-coverity' -d 'Write coverity output translated to json output in a file' -l output -s o
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-coverity' -d 'Path where to write coverity results as cov-results.json. If no path is specified the default path from the coverity working directory, ~./mozbuild/coverity is used.' -l coverity_output_path -s co
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-coverity' -d 'Run coverity on outgoing files from mercurial or git repository' -l outgoing
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-coverity' -d 'Run a full build for coverity analisys.' -l full-build
complete -c mach -A -n '__fish_mach_complete_command static-analysis autotest check check-coverity check-java check-syntax clear-cache install print-checks' -d 'Run coverity static-analysis tool on the given files. Can only be run by automation! It\'s result is stored as an json file on the artifacts server.' -a check-coverity
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-java' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-java' -d 'Static analysis checks to enable.' -l checks -s c
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-java' -d 'Number of concurrent jobs to run. Default is the number of CPUs.' -l jobs -s j
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-java' -d 'Which gradle tasks to use to compile the java codebase.' -l task -s t
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-java' -d 'Run infer checks on outgoing files from repository' -l outgoing
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-java' -d 'Write infer json output in a file' -l output
complete -c mach -A -n '__fish_mach_complete_command static-analysis autotest check check-coverity check-java check-syntax clear-cache install print-checks' -d 'Run infer on the java codebase.' -a check-java
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis check-syntax' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_command static-analysis autotest check check-coverity check-java check-syntax clear-cache install print-checks' -d 'Run the check-syntax for C/C++ files based on `compile_commands.json`' -a check-syntax
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis clear-cache' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_command static-analysis autotest check check-coverity check-java check-syntax clear-cache install print-checks' -d 'Delete local helpers and reset static analysis helper tool cache' -a clear-cache
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis install' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis install' -d 'Skip all local caches to force re-fetching the helper tool.' -l skip-cache
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis install' -d 'Force re-install even though the tool exists in mozbuild.' -l force
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis install' -d 'Download only clang based tool.' -l minimal-install
complete -c mach -A -n '__fish_mach_complete_command static-analysis autotest check check-coverity check-java check-syntax clear-cache install print-checks' -d 'Install the static analysis helper tool' -a install
complete -c mach -A -n '__fish_mach_complete_subcommand static-analysis print-checks' -d 'Print verbose output.' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_command static-analysis autotest check check-coverity check-java check-syntax clear-cache install print-checks' -d 'Print a list of the static analysis checks performed by default' -a print-checks

# talos-test
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Title of the test run' -s t -l title
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Amount of time allowed for the browser to cleanly close' -l browserWait
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'List of tests to run, separated by \':\' (ex. damp:tart)' -s a -l activeTests
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Suite to use (instead of --activeTests)' -l suite
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Name of the subtest(s) to run (works only on DAMP)' -l subtests
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Collect mainthread IO data from the browser by setting an environment variable' -l mainthread
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'wait for MozAfterPaint event before recording the time' -l mozAfterPaint
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Also report the first paint value in supported tests' -l firstPaint
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'use Hero elementtiming attribute to record the time' -l useHero
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Also report the user ready value in supported tests' -l userReady
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d '(Deprecated - Use --gecko-profile instead.) Profile the run and output the results in $MOZ_UPLOAD_DIR.' -l spsProfile
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d '(Deprecated - Use --gecko-profile-interval instead.) How frequently to take samples (ms)' -l spsProfileInterval
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d '(Deprecated - Use --gecko-profile-entries instead.) How many samples to take with the profiler' -l spsProfileEntries
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Profile the run and output the results in $MOZ_UPLOAD_DIR. After talos is finished, profiler.firefox.com will be launched in Firefox so you can analyze the local profiles. To disable auto-launching of profiler.firefox.com set the DISABLE_PROFILE_LAUNCH=1 env var.' -l gecko-profile
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'How frequently to take samples (ms)' -l gecko-profile-interval
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'How many samples to take with the profiler' -l gecko-profile-entries
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Extension to install while running' -l extension
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Run tp tests as tp_fast' -l fast
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Path to the symbols for the build we are testing' -l symbolsPath
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Path to windows performance tool xperf.exe' -l xperf_path
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Time to wait for the browser to output to the log file' -l test_timeout
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Filename to store the errors found during the test. Currently used for xperf only.' -l errorFile
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Set a browser preference. May be used multiple times.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Wait for firstNonBlankPaint event before recording the time' -l firstNonBlankPaint
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Wait for the first page of a PDF to be rendered' -l pdfPaint
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'DEPRECATED' -l webServer
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'number of browser cycles to run' -l cycles
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'manifest file to test' -l tpmanifest
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'number of pageloader cycles to run' -l tpcycles
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'number of milliseconds to wait for a load event after calling loadURI before timing out' -l tptimeout
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'number of pageloader cycles to run for each page in the manifest' -l tppagecycles
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Do not download the talos test pagesets' -l no-download
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Specify the hg revision or sourcestamp for the changeset we are testing.  This will use the value found in application.ini if it is not specified.' -l sourcestamp
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Specify the url for the repository we are testing. This will use the value found in application.ini if it is not specified.' -l repository
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Will post to the specified framework for Perfherder. Default "talos".  Used primarily for experiments on new platforms' -l framework
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'print available tests' -l print-tests
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'list available suites' -l print-suites
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'If given, it disables uploading of talos results.' -l no-upload-results
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'If given, run Stylo with a certain number of threads' -l stylo-threads
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Downloads a profile from TaskCluster and uses it' -l profile
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Enable the debugger. Not specifying a --debugger option willresult in the default debugger being used.' -l debug
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Name of debugger to use.' -l debugger
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Command-line arguments to pass to the debugger itself; splitas the Bourne shell would.' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Remove any existing ccov gcda output files after browser initialization but before starting the tests. NOTE: Currently only supported in production.' -l code-coverage
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Enable Fission (site isolation) in Gecko.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command talos-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# taskcluster-build-image
complete -c mach -A -n '__fish_mach_complete_command taskcluster-build-image ' -d 'tag that the image should be built as.' -s t -l tag
complete -c mach -A -n '__fish_mach_complete_command taskcluster-build-image ' -d 'File name the context tarball should be written to.with this option it will only build the context.tar.' -l context-only

# taskcluster-load-image
complete -c mach -A -n '__fish_mach_complete_command taskcluster-load-image ' -d 'Load the image at public/image.tar.zst in this task, rather than searching the index' -l task-id
complete -c mach -A -n '__fish_mach_complete_command taskcluster-load-image ' -d 'tag that the image should be loaded as. If not image will be loaded with tag from the tarball' -s t -l tag

# taskgraph
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph action-callback' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Run action callback used by action tasks' -a action-callback
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph actions' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph actions' -d 'suppress all logging output' -l quiet -s q
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph actions' -d 'include debug-level logging output' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph actions' -d 'parameters file (.yml or .json; see `taskcluster/docs/parameters.rst`)`' -l parameters -s p
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Write actions.json to stdout' -a actions
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Provide a pointer to the new `.cron.yml` handler.' -a cron
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'URL for "base" repository to clone' -l base-repository
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'URL for "head" repository to fetch revision from' -l head-repository
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'Reference (this is same as rev usually for hg)' -l head-ref
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'Commit revision to use from head repository' -l head-rev
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'URL for "base" comm-* repository to clone' -l comm-base-repository
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'URL for "head" comm-* repository to fetch revision from' -l comm-head-repository
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'comm-* Reference (this is same as rev usually for hg)' -l comm-head-ref
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'Commit revision to use from head comm-* repository' -l comm-head-rev
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'Project to use for creating task graph. Example: --project=try' -l project
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d '' -l pushlog-id
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d '' -l pushdate
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'email address of who owns this graph' -l owner
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'SCM level of this repository' -l level
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'method for selecting the target tasks to generate' -l target-tasks-method
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'If specified, this indicates whether the target tasks are eligible for optimization. Otherwise, the default for the project is used.' -l optimize-target-tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'path to try task configuration file' -l try-task-config-file
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'the tasks_for value used to generate this task' -l tasks-for
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'Whether tasks from the on-push graph should be re-used in this graph. This allows cron graphs to avoid rebuilding jobs that were built on-push.' -l include-push-tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph decision' -d 'Kinds that should not be re-used from the on-push graph.' -l rebuild-kind
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Run the decision task' -a decision
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'file path to store generated output.' -s o -l output-file
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'enable fast task generation for local debugging.' -s F -l fast
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'only return tasks that are of the given kind, or their dependencies.' -l target-kind
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'only return tasks with labels matching this regular expression.' -l tasks-regex -l tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'do not remove tasks from the graph that are found in the index (a.k.a. optimize the graph)' -l no-optimize
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'parameters file (.yml or .json; see `taskcluster/docs/parameters.rst`)`' -l parameters -s p
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'Output the label for each task in the task graph (default)' -l labels -s L
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'Output task graph as a JSON object' -l json -s J
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'include debug-level logging output' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'suppress all logging output' -l quiet -s q
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph full' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Show the full taskgraph' -a full
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'file path to store generated output.' -s o -l output-file
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'enable fast task generation for local debugging.' -s F -l fast
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'only return tasks that are of the given kind, or their dependencies.' -l target-kind
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'only return tasks with labels matching this regular expression.' -l tasks-regex -l tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'do not remove tasks from the graph that are found in the index (a.k.a. optimize the graph)' -l no-optimize
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'parameters file (.yml or .json; see `taskcluster/docs/parameters.rst`)`' -l parameters -s p
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'Output the label for each task in the task graph (default)' -l labels -s L
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'Output task graph as a JSON object' -l json -s J
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'include debug-level logging output' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'suppress all logging output' -l quiet -s q
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph morphed' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Show the morphed taskgraph' -a morphed
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'file path to store generated output.' -s o -l output-file
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'enable fast task generation for local debugging.' -s F -l fast
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'only return tasks that are of the given kind, or their dependencies.' -l target-kind
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'only return tasks with labels matching this regular expression.' -l tasks-regex -l tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'do not remove tasks from the graph that are found in the index (a.k.a. optimize the graph)' -l no-optimize
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'parameters file (.yml or .json; see `taskcluster/docs/parameters.rst`)`' -l parameters -s p
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'Output the label for each task in the task graph (default)' -l labels -s L
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'Output task graph as a JSON object' -l json -s J
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'include debug-level logging output' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'suppress all logging output' -l quiet -s q
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph optimized' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Show the optimized taskgraph' -a optimized
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'file path to store generated output.' -s o -l output-file
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'enable fast task generation for local debugging.' -s F -l fast
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'only return tasks that are of the given kind, or their dependencies.' -l target-kind
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'only return tasks with labels matching this regular expression.' -l tasks-regex -l tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'do not remove tasks from the graph that are found in the index (a.k.a. optimize the graph)' -l no-optimize
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'parameters file (.yml or .json; see `taskcluster/docs/parameters.rst`)`' -l parameters -s p
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'Output the label for each task in the task graph (default)' -l labels -s L
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'Output task graph as a JSON object' -l json -s J
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'include debug-level logging output' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'suppress all logging output' -l quiet -s q
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Show the target task set' -a target
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'file path to store generated output.' -s o -l output-file
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'enable fast task generation for local debugging.' -s F -l fast
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'only return tasks that are of the given kind, or their dependencies.' -l target-kind
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'only return tasks with labels matching this regular expression.' -l tasks-regex -l tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'do not remove tasks from the graph that are found in the index (a.k.a. optimize the graph)' -l no-optimize
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'parameters file (.yml or .json; see `taskcluster/docs/parameters.rst`)`' -l parameters -s p
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'Output the label for each task in the task graph (default)' -l labels -s L
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'Output task graph as a JSON object' -l json -s J
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'include debug-level logging output' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'suppress all logging output' -l quiet -s q
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph target-graph' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Show the target taskgraph' -a target-graph
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'file path to store generated output.' -s o -l output-file
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'enable fast task generation for local debugging.' -s F -l fast
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'only return tasks that are of the given kind, or their dependencies.' -l target-kind
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'only return tasks with labels matching this regular expression.' -l tasks-regex -l tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'do not remove tasks from the graph that are found in the index (a.k.a. optimize the graph)' -l no-optimize
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'parameters file (.yml or .json; see `taskcluster/docs/parameters.rst`)`' -l parameters -s p
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'Output the label for each task in the task graph (default)' -l labels -s L
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'Output task graph as a JSON object' -l json -s J
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'include debug-level logging output' -l verbose -s v
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'suppress all logging output' -l quiet -s q
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph tasks' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Show all tasks in the taskgraph' -a tasks
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph test-action-callback' -d 'root of the taskgraph definition relative to topsrcdir' -l root -s r
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph test-action-callback' -d 'parameters file (.yml or .json; see `taskcluster/docs/parameters.rst`)`' -l parameters -s p
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph test-action-callback' -d 'TaskId to which the action applies' -l task-id
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph test-action-callback' -d 'TaskGroupId to which the action applies' -l task-group-id
complete -c mach -A -n '__fish_mach_complete_subcommand taskgraph test-action-callback' -d 'Action input (.yml or .json)' -l input
complete -c mach -A -n '__fish_mach_complete_command taskgraph action-callback actions cron decision full morphed optimized target target-graph tasks test-action-callback' -d 'Run an action callback in a testing mode' -a test-action-callback

# telemetry-tests-client
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'path to gecko executable to launch before running the test' -l binary
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'host:port of running Gecko instance to connect to' -l address
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'If no --address is given, then the harness will launch an emulator. (See Remote options group.) If --address is given, then the harness assumes you are running an emulator already, and will launch gecko app on that emulator.' -l emulator
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'application to use. see marionette_driver.geckoinstance' -l app
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'specify a command line argument to be passed onto the application' -l app-arg
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'profile to use when launching the gecko process. If not passed, then a profile will be constructed and used' -l profile
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'set a browser preference; repeat for multiple preferences.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'read preferences from a JSON or INI file. For INI, use \'file.ini:section\' to specify a particular section.' -l preferences
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'addon to install; repeat for multiple addons.' -l addon
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'number of times to repeat the test(s)' -l repeat
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Run tests repeatedly and stop on the first time a test fails. Default cap is 30 runs, which can be overwritten with the --repeat parameter.' -l run-until-failure
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'path to a json file with any test data required' -l testvars
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'absolute path to directory containing breakpad symbols, or the url of a zip file containing symbols' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Set the global timeout for marionette socket operations. Default: %(default)ss.' -l socket-timeout
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'the max number of seconds to wait for a Marionette connection after launching a binary. Default: %(default)ss.' -l startup-timeout
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'run tests in a random order' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Use given seed to shuffle tests' -l shuffle-seed
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'how many chunks to split the tests up into' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'which chunk to run' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'url to a webserver or path to a document root from which content resources are served (default: /Users/johann/Development/mozilla-central/testing/marionette/harness/marionette_harness/www).' -l server-root
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Define the path to store log file. If the path is a directory, the real log file will be created given the format gecko-(timestamp).log. If it is a file, if will be used directly. \'-\' may be passed to write to stdout. Default: \'./gecko.log\'' -l gecko-log
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Define the name to associate with the logger used' -l logger-name
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Enable the jsdebugger for marionette javascript.' -l jsdebugger
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Enable python post-mortem debugger when a test fails. Pass in the debugger you want to use, eg pdb or ipdb.' -l pydebugger
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Enable Fission (site isolation) in Gecko.' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Run tests in headless mode.' -s z -l headless
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Filter out tests that don\'t have the given tag. Can be used multiple times in which case the test must contain at least one of the given tags.' -l tag
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Path to directory for Marionette output. (Default: .) (Default profile dest: TMP)' -l workspace
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Increase verbosity to include debug messages with -v, and trace messages with -vv.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Path to emulator binary. By default mozrunner uses `which emulator`' -l emulator-binary
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Path to the adb. By default mozrunner uses `which adb`' -l adb
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Name of an AVD available in your environment.See mozrunner.FennecEmulatorRunner' -l avd
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Path to avd parent directory' -l avd-home
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Serial ID to connect to as seen in `adb devices`,e.g emulator-5444' -l device
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Name of Android package, e.g. org.mozilla.fennec' -l package
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command telemetry-tests-client ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# test
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Specify a debugger to use.' -l debugger
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer

# test-info
complete -c mach -A -n '__fish_mach_complete_subcommand test-info long-tasks' -d 'Report for named branches (default: mozilla-central,autoland)' -l branches
complete -c mach -A -n '__fish_mach_complete_subcommand test-info long-tasks' -d 'Start date (YYYY-MM-DD)' -l start
complete -c mach -A -n '__fish_mach_complete_subcommand test-info long-tasks' -d 'End date (YYYY-MM-DD)' -l end
complete -c mach -A -n '__fish_mach_complete_subcommand test-info long-tasks' -d 'Count tasks exceeding this percentage of max-run-time.' -l max-threshold-pct
complete -c mach -A -n '__fish_mach_complete_subcommand test-info long-tasks' -d 'Report tasks exceeding this percentage of long tasks.' -l filter-threshold-pct
complete -c mach -A -n '__fish_mach_complete_subcommand test-info long-tasks' -d 'Enable debug logging.' -l verbose
complete -c mach -A -n '__fish_mach_complete_command test-info long-tasks report report-diff tests' -d 'Find tasks approaching their taskcluster max-run-time.' -a long-tasks
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Comma-separated list of Bugzilla components. eg. Testing::General,Core::WebVR' -l components
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Limit results to tests of the specified flavor (eg. "xpcshell").' -l flavor
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Limit results to tests of the specified subsuite (eg. "devtools").' -l subsuite
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Include test manifests in report.' -l show-manifests
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Include individual tests in report.' -l show-tests
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Include summary in report.' -l show-summary
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Include list of manifest annotation conditions in report.' -l show-annotations
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Include additional data from ActiveData, like run times and counts.' -l show-activedata
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Comma-separated list of value regular expressions to filter on; displayed tests contain all specified values.' -l filter-values
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Comma-separated list of test keys to filter on, like "skip-if"; only these fields will be searched for filter-values.' -l filter-keys
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Do not categorize by bugzilla component.' -l no-component-report
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Path to report file.' -l output-file
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Query ActiveData for named branches (default: mozilla-central,autoland)' -l branches
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Query ActiveData for specified number of days' -l days
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report' -d 'Enable debug logging.' -l verbose
complete -c mach -A -n '__fish_mach_complete_command test-info long-tasks report report-diff tests' -d 'Generate a json report of test manifests and/or tests categorized by Bugzilla component and optionally filtered by path, component, and/or manifest annotations.' -a report
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report-diff' -d 'The first (earlier) report file; path to local file or url.' -l before
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report-diff' -d 'The second (later) report file; path to local file or url.' -l after
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report-diff' -d 'Path to report file to be written. If not specified, reportwill be written to standard output.' -l output-file
complete -c mach -A -n '__fish_mach_complete_subcommand test-info report-diff' -d 'Enable debug logging.' -l verbose
complete -c mach -A -n '__fish_mach_complete_command test-info long-tasks report report-diff tests' -d 'Compare two reports generated by "test-info reports".' -a report-diff
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'Report for named branches (default: mozilla-central,autoland)' -l branches
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'Start date (YYYY-MM-DD)' -l start
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'End date (YYYY-MM-DD)' -l end
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'Retrieve and display general test information.' -l show-info
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'Retrieve and display ActiveData test result summary.' -l show-results
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'Retrieve and display ActiveData test duration summary.' -l show-durations
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'Retrieve and display ActiveData test task names.' -l show-tasks
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'Retrieve and display related Bugzilla bugs.' -l show-bugs
complete -c mach -A -n '__fish_mach_complete_subcommand test-info tests' -d 'Enable debug logging.' -l verbose
complete -c mach -A -n '__fish_mach_complete_command test-info long-tasks report report-diff tests' -d 'Display historical test result summary for named tests.' -a tests

# tps-build
complete -c mach -A -n '__fish_mach_complete_command tps-build ' -d 'Where to write add-on.' -l dest

# try
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Save selection for future use with --preset.' -l save
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Load a saved selection.' -l preset
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'List available preset selections.' -l list-presets
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Edit the preset file.' -l edit-presets
complete -c mach -A -n '__fish_mach_complete_subcommand try again' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand try again' -d 'Index of entry in the history to re-push, where \'0\' is the most recent (default 0). Use --list to display indices.' -l index
complete -c mach -A -n '__fish_mach_complete_subcommand try again' -d 'Display history and exit' -l list
complete -c mach -A -n '__fish_mach_complete_subcommand try again' -d 'Like --list, but display selected tasks  for each history entry, up to 10. Repeat to display all selected tasks.' -l list-tasks
complete -c mach -A -n '__fish_mach_complete_subcommand try again' -d 'Remove all history and exit' -l purge
complete -c mach -A -n '__fish_mach_complete_subcommand try again' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_subcommand try again' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_subcommand try again' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Schedule a previously generated (non try syntax) push again.' -a again
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Override the default optimization strategy. Valid values are the experimental strategies defined at the bottom of `taskcluster/taskgraph/optimize/__init__.py`.' -l strategy
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Force artifact builds where possible.' -l artifact
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Disable artifact builds even if being used locally.' -l no-artifact
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Set an environment variable, of the form FOO=BAR. Can be passed in multiple times.' -l env
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Run at a higher priority than most try jobs (chemspills only).' -l chemspill-prio
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Don\'t run PGO builds' -l disable-pgo
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Override the worker pool used for a given taskgraph worker alias. The argument should be `<alias>=<worker-pool>`. Can be specified multiple times.' -l worker-override
complete -c mach -A -n '__fish_mach_complete_subcommand try auto' -d 'Override the worker pool used for a given taskgraph worker alias, by appending a suffix to the work-pool. The argument should be `<alias>=<suffix>`. Can be specified multiple times.' -l worker-suffix
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Automatically determine which tasks to run. This runs the same set of tasks that would be run on autoland. This selector is EXPERIMENTAL.' -a auto
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Use the full set of tasks as input to fzf (instead of target tasks).' -l full
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Use the given parameters.yml to generate tasks, defaults to a default set of parameters' -s p -l parameters
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Force artifact builds where possible.' -l artifact
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Disable artifact builds even if being used locally.' -l no-artifact
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Use browsertime during Raptor tasks.' -l browsertime
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Run at a higher priority than most try jobs (chemspills only).' -l chemspill-prio
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Don\'t run PGO builds' -l disable-pgo
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Set an environment variable, of the form FOO=BAR. Can be passed in multiple times.' -l env
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Create and upload a gecko profile during talos/raptor tasks.' -l gecko-profile
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Opt-in to analysis by the Pernosco debugging service.' -l pernosco
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Opt-out of the Pernosco debugging service (if you are on the whitelist).' -l no-pernosco
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Rebuild all selected tasks the specified number of times.' -l rebuild
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Override the worker pool used for a given taskgraph worker alias. The argument should be `<alias>=<worker-pool>`. Can be specified multiple times.' -l worker-override
complete -c mach -A -n '__fish_mach_complete_subcommand try chooser' -d 'Override the worker pool used for a given taskgraph worker alias, by appending a suffix to the work-pool. The argument should be `<alias>=<suffix>`. Can be specified multiple times.' -l worker-suffix
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Schedule tasks by selecting them from a web interface.' -a chooser
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Select tasks on try using coverage data' -a coverage
complete -c mach -A -n '__fish_mach_complete_subcommand try empty' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand try empty' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_subcommand try empty' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_subcommand try empty' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Push to try without scheduling any tasks.' -a empty
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Use the given query instead of entering the selection interface. Equivalent to typing <query><ctrl-a><enter> from the interface. Specifying multiple times schedules the union of computed tasks.' -s q -l query
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Force running fzf interactively even when using presets or queries with -q/--query.' -s i -l interactive
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'When specifying queries on the command line with -q/--query, use the intersection of tasks rather than the union. This is especially useful for post filtering presets.' -s x -l and
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Enable exact match mode. Terms will use an exact match by default, and terms prefixed with \' will become fuzzy.' -s e -l exact
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Update fzf before running.' -s u -l update
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Show task duration estimates.' -s s -l show-estimates
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Some tasks run on mozilla-central but are filtered out of the default list due to resource constraints. This flag disables this filtering.' -l disable-target-task-filter
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Use the full set of tasks as input to fzf (instead of target tasks).' -l full
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Use the given parameters.yml to generate tasks, defaults to a default set of parameters' -s p -l parameters
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Save selection for future use with --preset.' -l save
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Load a saved selection.' -l preset
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'List available preset selections.' -l list-presets
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Edit the preset file.' -l edit-presets
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Force artifact builds where possible.' -l artifact
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Disable artifact builds even if being used locally.' -l no-artifact
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Use browsertime during Raptor tasks.' -l browsertime
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Run at a higher priority than most try jobs (chemspills only).' -l chemspill-prio
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Don\'t run PGO builds' -l disable-pgo
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Set an environment variable, of the form FOO=BAR. Can be passed in multiple times.' -l env
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Create and upload a gecko profile during talos/raptor tasks.' -l gecko-profile
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Opt-in to analysis by the Pernosco debugging service.' -l pernosco
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Opt-out of the Pernosco debugging service (if you are on the whitelist).' -l no-pernosco
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Rebuild all selected tasks the specified number of times.' -l rebuild
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Additional route to add to the tasks (note: these will not be added to the decision task)' -l route
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Override the worker pool used for a given taskgraph worker alias. The argument should be `<alias>=<worker-pool>`. Can be specified multiple times.' -l worker-override
complete -c mach -A -n '__fish_mach_complete_subcommand try fuzzy' -d 'Override the worker pool used for a given taskgraph worker alias, by appending a suffix to the work-pool. The argument should be `<alias>=<suffix>`. Can be specified multiple times.' -l worker-suffix
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Select tasks on try using a fuzzy finder' -a fuzzy
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'The version number to use for the staging release.' -s v -l version
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Migration to run for the release (can be specified multiple times).' -l migration
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Don\'t build a limited number of locales in the staging release.' -l no-limit-locales
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Which tasks to run on-push.' -l tasks
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Don\'t run PGO builds' -l disable-pgo
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Override the worker pool used for a given taskgraph worker alias. The argument should be `<alias>=<worker-pool>`. Can be specified multiple times.' -l worker-override
complete -c mach -A -n '__fish_mach_complete_subcommand try release' -d 'Override the worker pool used for a given taskgraph worker alias, by appending a suffix to the work-pool. The argument should be `<alias>=<suffix>`. Can be specified multiple times.' -l worker-suffix
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Push the current tree to try, configured for a staging release.' -a release
complete -c mach -A -n '__fish_mach_complete_subcommand try scriptworker' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand try scriptworker' -d 'Release type to run' -l release-type
complete -c mach -A -n '__fish_mach_complete_subcommand try scriptworker' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_subcommand try scriptworker' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_subcommand try scriptworker' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_subcommand try scriptworker' -d 'Override the worker pool used for a given taskgraph worker alias. The argument should be `<alias>=<worker-pool>`. Can be specified multiple times.' -l worker-override
complete -c mach -A -n '__fish_mach_complete_subcommand try scriptworker' -d 'Override the worker pool used for a given taskgraph worker alias, by appending a suffix to the work-pool. The argument should be `<alias>=<suffix>`. Can be specified multiple times.' -l worker-suffix
complete -c mach -A -n '__fish_mach_complete_subcommand try scriptworker' -d 'Additional route to add to the tasks (note: these will not be added to the decision task)' -l route
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Run scriptworker tasks against a recent release.' -a scriptworker
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Build types to run (d for debug, o for optimized).' -s b -l build
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Platforms to run (required if not found in the environment as AUTOTRY_PLATFORM_HINT).' -s p -l platform
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Test suites to run in their entirety.' -s u -l unittests
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Talos suites to run.' -s t -l talos
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Job tasks to run.' -s j -l jobs
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Restrict tests to the given tag (may be specified multiple times).' -l tag
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'When -u and paths are supplied run only the intersection of the tests specified by the two arguments.' -l and
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Disable artifact builds even if --enable-artifact-builds is set in the mozconfig.' -l no-artifact
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Print detailed information about the resulting test selection and commands performed.' -s v -l verbose
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Use the specified commit message, or create it in your $EDITOR if blank. Defaults to computed message.' -s m -l message
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Do not push to try as a result of running this command (if specified this command will only print calculated try syntax and selection info).' -l no-push
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Push despite a closed try tree' -l closed-tree
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Save selection for future use with --preset.' -l save
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Load a saved selection.' -l preset
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'List available preset selections.' -l list-presets
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Edit the preset file.' -l edit-presets
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Re-trigger all test jobs (up to 20 times)' -l rebuild
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Re-trigger all talos jobs' -l rebuild-talos
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Allow ssh-like access to running test containers' -l interactive
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Do not retrigger failed tests' -l no-retry
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Set the corresponding variable in the test environment for applicable harnesses.' -l setenv
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Request failure emails only' -s f
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Request failure emails only' -l failure-emails
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Request all emails' -s e
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Request all emails' -l all-emails
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Force artifact builds where possible.' -l artifact
complete -c mach -A -n '__fish_mach_complete_subcommand try syntax' -d 'Upload XDB compilation db files generated by hazard build' -l upload-xdbs
complete -c mach -A -n '__fish_mach_complete_command try again auto chooser coverage empty fuzzy release scriptworker syntax' -d 'Select tasks on try using try syntax' -a syntax

# valgrind-test
complete -c mach -A -n '__fish_mach_complete_command valgrind-test ' -d 'Specify a suppression file for Valgrind to use. Use --suppression multiple times to specify multiple suppression files.' -l suppressions

# vcs-setup
complete -c mach -A -n '__fish_mach_complete_command vcs-setup ' -d 'Only update recommended extensions, don\'t run the wizard.' -s u -l update-only

# vendor
complete -c mach -A -n '__fish_mach_complete_command vendor python rust' -d 'For scripted use, prints the new commit to update to, or nothing if up to date.' -l check-for-update
complete -c mach -A -n '__fish_mach_complete_command vendor python rust' -d 'Ignore modified files in current checkout' -l ignore-modified
complete -c mach -A -n '__fish_mach_complete_command vendor python rust' -d 'Repository tag or commit to update to.' -s r -l revision
complete -c mach -A -n '__fish_mach_complete_command vendor python rust' -d '(Only) verify the manifest' -l verify -s v
complete -c mach -A -n '__fish_mach_complete_subcommand vendor python' -d 'Vendor a wheel for Windows along with the source package' -l with-windows-wheel
complete -c mach -A -n '__fish_mach_complete_subcommand vendor python' -d 'Keep all files, including tests and documentation.' -l keep-extra-files
complete -c mach -A -n '__fish_mach_complete_command vendor python rust' -d 'Vendor Python packages from pypi.org into third_party/python. Some extra files like docs and tests will automatically be excluded.' -a python
complete -c mach -A -n '__fish_mach_complete_subcommand vendor rust' -d 'Ignore modified files in current checkout' -l ignore-modified
complete -c mach -A -n '__fish_mach_complete_subcommand vendor rust' -d 'Permit overly-large files to be added to the repository. To get permission to set this, raise a question in the #build channel at https://chat.mozilla.org.' -l build-peers-said-large-imports-were-ok
complete -c mach -A -n '__fish_mach_complete_command vendor python rust' -d 'Vendor rust crates from crates.io into third_party/rust' -a rust

# visualmetrics

# warnings-list
complete -c mach -A -n '__fish_mach_complete_command warnings-list ' -d 'Change to a subdirectory of the build directory first.' -s C -l directory
complete -c mach -A -n '__fish_mach_complete_command warnings-list ' -d 'Which warnings flags to match.' -l flags

# warnings-summary
complete -c mach -A -n '__fish_mach_complete_command warnings-summary ' -d 'Change to a subdirectory of the build directory first.' -s C -l directory

# watch
complete -c mach -A -n '__fish_mach_complete_command watch ' -d 'Verbose output for what commands the watcher is running.' -s v -l verbose

# web-platform-tests
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Regenerate the test manifest.' -l manifest-update
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Prevent regeneration of the test manifest.' -l no-manifest-update
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Attempt to download a preexisting manifest when updating.' -l manifest-download
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Prevent download of the test manifest.' -l no-manifest-download
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Multiplier relative to standard test timeout to use' -l timeout-multiplier
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Split run into groups by directories. With a parameter,limit the depth of splits e.g. --run-by-dir=1 to split by top-leveldirectory' -l run-by-dir
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Number of simultaneous processes to use' -l processes
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Don\'t capture stdio and write to logging' -l no-capture-stdio
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Exit with status code 0 when test expectations are violated' -l no-fail-on-unexpected
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'List the top level directories containing tests that will run.' -l list-test-groups
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'List the tests that are disabled on the current platform' -l list-disabled
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'List all tests that will run' -l list-tests
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Run a stability check on the selected tests' -l verify
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Output per-iteration test results when running verify' -l verify-log-full
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Number of iterations for a run that reloads each test without restart.' -l verify-repeat-loop
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Number of iterations, for a run that restarts the runner between each iteration' -l verify-repeat-restart
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Disable chaos mode when running on Firefox' -l verify-no-chaos-mode
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable chaos mode when running on Firefox' -l verify-chaos-mode
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'The maximum number of minutes for the job to run' -l verify-max-time
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Prints individuals test results and messages' -l verify-no-output-results
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Disable printing individuals test results and messages' -l verify-output-results
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Test types to run' -l test-types
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'URL prefix to include' -l include
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'URL prefix to exclude' -l exclude
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to manifest listing tests to include' -l include-manifest
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to json file containing a mapping {group_name: [test_ids]}' -l test-groups
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Skip tests that are expected to time out' -l skip-timeout
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Skip tests that have the given implementation status' -l skip-implementation-status
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable tests that require QUIC server (default: false)' -l enable-quic
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Labels applied to tests to include in the run. Labels starting dir: are equivalent to top-level directories.' -l tag
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Only run the tests explicitly given in arguments. No tests will run if the list is empty, and the program will exit with status code 0.' -l default-exclude
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'run under a debugger, e.g. gdb or valgrind' -l debugger
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'arguments to the debugger' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Number of times to re run each test without restarts' -l rerun
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Number of times to run the tests, restarting between each run' -l repeat
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Run tests in a loop until one returns an unexpected result' -l repeat-until-unexpected
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Halt the test runner after each test (this happens by default if only a single test is run)' -l pause-after-test
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Don\'t halt the test runner irrespective of the number of tests run' -l no-pause-after-test
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Halt the test runner when an unexpected result is encountered' -l pause-on-unexpected
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Don\'t restart on an unexpected result' -l no-restart-on-unexpected
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path or url to symbols file used to analyse crash minidumps.' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to stackwalker program used to analyse minidumps.' -l stackwalk-binary
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Drop into pdb on python exception' -l pdb
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Desktop binary to run tests against' -l binary
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Extra argument for the binary' -l binary-arg
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'WebDriver server binary to use' -l webdriver-binary
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Extra argument for the WebDriver binary' -l webdriver-arg
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Android package name to run tests against' -l package-name
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Running Android instance to connect to, if not emulator-5554' -l device-serial
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to root directory containing test metadata' -l metadata
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to root directory containing test files' -l tests
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to test manifest (default is ${metadata_root}/MANIFEST.json)' -l manifest
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to directory containing extra json files to add to run info' -l run-info
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Browser against which to run tests' -l product
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Informative string detailing the browser release version. This is included in the run_info data.' -l browser-version
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Informative string detailing the browser release channel. This is included in the run_info data.' -l browser-channel
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to config file' -l config
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Install additional system fonts on your system' -l install-fonts
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Do not install additional system fonts on your system' -l no-install-fonts
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to local font installation directory' -l font-dir
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Run browser in headless mode' -l headless
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Don\'t run browser in headless mode' -l no-headless
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to write instrumentation logs to' -l instrument-to-file
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Build is a debug build (overrides any mozinfo file)' -l debug-build
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Build is a release (overrides any mozinfo file)' -l release-build
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Total number of chunks to use' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Chunk number to run' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Chunking type to use' -l chunk-type
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Type of ssl support to enable (running without ssl may lead to spurious errors)' -l ssl-type
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to openssl binary' -l openssl-binary
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to certutil binary for use with Firefox + ssl' -l certutil-binary
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to ca certificate when using pregenerated ssl certificates' -l ca-cert-path
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to host private key when using pregenerated ssl certificates' -l host-key-path
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to host certificate when using pregenerated ssl certificates' -l host-cert-path
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to the folder containing browser prefs' -l prefs-root
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Preload a gecko instance for faster restarts' -l preload-browser
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Don\'t preload a gecko instance for faster restarts' -l no-preload-browser
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Run tests without electrolysis preferences' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable the WebRender compositor in Gecko (defaults to disabled).' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Disable the WebRender compositor in Gecko.' -l no-enable-webrender
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable fission in Gecko (defaults to disabled).' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Disable fission in Gecko.' -l no-enable-fission
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to directory containing assertion stack fixing scripts' -l stackfix-dir
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to specialPowers extension xpi file' -l specialpowers-path
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Defines an extra user preference (overrides those in prefs_root)' -l setpref
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable leak checking (enabled by default for debug builds, silently ignored for opt, mobile)' -l leak-check
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Disable leak checking' -l no-leak-check
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Number of parallel threads to use for stylo' -l stylo-threads
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable reftest runner implemented inside Marionette' -l reftest-internal
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Disable reftest runner implemented inside Marionette' -l reftest-external
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'With --reftest-internal, when to take a screenshot' -l reftest-screenshot
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable chaos mode with the specified feature flag (see http://searchfox.org/mozilla-central/source/mfbt/ChaosMode.h for details). If no value is supplied, all features are activated' -l chaos
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Inject a user CSS stylesheet into every test.' -l user-stylesheet
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable MojoJS for testing. Note that this flag is usally enabled automatically by `wpt run`, if it succeeds in downloading the right version of mojojs.zip or if --mojojs-path is specified.' -l enable-mojojs
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to mojojs gen/ directory. If it is not specified, `wpt run` will download and extract mojojs.zip into _venv2/mojojs/gen.' -l mojojs-path
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Sauce Labs browser name' -l sauce-browser
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Sauce Labs OS platform' -l sauce-platform
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Sauce Labs browser version' -l sauce-version
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Sauce Labs build identifier' -l sauce-build
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Sauce Labs identifying tag' -l sauce-tags
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Sauce Connect tunnel identifier' -l sauce-tunnel-id
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Sauce Labs user name' -l sauce-user
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Sauce Labs access key' -l sauce-key
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to Sauce Connect binary' -l sauce-connect-binary
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Number of seconds to wait for Sauce Connect tunnel to be available before aborting' -l sauce-init-timeout
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Command-line argument to forward to the Sauce Connect binary (repeatable)' -l sauce-connect-arg
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Path to GitHub checks output file' -l github-checks-text-file
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'WebKit port' -l webkit-port
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Chromium Layout Tests format' -l log-chromium
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'wptreport format' -l log-wptreport
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'wpt.fyi screenshots' -l log-wptscreenshot
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Cache API (default: https://wpt.fyi/api/screenshots/hashes)' -l log-wptscreenshot-api
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests ' -d 'Do not install test runner application' -l no-install

# web-platform-tests-update
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Browser for which metadata is being updated' -l product
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Path to config file' -l config
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Path to the folder containing test metadata' -l metadata
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Path to web-platform-tests' -l tests
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Path to test manifest (default is ${metadata_root}/MANIFEST.json)' -l manifest
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Path to store git checkout of web-platform-tests during update' -l sync-path
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'URL of web-platfrom-tests repository to sync against' -l remote_url
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Remote branch to sync against' -l branch
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Revision to sync to' -l rev
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Create a VCS commit containing the changes.' -l patch
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Don\'t create a VCS commit containing the changes.' -l no-patch
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Sync the tests with the latest from upstream (implies --patch)' -l sync
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'For all tests that are updated, remove any existing conditions and missing subtests' -l full
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Reason for disabling tests. When updating test results, disable tests that have inconsistent results across many runs with the given reason.' -l disable-intermittent
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Update test metadata with expected intermittent statuses.' -l update-intermittent
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Remove obsolete intermittent statuses from expected statuses.' -l remove-intermittent
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Don\'t remove metadata files that no longer correspond to a test file' -l no-remove-obsolete
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Store state so that steps can be resumed after failure' -l no-store-state
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Continue a previously started run of the update script' -l continue
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Clear state from a previous incomplete run of the update script' -l abort
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'List of glob-style paths to exclude when syncing tests' -l exclude
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'List of glob-style paths to include which would otherwise be excluded when syncing tests' -l include
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Extra property from run_info.json to use in metadata update' -l extra-property
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Chromium Layout Tests format' -l log-chromium
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'wptreport format' -l log-wptreport
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'wpt.fyi screenshots' -l log-wptscreenshot
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Cache API (default: https://wpt.fyi/api/screenshots/hashes)' -l log-wptscreenshot-api
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Push local changes to upstream repository even when not syncing' -l upstream
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Dont\'t push local changes to upstream repository when syncing' -l no-upstream
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'Path to file containing github token' -l token-file
complete -c mach -A -n '__fish_mach_complete_command web-platform-tests-update ' -d 'GitHub token to use' -l token

# webidl-example

# webidl-parser-test

# wpt
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Regenerate the test manifest.' -l manifest-update
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Prevent regeneration of the test manifest.' -l no-manifest-update
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Attempt to download a preexisting manifest when updating.' -l manifest-download
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Prevent download of the test manifest.' -l no-manifest-download
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Multiplier relative to standard test timeout to use' -l timeout-multiplier
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Split run into groups by directories. With a parameter,limit the depth of splits e.g. --run-by-dir=1 to split by top-leveldirectory' -l run-by-dir
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Number of simultaneous processes to use' -l processes
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Don\'t capture stdio and write to logging' -l no-capture-stdio
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Exit with status code 0 when test expectations are violated' -l no-fail-on-unexpected
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'List the top level directories containing tests that will run.' -l list-test-groups
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'List the tests that are disabled on the current platform' -l list-disabled
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'List all tests that will run' -l list-tests
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Run a stability check on the selected tests' -l verify
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Output per-iteration test results when running verify' -l verify-log-full
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Number of iterations for a run that reloads each test without restart.' -l verify-repeat-loop
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Number of iterations, for a run that restarts the runner between each iteration' -l verify-repeat-restart
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Disable chaos mode when running on Firefox' -l verify-no-chaos-mode
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable chaos mode when running on Firefox' -l verify-chaos-mode
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'The maximum number of minutes for the job to run' -l verify-max-time
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Prints individuals test results and messages' -l verify-no-output-results
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Disable printing individuals test results and messages' -l verify-output-results
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Test types to run' -l test-types
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'URL prefix to include' -l include
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'URL prefix to exclude' -l exclude
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to manifest listing tests to include' -l include-manifest
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to json file containing a mapping {group_name: [test_ids]}' -l test-groups
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Skip tests that are expected to time out' -l skip-timeout
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Skip tests that have the given implementation status' -l skip-implementation-status
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable tests that require QUIC server (default: false)' -l enable-quic
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Labels applied to tests to include in the run. Labels starting dir: are equivalent to top-level directories.' -l tag
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Only run the tests explicitly given in arguments. No tests will run if the list is empty, and the program will exit with status code 0.' -l default-exclude
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'run under a debugger, e.g. gdb or valgrind' -l debugger
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'arguments to the debugger' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Number of times to re run each test without restarts' -l rerun
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Number of times to run the tests, restarting between each run' -l repeat
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Run tests in a loop until one returns an unexpected result' -l repeat-until-unexpected
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Halt the test runner after each test (this happens by default if only a single test is run)' -l pause-after-test
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Don\'t halt the test runner irrespective of the number of tests run' -l no-pause-after-test
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Halt the test runner when an unexpected result is encountered' -l pause-on-unexpected
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Don\'t restart on an unexpected result' -l no-restart-on-unexpected
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path or url to symbols file used to analyse crash minidumps.' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to stackwalker program used to analyse minidumps.' -l stackwalk-binary
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Drop into pdb on python exception' -l pdb
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Desktop binary to run tests against' -l binary
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Extra argument for the binary' -l binary-arg
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'WebDriver server binary to use' -l webdriver-binary
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Extra argument for the WebDriver binary' -l webdriver-arg
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Android package name to run tests against' -l package-name
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Running Android instance to connect to, if not emulator-5554' -l device-serial
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to root directory containing test metadata' -l metadata
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to root directory containing test files' -l tests
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to test manifest (default is ${metadata_root}/MANIFEST.json)' -l manifest
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to directory containing extra json files to add to run info' -l run-info
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Browser against which to run tests' -l product
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Informative string detailing the browser release version. This is included in the run_info data.' -l browser-version
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Informative string detailing the browser release channel. This is included in the run_info data.' -l browser-channel
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to config file' -l config
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Install additional system fonts on your system' -l install-fonts
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Do not install additional system fonts on your system' -l no-install-fonts
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to local font installation directory' -l font-dir
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Run browser in headless mode' -l headless
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Don\'t run browser in headless mode' -l no-headless
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to write instrumentation logs to' -l instrument-to-file
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Build is a debug build (overrides any mozinfo file)' -l debug-build
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Build is a release (overrides any mozinfo file)' -l release-build
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Total number of chunks to use' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Chunk number to run' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Chunking type to use' -l chunk-type
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Type of ssl support to enable (running without ssl may lead to spurious errors)' -l ssl-type
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to openssl binary' -l openssl-binary
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to certutil binary for use with Firefox + ssl' -l certutil-binary
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to ca certificate when using pregenerated ssl certificates' -l ca-cert-path
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to host private key when using pregenerated ssl certificates' -l host-key-path
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to host certificate when using pregenerated ssl certificates' -l host-cert-path
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to the folder containing browser prefs' -l prefs-root
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Preload a gecko instance for faster restarts' -l preload-browser
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Don\'t preload a gecko instance for faster restarts' -l no-preload-browser
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Run tests without electrolysis preferences' -l disable-e10s
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable the WebRender compositor in Gecko (defaults to disabled).' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Disable the WebRender compositor in Gecko.' -l no-enable-webrender
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable fission in Gecko (defaults to disabled).' -l enable-fission
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Disable fission in Gecko.' -l no-enable-fission
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to directory containing assertion stack fixing scripts' -l stackfix-dir
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to specialPowers extension xpi file' -l specialpowers-path
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Defines an extra user preference (overrides those in prefs_root)' -l setpref
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable leak checking (enabled by default for debug builds, silently ignored for opt, mobile)' -l leak-check
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Disable leak checking' -l no-leak-check
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Number of parallel threads to use for stylo' -l stylo-threads
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable reftest runner implemented inside Marionette' -l reftest-internal
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Disable reftest runner implemented inside Marionette' -l reftest-external
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'With --reftest-internal, when to take a screenshot' -l reftest-screenshot
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable chaos mode with the specified feature flag (see http://searchfox.org/mozilla-central/source/mfbt/ChaosMode.h for details). If no value is supplied, all features are activated' -l chaos
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Inject a user CSS stylesheet into every test.' -l user-stylesheet
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable MojoJS for testing. Note that this flag is usally enabled automatically by `wpt run`, if it succeeds in downloading the right version of mojojs.zip or if --mojojs-path is specified.' -l enable-mojojs
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to mojojs gen/ directory. If it is not specified, `wpt run` will download and extract mojojs.zip into _venv2/mojojs/gen.' -l mojojs-path
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Sauce Labs browser name' -l sauce-browser
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Sauce Labs OS platform' -l sauce-platform
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Sauce Labs browser version' -l sauce-version
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Sauce Labs build identifier' -l sauce-build
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Sauce Labs identifying tag' -l sauce-tags
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Sauce Connect tunnel identifier' -l sauce-tunnel-id
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Sauce Labs user name' -l sauce-user
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Sauce Labs access key' -l sauce-key
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to Sauce Connect binary' -l sauce-connect-binary
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Number of seconds to wait for Sauce Connect tunnel to be available before aborting' -l sauce-init-timeout
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Command-line argument to forward to the Sauce Connect binary (repeatable)' -l sauce-connect-arg
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Path to GitHub checks output file' -l github-checks-text-file
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'WebKit port' -l webkit-port
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Chromium Layout Tests format' -l log-chromium
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'wptreport format' -l log-wptreport
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'wpt.fyi screenshots' -l log-wptscreenshot
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Cache API (default: https://wpt.fyi/api/screenshots/hashes)' -l log-wptscreenshot-api
complete -c mach -A -n '__fish_mach_complete_command wpt ' -d 'Do not install test runner application' -l no-install

# wpt-manifest-update
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Rebuild manifest from scratch' -l rebuild
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Always download even if the local manifest is recent' -l download
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Don\'t try to download the manifest' -l no-download
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Just download the manifest, don\'t update' -l no-update
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Path to wptrunner config file' -l config
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Force the local configuration to be regenerated' -l rewrite-config
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Path to use for the metadata cache' -l cache-root
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Chromium Layout Tests format' -l log-chromium
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'wptreport format' -l log-wptreport
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'wpt.fyi screenshots' -l log-wptscreenshot
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command wpt-manifest-update ' -d 'Cache API (default: https://wpt.fyi/api/screenshots/hashes)' -l log-wptscreenshot-api

# wpt-metadata-merge
complete -c mach -A -n '__fish_mach_complete_command wpt-metadata-merge ' -d 'show this help message and exit' -s h -l help

# wpt-metadata-summary

# wpt-serve
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'Artificial latency to add before sending http responses, in ms' -l latency
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'Path to external config file' -l config
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'Path to document root. Overrides config.' -l doc_root
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'Path to WebSockets document root. Overrides config.' -l ws_doc_root
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'File with entries for aliases/multiple doc roots. In form of `/ALIAS_NAME/, DOC_ROOT\n`' -l alias_file
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'Disable the HTTP/2.0 server' -l no-h2
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'Enable QUIC server for WebTransport' -l quic-transport
complete -c mach -A -n '__fish_mach_complete_command wpt-serve ' -d 'Exit after starting servers' -l exit-after-start

# wpt-test-paths
complete -c mach -A -n '__fish_mach_complete_command wpt-test-paths ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command wpt-test-paths ' -d 'Don\'t update manifest before continuing' -l no-update
complete -c mach -A -n '__fish_mach_complete_command wpt-test-paths ' -d 'Force a full rebuild of the manifest.' -s r -l rebuild
complete -c mach -A -n '__fish_mach_complete_command wpt-test-paths ' -d 'Path in which to store any caches (default <tests_root>/.wptcache/)' -l cache-root
complete -c mach -A -n '__fish_mach_complete_command wpt-test-paths ' -d 'Output as JSON' -l json

# wpt-unittest

# wpt-update
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Browser for which metadata is being updated' -l product
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Path to config file' -l config
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Path to the folder containing test metadata' -l metadata
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Path to web-platform-tests' -l tests
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Path to test manifest (default is ${metadata_root}/MANIFEST.json)' -l manifest
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Path to store git checkout of web-platform-tests during update' -l sync-path
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'URL of web-platfrom-tests repository to sync against' -l remote_url
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Remote branch to sync against' -l branch
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Revision to sync to' -l rev
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Create a VCS commit containing the changes.' -l patch
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Don\'t create a VCS commit containing the changes.' -l no-patch
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Sync the tests with the latest from upstream (implies --patch)' -l sync
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'For all tests that are updated, remove any existing conditions and missing subtests' -l full
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Reason for disabling tests. When updating test results, disable tests that have inconsistent results across many runs with the given reason.' -l disable-intermittent
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Update test metadata with expected intermittent statuses.' -l update-intermittent
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Remove obsolete intermittent statuses from expected statuses.' -l remove-intermittent
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Don\'t remove metadata files that no longer correspond to a test file' -l no-remove-obsolete
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Store state so that steps can be resumed after failure' -l no-store-state
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Continue a previously started run of the update script' -l continue
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Clear state from a previous incomplete run of the update script' -l abort
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'List of glob-style paths to exclude when syncing tests' -l exclude
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'List of glob-style paths to include which would otherwise be excluded when syncing tests' -l include
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Extra property from run_info.json to use in metadata update' -l extra-property
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Chromium Layout Tests format' -l log-chromium
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'wptreport format' -l log-wptreport
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'wpt.fyi screenshots' -l log-wptscreenshot
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Cache API (default: https://wpt.fyi/api/screenshots/hashes)' -l log-wptscreenshot-api
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Push local changes to upstream repository even when not syncing' -l upstream
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Dont\'t push local changes to upstream repository when syncing' -l no-upstream
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'Path to file containing github token' -l token-file
complete -c mach -A -n '__fish_mach_complete_command wpt-update ' -d 'GitHub token to use' -l token

# xpcshell-test
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'show this help message and exit' -s h -l help
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'application directory (as opposed to XRE directory)' -l app-path
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'don\'t automatically run tests, drop to an xpcshell prompt' -l interactive
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'always print stdout and stderr from tests' -l verbose
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Output the log if a test fails, even when run in parallel' -l verbose-if-fails
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'continue running tests after test killed with control-C (SIGINT)' -l keep-going
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'create log files (default, only used to override --no-logfiles)' -l logfiles
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Specify path to a filename to dump all the tests that will be run' -l dump-tests
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Manifest of test directories to use' -l manifest
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'don\'t create log files' -l no-logfiles
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Run all tests sequentially' -l sequential
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Directory to use for temporary files' -l temp-dir
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Directory where testing modules are located.' -l testing-modules-dir
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Path to the location of a plugins directory containing the test plugin or plugins required for tests. By default xpcshell\'s dir svc provider returns gre/plugins. Use test-plugin-path to add a directory to return for NS_APP_PLUGINS_DIR_LIST when queried.' -l test-plugin-path
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'how many chunks to split the tests up into' -l total-chunks
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'which chunk to run between 1 and --total-chunks' -l this-chunk
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'name of application profile being tested' -l profile-name
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'path to a mozinfo.json including information about the build configuration. defaults to looking for mozinfo.json next to the script.' -l build-info-json
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Execute tests in random order' -l shuffle
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'absolute path to directory containing XRE (probably xulrunner)' -l xre-path
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'absolute path to directory containing breakpad symbols, or the URL of a zip file containing symbols' -l symbols-path
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Directory to store per-test javascript line coverage data as json.' -l jscov-dir-prefix
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'use the given debugger to launch the application' -l debugger
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'pass the given args to the debugger _before_ the application on the command line' -l debugger-args
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'prevents the test harness from redirecting stdout and stderr for interactive debuggers' -l debugger-interactive
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Waits for a devtools JS debugger to connect before starting the test.' -l jsdebugger
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'The port to listen on for a debugger connection if --jsdebugger is specified.' -l jsdebugger-port
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'filter out tests that don\'t have the given tag. Can be used multiple times in which case the test must contain at least one of the given tags.' -l tag
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Path to a directory containing utility programs, such as stack fixer scripts.' -l utility-path
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Path to xpcshell binary' -l xpcshell
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Path to http3server binary' -l http3server
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Rerun failures from the previous run, if any' -l rerun-failures
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Path to a manifest file from which to rerun failures (with --rerun-failure) or in which to record failed tests' -l failure-manifest
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'override the number of jobs (threads) when running tests in parallel, the default is CPU x 1.5 when running via mach and CPU x 4 when running in automation' -l threads
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Defines an extra user preference (can be passed multiple times.' -l setpref
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Run tests in verification mode: Run many times in different ways, to see if there are intermittent failures.' -l verify
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Maximum time, in seconds, to run in --verify mode.' -l verify-max-time
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Enable the WebRender compositor in Gecko.' -l enable-webrender
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Enable headless mode by default for tests which don\'t specify whether to use headless mode' -l headless
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Run self tests' -l self-test
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Raw structured log messages (provided by mozlog)' -l log-raw
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Unittest style output (provided by mozlog)' -l log-unittest
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'xUnit compatible XML (povided by mozlog)' -l log-xunit
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'HTML report (provided by mozlog)' -l log-html
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Human-readable output (provided by mozlog)' -l log-mach
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'TBPL style log format (provided by mozlog)' -l log-tbpl
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Grouped summary of test results (provided by mozlog)' -l log-grouped
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Chromium Layout Tests format' -l log-chromium
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'wptreport format' -l log-wptreport
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'wpt.fyi screenshots' -l log-wptscreenshot
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-raw-level
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Enables verbose mode for the given formatter.' -l log-mach-verbose
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-mach-level
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-mach-buffer
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Enable logging reftest-analyzer compatible screenshot data.' -l log-mach-screenshot
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Disable logging reftest-analyzer compatible screenshot data.' -l log-mach-no-screenshot
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Enables compact mode for the given formatter.' -l log-tbpl-compact
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'A least log level to subscribe to for the given formatter (debug, info, error, etc.)' -l log-tbpl-level
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'If specified, enables message buffering at the given buffer size limit.' -l log-tbpl-buffer
complete -c mach -A -n '__fish_mach_complete_command xpcshell-test ' -d 'Cache API (default: https://wpt.fyi/api/screenshots/hashes)' -l log-wptscreenshot-api

