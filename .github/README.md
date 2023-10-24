# Sample repository for external modules

This repository is intended for external Smartstore developers.
It contains best practices and template structures for modules.

> [!IMPORTANT]
> First and foremost: Please make sure that the visibility of the repository is set to **private** and that you send your Smartstore contact an invitation to the repository.

## Symlinks

Since the modules must exist in this repository and in your Smartstore repository, it is necessary to connect them using symlinks.
The modules should each be linked to _/Smartstore/src/Smartstore.Modules/_ in your Smartstore repository.
To do this, change the link source (`linksrc`) in the `create-symlinks.bat` file accordingly.

Running `sysmlinks.bat` will automatically create all symlinks. If you want to add a module to this repository, just add it to the list of modules in `create-symlinks.bat` and run it again. Existing symlinks are not touched, only new ones are added. If the location of a module changes, you must delete the existing symlink in the Smartstore repository before running the `.bat` file again.

This project structure is also well suited for developing your own modules.

## Module Structure

The following table shows an example of a module directory structure.

| Entry                            | Description                                                                     |
| ---------------------------------| --------------------------------------------------------------------------------|
| :file\_folder: **App\_Data**     | App-specific data like templates, sample files, etc. that needs to be published.|
| :file\_folder: **Blocks**        | Page Builder Block implementations                                              |
| :file\_folder: **Bootstrapping** | Bootstrapping code like _Autofac_ modules, DI extensions etc.                   |
| :file\_folder: **Client**        | RESTful API clients                                                             |
| :file\_folder: **Components**    | MVC View Components                                                             |
| :file\_folder: **Configuration** | Settings class implementations                                                  |
| :file\_folder: **Controllers**   | MVC Controllers                                                                 |
| :file\_folder: **Domain**        | Domain entities                                                                 |
| :file\_folder: **Extensions**    | Static extension method classes                                                 |
| :file\_folder: **Filters**       | MVC Filters                                                                     |
| :file\_folder: **Hooks**         | Hook implementations                                                            |
| :file\_folder: **Localization**  | Localization files                                                              |
| :file\_folder: **Media**         | Media system related classes                                                    |
| :file\_folder: **Migrations**    | Fluent data migrations                                                          |
| :file\_folder: **Models**        | View model classes                                                              |
| :file\_folder: **Providers**     | Provider implementations                                                        |
| :file\_folder: **Security**      | Security related classes                                                        |
| :file\_folder: **Services**      | Service classes                                                                 |
| :file\_folder: **Utils**         | Utilities                                                                       |
| :file\_folder: **Tasks**         | Task scheduler jobs                                                             |
| :file\_folder: **TagHelpers**    | Tag Helpers                                                                     |
| :file\_folder: **Views**         | Razor view/template files                                                       |
| :file\_folder: **wwwroot**       | Static files (including Sass)                                                   |
| :memo: `AdminMenu.cs`            | Admin menu hook                                                                 |
| :memo: `CacheableRoutes.cs`      | Route registrar for output cache                                                |
| :memo: `Events.cs`               | Event handler methods                                                           |
| :memo: `Module.cs` \*            | Required. Module entry class (implements `IModule`).                            |
| :memo: `module.json` \*          | Required. Module metadata manifest.                                             |
| :memo: `Permissions.cs`          | Module permissions                                                              |
| :memo: `Startup.cs`              | Module bootstrapper                                                             |

## Branching

The _main_ branch always contains the latest source code.
Each branch reflects the source code compatible with the Smartstore version, e.g. branch _5.0.2.x_ is compatible with Smartstore version _5.0.2_.

This means that a new (hotfix) branch is created with each new release.
By doing this, we can quickly access the source code of the module for a specific version and fix critical issues without affecting the ongoing development.

## Using the Packager

To create the NuGet packages needed for quick deployment, please use the `Smartstore.Packager`.
Open the `Smartstore.Tools.sln` solution located in the Smartstore repository root.
Build the `Smartstore.Packager` project from the _Tools_ directory.
The resulting `Smartstore.Packager.exe` file can list all modules in a build directory.
 
To build your solution, you can run the file that builds the entire solution in release mode.
One of the following batch files can be used to do this
- build/build.linux-x64.cmd
- build/build.osx-x64
- build/build.win-x64.cmd
- `build/build.win-x86.cmd`

After starting the Packager, select the directory created by the batch file in the _artifacts_ directory.
Clicking on *ReadExtensions* will list all available modules.
Now select the module you want to package, an output directory and press Create Package.
The packager will create a `zip` file using the naming pattern `Smartstore.Module.{module systemname}.{current module version}.zip`
which will result in something like `Smartstore.Module.MyOrg.MyModule.5.0.zip.`.

# On a new Smartstore release

1. Create a hotfix branch with your current code that reflects the latest Smartstore release.
2. Create a release that includes the NuGet packages.
3. Start a new section in the `changelog.md` file.
