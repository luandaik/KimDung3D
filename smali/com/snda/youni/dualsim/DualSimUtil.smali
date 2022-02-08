.class public Lcom/snda/youni/dualsim/DualSimUtil;
.super Ljava/lang/Object;
.source "DualSimUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getPropertiesLabel()Ljava/lang/String;
    .locals 10

    .prologue
    .line 10
    const-string v5, ""

    .line 12
    .local v5, "value":Ljava/lang/String;
    :try_start_0
    const-string v6, "android.os.SystemProperties"

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v1

    .line 16
    .local v1, "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :try_start_1
    const-string v6, "get"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Class;

    const/4 v8, 0x0

    const-class v9, Ljava/lang/String;

    aput-object v9, v7, v8

    invoke-virtual {v1, v6, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    .line 17
    .local v4, "method":Ljava/lang/reflect/Method;
    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    const-string v8, "ro.platfrom.info"

    aput-object v8, v6, v7

    invoke-virtual {v4, v1, v6}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v6

    check-cast v0, Ljava/lang/String;

    move-object v5, v0
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    .line 39
    .end local v1    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v4    # "method":Ljava/lang/reflect/Method;
    :goto_0
    return-object v5

    .line 18
    .restart local v1    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_0
    move-exception v3

    .line 20
    .local v3, "e1":Ljava/lang/NoSuchMethodException;
    :try_start_2
    invoke-virtual {v3}, Ljava/lang/NoSuchMethodException;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/SecurityException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 31
    .end local v3    # "e1":Ljava/lang/NoSuchMethodException;
    :catch_1
    move-exception v2

    .line 33
    .local v2, "e":Ljava/lang/SecurityException;
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/SecurityException;->printStackTrace()V
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_0

    .line 35
    .end local v1    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    .end local v2    # "e":Ljava/lang/SecurityException;
    :catch_2
    move-exception v2

    .line 37
    .local v2, "e":Ljava/lang/ClassNotFoundException;
    invoke-virtual {v2}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    goto :goto_0

    .line 21
    .end local v2    # "e":Ljava/lang/ClassNotFoundException;
    .restart local v1    # "classType":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :catch_3
    move-exception v2

    .line 23
    .local v2, "e":Ljava/lang/IllegalArgumentException;
    :try_start_4
    invoke-virtual {v2}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 24
    .end local v2    # "e":Ljava/lang/IllegalArgumentException;
    :catch_4
    move-exception v2

    .line 26
    .local v2, "e":Ljava/lang/IllegalAccessException;
    invoke-virtual {v2}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    .line 27
    .end local v2    # "e":Ljava/lang/IllegalAccessException;
    :catch_5
    move-exception v2

    .line 29
    .local v2, "e":Ljava/lang/reflect/InvocationTargetException;
    invoke-virtual {v2}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V
    :try_end_4
    .catch Ljava/lang/SecurityException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_0
.end method
