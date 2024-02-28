# AI 生成持续集成脚本

TODO：当前 HarmonyOS 项目要支持这种方式比较有难度，需要等待 HarmonyOS 官方提供支持。

## Install

根据 OpenHarmonyOS 的文档: https://ohpm.openharmony.cn/#/cn/help/quickstart ,需要先安装 ohpm 工具包。

下载 CLI 工具：[https://developer.harmonyos.com/cn/develop/deveco-studio#download_cli](https://developer.harmonyos.com/cn/develop/deveco-studio#download_cli)

测试：

```bash
➜  MyApplication2 git:(master) ✗ ./node_modules/.bin/hvigor --mode module -p product=default assembleHap
> hvigor Starting Hvigor Daemon...
> hvigor WARN: Failed to start hvigor daemon. The build will be started in no-daemon mode.
> hvigor UP-TO-DATE :entry:default@PreBuild...
> hvigor Finished :entry:default@GenerateMetadata... after 7 ms
> hvigor Finished :entry:default@MergeProfile... after 2 ms
> hvigor Finished :entry:default@BuildNativeWithCmake... after 1 ms
> hvigor Finished :entry:default@GenerateLoaderJson... after 4 ms
> hvigor Finished :entry:default@MakePackInfo... after 6 ms
> hvigor Finished :entry:default@ProcessProfile... after 88 ms
> hvigor Finished :entry:default@BuildNativeWithNinja... after 1 ms
> hvigor Finished :entry:default@ProcessResource... after 3 ms
> hvigor UP-TO-DATE :entry:default@ProcessLibs...
> hvigor Finished :entry:default@CompileResource... after 49 ms
> hvigor Finished :entry:default@CompileJS... after 3 ms
> hvigor Finished :entry:default@CompileArkTS... after 2 s 376 ms
> hvigor Finished :entry:default@PackageHap... after 1 s 722 ms
> hvigor WARN: Will skip sign 'hos_hap'. No signingConfigs profile is configured in current project.
               If needed, configure the signingConfigs in /Users/phodal/DevEcoStudioProjects/MyApplication2/build-profile.json5 .
> hvigor Finished :entry:default@SignHap... after 2 ms
> hvigor Finished :entry:assembleHap... after 1 ms
> hvigor BUILD SUCCESSFUL in 5 s 130 ms
```

## 生成？？

