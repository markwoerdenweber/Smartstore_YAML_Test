# Sample repository for external modules

This repository is intended for external Smartstore developers and contains the template structure for modules.

> [!IMPORTANT]
> First and foremost: Please make sure that the visibility of the repository is set to **private** and that you send your Smartstore contact an invitation to the repository.

## Symlinks

Since modules must exist in this repository and in your Smartstore repository, it is necessary to connect them using symlinks.
The modules should each be linked to _/Smartstore/src/Smartstore.Modules/_ in your Smartstore repository.
To do this, change the link source (`linksrc`) in the `create-symlinks.bat` file accordingly.

Running `sysmlinks.bat` will automatically create all symlinks. If you want to add a module to this repository, just add it to the list of modules in `create-symlinks.bat` and run it again. Existing symlinks are not touched, only new ones are added. If the location of a module changes, you must delete the existing symlink in the Smartstore repository before running the `.bat` file again.

This project structure is also well suited for developing your own modules.

## Module Structure

Examples of module source code can be found in our [Code Examples Repository](https://github.com/smartstore/dev-docs-code-examples).

For a more in-depth view, please refer to our [Technical Documentation](https://smartstore.gitbook.io/developer-guide/compose/modules/getting-started-with-modules).

## Branching

Your _main_ branch always contains the latest source code.
Each branch reflects the source code compatible with the Smartstore version, e.g. branch _5.0.2.x_ is compatible with Smartstore version _5.0.2_.

This means that a new (hotfix) branch is created with each new release.
By doing this, we can quickly access the source code of the module for a specific version and fix critical issues without affecting the ongoing development.

## Documentation

> With great code comes great documentability. :spider:

Please decorate your code and repository `README`'s with useful comments and documentation.

### Test-Data

If any generic data was used to test your module, such as phone numbers, bank details, or login credentials, please include it either in your documentation, the readme file, or in an extra file that is linked to.
This is especially important for payment and import/export modules.

Please also include any sample files you used, as long as they are reasonably sized, located in the wwwroot directory, and have the word *sample* in the filename.

## Using the Packager

To create the NuGet packages needed for quick deployment, please use the [Smartstore.Packager](https://smartstore.gitbook.io/developer-guide/compose/modules/deploying-modules#packager).

# On a new Smartstore release

1. Create a hotfix branch with your current code that reflects the latest Smartstore release.
2. Create a release that contains the module's NuGet packages that you generated using `Smartstore.Packager`.
3. Start a new section in the `changelog.md` file.
