# ✍️ Commit Style Guidelines

To keep the project history clean and easy to understand, all commits must follow a consistent style.

## 🧱 Format


- **`<scope>`**: Top-level directory or domain (e.g. `device`, `common`, `phosh`, etc.)
- **`<target>`**: Specific package, device, or file being modified
- **`<short description>`**: Concise summary of the change, in *imperative mood* (e.g. “update”, “fix”, “add”, “remove”, “sync”)

    - You may use **brace expression** `{}` and **wildcards** `*` for multiple targets

### ✏️ Long Description (Optional)

You may include a longer description after a blank line if the change is complex:


## ✅ Examples

### 📦 Package Updates
```
cross/aarch64-unknown-linux-gnu-bin: update to 14.1.1
```
or
```
cross/{aarch64-unknown-linux-gnu-bin, qemu-user-static-bin}: update to latest versions
```
or
```
gnome_mobile: update packages to 48
```
or
```
{device,linux}/*-sdm845-*: update kernel to 6.12 and latest commit from pmos
```
### ⚙️ General Commits

Try to find a "category" prefix if possible.

The filename (usually without extension) is often helpful.

```
gitignore: add *.yml
README: add commit style guideline
gitlab-ci: check KBS version
```
