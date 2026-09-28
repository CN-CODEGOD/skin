# Rainmeter Skin Packs

Rainmeter 桌面皮肤合集，包含三个独立的皮肤包。

## 目录结构

```
skin_packs/
├── myskin/          ← 自制皮肤（主力）
├── Abelo/           ← 系统监控皮肤
└── WhiteNeon 2/     ← 霓虹风格皮肤
```

## 安装

1. 安装 [Rainmeter](https://www.rainmeter.net/)
2. 将对应皮肤文件夹复制到 `Documents\Rainmeter\Skins\`
3. 在 Rainmeter 管理界面中加载对应 `.ini` 文件

---

## myskin 皮肤说明

### 全局变量

**文件：`myskin/@Resources/Variables.inc`**

所有皮肤共享的配置项，修改后刷新皮肤生效：

```ini
Player=Spotify                          ; 默认播放器
PicturePath=C:\Users\Atri\Pictures\壁纸  ; 图片浏览器目录
WPE=C:\...\wallpaper64.exe              ; Wallpaper Engine 路径
```

---

### toolbar/ — 快捷启动栏

| 文件 | 说明 |
|------|------|
| `toolbar.ini` | 水平 Dock（25 个图标），hover 放大动画 |
| `controls_dock.ini` | 音乐播放控件（Play/Pause/Previous/Next），使用 WebNowPlaying 插件 |
| `WPE_dock.ini` | Wallpaper Engine 控件（Play/Pause/Next），水平布局 |

**toolbar.ini 路径配置：** 在 `[Variables]` 段中修改 `LocationPath1` ~ `LocationPath25`

> ⚠️ LocationPath 不要加引号，引号写在 Meter 的 `LeftMouseUpAction=["#LocationPathX#"]` 里

**WPE_dock.ini：** 使用 `%wpe%` 环境变量，需在 `@Resources/Variables.inc` 中设置 `WPE=` 路径

**controls_dock.ini 依赖：**
- [WebNowPlaying 浏览器扩展](https://github.com/keifufu/WebNowPlaying-Redux)
- 支持 Chrome / Firefox / Edge 中的 YouTube、Spotify、Bilibili 等

---

### player/ — 音乐播放器

**文件：`player.ini`**

使用 WebNowPlaying 插件显示当前播放信息：
- 歌手名 × 歌曲名
- 进度条（可点击跳转）
- Previous / Play-Pause / Next 控制按钮

**依赖：** WebNowPlaying 浏览器扩展

---

### playerChibi/ — 播放器 Chibi 切换器

**文件：`players_toggle.ini`** + `players_toggle.ps1`

左键点击切换播放器图标，右键点击通过 PowerShell 脚本 toggle 播放器（启动/关闭）。
打开某个播放器时自动关闭其他播放器。

**路径配置：`playerChibi/Variables.inc`**

```ini
;--- Player Paths (用户可修改) ---
CloudMusicPath=C:\Program Files\NetEase\CloudMusic\cloudmusic.exe
PotPlayerPath=C:\Program Files\DAUM\PotPlayer\PotPlayerMini64.exe
SpotifyPath=C:\Users\Atri\AppData\Roaming\Spotify\Spotify.exe
YouTubePath=https://www.youtube.com

;--- Chibi Image Paths ---
Chibi1Image=#@#cloudMusic.png
Chibi2Image=#@#social-spotify.png
Chibi3Image=#@#PotPlayer.png
Chibi4Image=#@#youtube.png
Chibi5Image=#@#stop.png
```

**操作：**
- 左键：循环切换图标（CloudMusic → Spotify → PotPlayer → YouTube → Stop）
- 右键：启动/关闭对应播放器（自动关闭其他播放器）
- Stop 图标右键：关闭所有播放器

---

### stickers/ — 桌面贴图

**文件：`chibi_all.ini`**

单个 ini 包含所有 chibi 贴图，整合了原来分散的 chibi_1~12 子文件夹。

**操作：**
- 左键：切换到下一张 chibi 图片
- 右键：打开 Wallpaper Engine
- 悬停：放大动画

**图片路径配置：`stickers/Variables.inc`**

```ini
Chibi1Image=#@#pixel_chibi.png
Chibi2Image=#@#pixel_chibi2.png
...
Chibi12Image=#@#pixel_chibi12.png
```

**尺寸配置：**

```ini
DefaultWidth=150       ; 默认宽度
DefaultHeight=270      ; 默认高度
Chibi1Width=100        ; 单独覆盖
Chibi1Height=100
```

> 原来分散的 `chibi_1/` ~ `chibi_10/` 子文件夹保留兼容，每个可独立加载。

---

### folders_box/ — 文件夹快捷方式

**文件：`folders.ini`**

3 列网格布局，hover 放大动画，点击打开对应文件夹。

**路径配置：** 在 `[Variables]` 段修改 `Folder1` ~ `Folder12`

```ini
Folder1=C:\Users\Atri\Documents
Folder2=C:\Users\Atri\Downloads
...
```

---

### picture/ — 图片浏览器

**文件：`image.ini`**

浏览指定目录下的壁纸图片。

**路径配置：** 在 `@Resources/Variables.inc` 中修改 `PicturePath`

```ini
PicturePath=C:\Users\Atri\Pictures\壁纸
```

**操作：**
- 左键：切换下一张图片
- 右键：打开壁纸文件夹

---

### dragon/ — 龙贴图

**文件：`imagedisplay.ini`**

左右对称中国龙桌面贴图。

```ini
ImageLeft=#@#images\tietu_zhonguolong1.png
ImageRight=#@#images\tietu_zhonguolong_2.png
ImageWidth=300
ImageHeight=400
```

---

## Abelo 皮肤说明

系统监控皮肤，包含时钟、CPU、RAM、磁盘、网络等。

**变量配置：`Abelo/@Resources/Variables.inc`**

```ini
Player=CAD              ; 播放器类型
TextColor=255,255,255   ; 文字颜色
UserName=Atri           ; 用户名
ScrollMouseIncrement=0.1 ; 滚轮缩放步长
```

---

## WhiteNeon 2 皮肤说明

霓虹风格皮肤，包含时钟、日期、Dock、天气等。

**变量配置：`WhiteNeon 2/@Resources/Variables.inc`**

---

## 环境变量

| 变量 | 说明 | 设置位置 |
|------|------|---------|
| `%wpe%` | Wallpaper Engine 路径 | `@Resources/Variables.inc` → `WPE=` |

## 依赖插件

| 插件 | 用途 | 使用皮肤 |
|------|------|---------|
| WebNowPlaying | 浏览器音乐控制 | controls_dock, player |
| ActionTimer | hover 动画（内置） | toolbar, folders_box, stickers |
| QuotePlugin | 图片随机浏览（内置） | picture |

## 快速配置清单

拿到皮肤后需要修改的路径（都在对应的 `Variables.inc` 中）：

1. **`myskin/@Resources/Variables.inc`**
   - `PicturePath` → 你的壁纸目录
   - `WPE` → 你的 Wallpaper Engine 路径

2. **`myskin/playerChibi/Variables.inc`**
   - `CloudMusicPath` → 网易云音乐路径
   - `PotPlayerPath` → PotPlayer 路径
   - `SpotifyPath` → Spotify 路径

3. **`myskin/toolbar/toolbar.ini`**
   - `LocationPath1` ~ `LocationPath25` → 你的程序/文件夹/网址

4. **`myskin/folders_box/folders.ini`**
   - `Folder1` ~ `Folder12` → 你的常用文件夹



## showcase

bilibili

[gif](https://github.com/CN-CODEGOD/skin/tree/main/screenShot)
