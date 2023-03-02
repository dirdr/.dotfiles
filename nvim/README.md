# My personnal neovim configuration
### Installation
clone the repository in .config
```
git clone https://github.com/dirdr/nvim & mv nvim ~/.config
```
**don't forget** to install ripgrep and fd find. otherwise live grep will not work.\
run:
```
:checkhealth
```
```
:PlugUpdate
```
```
:TSUpdate
```
and update lsp servers with:
```
:Mason
```
### Lsp, null-ls
Linting and formatting are injected through null-ls, if you want to add sources, do **not** add them with null ls setup  
Install them with mason, mason-null-ls will make the bridge and setup sources automatically  
Avaible keymaps
- `rf` format the current buffer with avaible formatter 
- `rn` rename the selected element accross the buffer
- `K` hover the current element 
- `f` execute code action propositions 

### Avaible themes
the **default** theme is set to be gruvbox 
you can change by choosing one of the following
- tokyonight
- dracula
- gruvbox
- base16-default-dark
