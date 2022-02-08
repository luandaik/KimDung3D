.class public Lcom/heitao/platform/common/HTAppUpdateInfo;
.super Lcom/heitao/platform/common/HTBaseEntity;
.source "HTAppUpdateInfo.java"


# static fields
.field public static final KEY_APK_URL:Ljava/lang/String; = "apk_url"

.field public static final KEY_CONTENT:Ljava/lang/String; = "content"

.field public static final KEY_IS_FORCE:Ljava/lang/String; = "is_force"

.field public static final KEY_VERSION_CODE:Ljava/lang/String; = "version_code"

.field public static final KEY_VERSION_NAME:Ljava/lang/String; = "version_name"


# instance fields
.field public apkURL:Ljava/lang/String;

.field public content:Ljava/lang/String;

.field public isForce:Z

.field public versionCode:I

.field public versionName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/heitao/platform/common/HTBaseEntity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getPropertiesMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 23
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 24
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "version_name"

    iget-object v2, p0, Lcom/heitao/platform/common/HTAppUpdateInfo;->versionName:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    const-string v1, "version_code"

    new-instance v2, Ljava/lang/StringBuilder;

    iget v3, p0, Lcom/heitao/platform/common/HTAppUpdateInfo;->versionCode:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    const-string v1, "content"

    iget-object v2, p0, Lcom/heitao/platform/common/HTAppUpdateInfo;->content:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    const-string v1, "apk_url"

    iget-object v2, p0, Lcom/heitao/platform/common/HTAppUpdateInfo;->apkURL:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    const-string v2, "is_force"

    iget-boolean v1, p0, Lcom/heitao/platform/common/HTAppUpdateInfo;->isForce:Z

    if-eqz v1, :cond_0

    const-string v1, "1"

    :goto_0
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    return-object v0

    .line 28
    :cond_0
    const-string v1, "0"

    goto :goto_0
.end method
