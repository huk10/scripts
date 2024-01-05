## Some tool scripts

* [batch-modify-git-remote.sh](./batch-modify-git-remote.sh) 批量修改目录下 `Git` 仓库的远程仓库用户名
  * 用于 `Github` 修改用户名场景。
  * 预设仓库目录为 `~/developer/github`，需要手动修改脚本中对应字符串。
* [open-xcode-project-by-terminal.sh](./open-xcode-project-by-terminal.sh) 可用于在 `XCode` 中快捷键打开当前项目路径的终端
* [start-emulator.sh](./start-emulator.sh) 打开安卓模拟器
  * 需要在 `Android Studio` 中安装并配置模拟器
  * 这里模拟器的名称是 `android_11` 需要去设置模拟器名称或修改脚本中对应字符串。
* [open-vscode](./open-vscode.scpt) Mac 端 Finder 中一键用 vscode 打开当前选择的目录或文件（**二进制文件** 需用脚本编辑器编译成 app 并拖动到 Finder 工具栏上使用）
  * [源代码文件](./open-vscode.txt) 脚本源代码，可用脚本编辑器新建一个脚本将此文件内容复制进去，再编译成app使用。
* [open-iterm](./open-iterm.scpt) Mac 端 Finder 中一键用 iTerm 打开当前目录（**二进制文件** 需用脚本编辑器编译成 app 并拖动到 Finder 工具栏使用）
  * [源代码文件](./open-iterm.txt) 脚本源代码，可用脚本编辑器新建一个脚本将此文件内容复制进去，再编译成app使用。
  * 如果当前 Finder 窗口有选中的文件或目录，则新开 iTerm 窗口并 `cd` 到选中的目录或选中的文件所在目录，如果没有选择文件或目录则 `cd` 到当前窗口所在目录
  * 如果直接执行此脚本，会选择最近聚焦过的窗口（同时存在多个窗口也是此逻辑）进行操作，如果当前没有打开 Finder 窗口，则默认 `cd` 到 'home' 目录。