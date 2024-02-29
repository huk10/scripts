#!/usr/bin/env bash
#env | sort > ~/Xcode_behaviors.out

openTerminal() {
  #  open -a iTerm "$1"
  osascript << EOF
    tell application "iTerm"
  		if running then
  			create window with default profile
  		else
  			activate
  		end if

  		# 不延时会获取不到 current window
  		delay 0.5
  		tell current session of current window
  			# quoted form of curr_dir 的意思是把 curr_dir 用引号包裹起来，这里直接写 curr_dir 也可以运行
  			write text "cd " & quoted form of "$1" & ";clear;"
  		end tell
    end tell
EOF
}

# 如果存在 .xcodeproj 文件，打开文件所在目录
if [ -n "$XcodeProjectPath" ]; then
  openTerminal "$XcodeProjectPath"/..
  exit 0
fi

# XcodeWorkspacePath
if [ -n "$XcodeWorkspacePath" ]; then
  # 打开的项目是否是一个 package
  if [[ "$XcodeWorkspacePath" =~ \.swiftpm/xcode/package.xcworkspace$ ]]; then
    openTerminal "$XcodeWorkspacePath"/../../..
  else
    openTerminal "$XcodeWorkspacePath"/..
  fi
  exit 0
fi
