# Les3Soleils

A weird 1.20.1 modpack

### How to clone:
`git clone https://github.com/AKSMP/les3soleils --recursive`

### How to add mods

#### Mod is on curseforge/modrinth
We prefer to download mods from modrinth if possible, to do this with packwiz you have to use this command: `packwiz modrinth add MOD_SLUG`

#### Build mod manually
If the mod is only available on a git repository, first add it as a submodule: `git submodule add -b "branch" GIT build/MOD_NAME` then add it to the powershell and bash script.


In Powershell:
```ps1
buildAndMove("MOD_NAME")
```

In Bash:
```sh
buildAndMove "MOD_NAME"
```

Finally on linux run: `./buildmods.sh` and on windows run `.\buildmods.ps1`
