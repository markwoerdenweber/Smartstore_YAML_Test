```mermaid
gitGraph
    commit
    commit
    branch develop
    checkout develop
    commit
    branch 5.0.5.x
    commit
    checkout main
    merge develop
    commit
    commit
```

```mermaid
graph TD;
    Hotfix branch-->NuGet packages;
    NuGet packages-->Release;
    Release-->Changelog;
    Hotfix branch-->Changelog;
```
