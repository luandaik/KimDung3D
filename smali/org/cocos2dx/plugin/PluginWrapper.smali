.class public Lorg/cocos2dx/plugin/PluginWrapper;
.super Ljava/lang/Object;
.source "PluginWrapper.java"


# static fields
.field private static final APP_WRAPPER:Ljava/lang/String; = "org.cocos2dx.plugin.AppWrapper"

.field private static final TAG:Ljava/lang/String; = "PluginWrapper"

.field protected static sContext:Landroid/content/Context;

.field protected static sGLSurfaceView:Landroid/opengl/GLSurfaceView;

.field protected static sGLThreadHandler:Landroid/os/Handler;

.field protected static sMainThreadHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 40
    sput-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sContext:Landroid/content/Context;

    .line 41
    sput-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sGLSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 42
    sput-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sMainThreadHandler:Landroid/os/Handler;

    .line 43
    sput-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sGLThreadHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 171
    sget-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sContext:Landroid/content/Context;

    return-object v0
.end method

.method protected static getPluginType(Ljava/lang/Object;)I
    .locals 6
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 157
    const/4 v3, -0x1

    .line 160
    .local v3, "nRet":I
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "PluginType"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 161
    .local v1, "filedID":Ljava/lang/reflect/Field;
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 162
    .local v2, "nObj":Ljava/lang/Integer;
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    .line 167
    .end local v1    # "filedID":Ljava/lang/reflect/Field;
    .end local v2    # "nObj":Ljava/lang/Integer;
    :goto_0
    return v3

    .line 163
    :catch_0
    move-exception v0

    .line 164
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    sput-object p0, Lorg/cocos2dx/plugin/PluginWrapper;->sContext:Landroid/content/Context;

    .line 49
    sget-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sMainThreadHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 50
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sMainThreadHandler:Landroid/os/Handler;

    .line 52
    :cond_0
    return-void
.end method

.method protected static initFromNativeActivity(Landroid/app/Activity;)V
    .locals 0
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 59
    sput-object p0, Lorg/cocos2dx/plugin/PluginWrapper;->sContext:Landroid/content/Context;

    .line 64
    return-void
.end method

.method protected static initPlugin(Ljava/lang/String;)Ljava/lang/Object;
    .locals 8
    .param p0, "classFullName"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 68
    const-string v5, "PluginWrapper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "class name : ----"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "----"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    const/4 v0, 0x0

    .line 71
    .local v0, "c":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/16 v5, 0x2f

    const/16 v6, 0x2e

    :try_start_0
    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v3

    .line 72
    .local v3, "fullName":Ljava/lang/String;
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 80
    :try_start_1
    invoke-static {}, Lorg/cocos2dx/plugin/PluginWrapper;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 81
    .local v1, "ctx":Landroid/content/Context;
    if-eqz v1, :cond_0

    .line 82
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/content/Context;

    aput-object v7, v5, v6

    invoke-virtual {v0, v5}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v5

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object v1, v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 90
    .end local v1    # "ctx":Landroid/content/Context;
    .end local v3    # "fullName":Ljava/lang/String;
    :goto_0
    return-object v4

    .line 73
    :catch_0
    move-exception v2

    .line 74
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    const-string v5, "PluginWrapper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Class "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " not found."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 75
    invoke-virtual {v2}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 85
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v1    # "ctx":Landroid/content/Context;
    .restart local v3    # "fullName":Ljava/lang/String;
    :cond_0
    :try_start_2
    const-string v5, "PluginWrapper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Plugin "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " wasn\'t initialized."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 87
    .end local v1    # "ctx":Landroid/content/Context;
    :catch_1
    move-exception v2

    .line 88
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private static invokeMethod(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V
    .locals 8
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    const/16 v5, 0x2f

    const/16 v6, 0x2e

    :try_start_0
    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 127
    .local v2, "fullName":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 128
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 129
    .local v3, "instance":Ljava/lang/Object;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/content/Context;

    aput-object v7, v5, v6

    invoke-virtual {v0, p1, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 130
    .local v4, "method":Ljava/lang/reflect/Method;
    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    aput-object p2, v5, v6

    invoke-virtual {v4, v3, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 136
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "fullName":Ljava/lang/String;
    .end local v3    # "instance":Ljava/lang/Object;
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 132
    :catch_0
    move-exception v1

    .line 133
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "PluginWrapper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "exception :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    .locals 8
    .param p0, "className"    # Ljava/lang/String;
    .param p1, "methodName"    # Ljava/lang/String;
    .param p2, "parms"    # [Ljava/lang/Object;

    .prologue
    .line 142
    const/16 v5, 0x2f

    const/16 v6, 0x2e

    :try_start_0
    invoke-virtual {p0, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    .line 144
    .local v2, "fullName":Ljava/lang/String;
    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 145
    .local v0, "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v3

    .line 146
    .local v3, "instance":Ljava/lang/Object;
    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Class;

    const/4 v6, 0x0

    const-class v7, Landroid/content/Context;

    aput-object v7, v5, v6

    const/4 v6, 0x1

    const-class v7, Lorg/cocos2dx/plugin/InterfaceApp$ExitListener;

    aput-object v7, v5, v6

    invoke-virtual {v0, p1, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 147
    .local v4, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4, v3, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    .end local v0    # "cls":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "fullName":Ljava/lang/String;
    .end local v3    # "instance":Ljava/lang/Object;
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-void

    .line 149
    :catch_0
    move-exception v1

    .line 150
    .local v1, "e":Ljava/lang/Exception;
    const-string v5, "PluginWrapper"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "exception :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public static onDestroy(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 113
    const-string v0, "org.cocos2dx.plugin.AppWrapper"

    const-string v1, "onDestroy"

    invoke-static {v0, v1, p0}, Lorg/cocos2dx/plugin/PluginWrapper;->invokeMethod(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 114
    return-void
.end method

.method public static onExit(Landroid/content/Context;Lorg/cocos2dx/plugin/InterfaceApp$ExitListener;)V
    .locals 4
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "onExitListeren"    # Lorg/cocos2dx/plugin/InterfaceApp$ExitListener;

    .prologue
    .line 118
    const-string v0, "org.cocos2dx.plugin.AppWrapper"

    const-string v1, "onExit"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Lorg/cocos2dx/plugin/PluginWrapper;->invokeMethod(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 119
    return-void
.end method

.method public static onPause(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 109
    const-string v0, "org.cocos2dx.plugin.AppWrapper"

    const-string v1, "onPause"

    invoke-static {v0, v1, p0}, Lorg/cocos2dx/plugin/PluginWrapper;->invokeMethod(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 110
    return-void
.end method

.method public static onResume(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 105
    const-string v0, "org.cocos2dx.plugin.AppWrapper"

    const-string v1, "onResume"

    invoke-static {v0, v1, p0}, Lorg/cocos2dx/plugin/PluginWrapper;->invokeMethod(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 106
    return-void
.end method

.method public static runOnGLThread(Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 175
    sget-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sGLSurfaceView:Landroid/opengl/GLSurfaceView;

    if-eqz v0, :cond_0

    .line 176
    sget-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sGLSurfaceView:Landroid/opengl/GLSurfaceView;

    invoke-virtual {v0, p0}, Landroid/opengl/GLSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    .line 184
    :goto_0
    return-void

    .line 178
    :cond_0
    sget-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sGLThreadHandler:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 179
    sget-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sGLThreadHandler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 181
    :cond_1
    const-string v0, "PluginWrapper"

    const-string v1, "call back invoked on main thread"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method public static runOnMainThread(Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 187
    sget-object v1, Lorg/cocos2dx/plugin/PluginWrapper;->sMainThreadHandler:Landroid/os/Handler;

    if-eqz v1, :cond_1

    .line 188
    sget-object v1, Lorg/cocos2dx/plugin/PluginWrapper;->sMainThreadHandler:Landroid/os/Handler;

    invoke-virtual {v1, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 194
    :cond_0
    :goto_0
    return-void

    .line 190
    :cond_1
    sget-object v1, Lorg/cocos2dx/plugin/PluginWrapper;->sContext:Landroid/content/Context;

    if-eqz v1, :cond_0

    sget-object v1, Lorg/cocos2dx/plugin/PluginWrapper;->sContext:Landroid/content/Context;

    instance-of v1, v1, Landroid/app/Activity;

    if-eqz v1, :cond_0

    .line 191
    sget-object v0, Lorg/cocos2dx/plugin/PluginWrapper;->sContext:Landroid/content/Context;

    check-cast v0, Landroid/app/Activity;

    .line 192
    .local v0, "act":Landroid/app/Activity;
    invoke-virtual {v0, p0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static setGLSurfaceView(Landroid/opengl/GLSurfaceView;)V
    .locals 0
    .param p0, "value"    # Landroid/opengl/GLSurfaceView;

    .prologue
    .line 55
    sput-object p0, Lorg/cocos2dx/plugin/PluginWrapper;->sGLSurfaceView:Landroid/opengl/GLSurfaceView;

    .line 56
    return-void
.end method
