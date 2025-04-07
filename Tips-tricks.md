# Master Neo(Vim)

#### How to replace word from quick fix list: 
```
:cdo %s/Post/Poop/gc
```
> Replace the world `Post` with `Poop` and `gc` is for global confirm


#### Find word using `vimgrep` and put it into quick fix list:
```
:vimgrep /Post/ `find . -type f`
:copen
```

> `copen` is used to open quick fix list

---
- `ZZ` & `ZQ` to exit vim
- Select within () and {} with `vib` / `viB`
- Highlight last highlighted - `gv`
- `A` to append

---
- Use `<leader> + / ` to find the words in telescope in current file. 
- Then use `<Ctrl> + q` to open it in Quick fix list.

---
** Terminal Shortcut ** 
[Tips - 13 Linux Terminal Shortcuts Every Power Linux User Must Know](https://linuxhandbook.com/linux-shortcuts/)

---
`:%! xxd` view the file in hex binary form

