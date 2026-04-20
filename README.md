# ww_bgr

# 朱朱白白的背景图资源库

本仓库收集与 鸣潮/Wuthering Waves 相关的背景图，并为自建群Bot提供素材

# 如何使用

(1) （我使用的是Debian13.2+）通过APT包管理器安装两个软件包`rsync` 和 `git`。

```bash
apt install -y rsync git
```


(2) 该仓库的 custom_mr_bg/ 隆到本地目录 /opt/picture/ww_bgr/ ;如果目标目录不存在，git会自动创建

```bash
git clone --depth 1 https://github.com/Reduction77/ww_bgr /opt/picture/ww_bgr/
```


(3) 将源目录 /opt/picture/ww_bgr/custom_mr_bg/ 的内容同步到目标目录 /opt/gsuid_core/data/XutheringWavesUID/custom_mr_bg/。

```bash
rsync -av --delete --progress /opt/picture/ww_bgr/custom_mr_bg/ /opt/gsuid_core/data/XutheringWavesUID/custom_mr_bg/
```
# ✅可以使用腾讯云自动化或其他自动化服务定期执行以上内容
