.class Lcom/heitao/platform/api/HTPlatform$6;
.super Ljava/lang/Object;
.source "HTPlatform.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/platform/api/HTPlatform;->active()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/api/HTPlatform;


# direct methods
.method constructor <init>(Lcom/heitao/platform/api/HTPlatform;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/heitao/platform/api/HTPlatform$6;->this$0:Lcom/heitao/platform/api/HTPlatform;

    .line 383
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 390
    const-string v0, "http://api.heitao.com/stat/active"

    .line 391
    .local v0, "url":Ljava/lang/String;
    new-instance v1, Lcom/heitao/platform/request/HTPNullResponeParser;

    invoke-direct {v1}, Lcom/heitao/platform/request/HTPNullResponeParser;-><init>()V

    iget-object v2, p0, Lcom/heitao/platform/api/HTPlatform$6;->this$0:Lcom/heitao/platform/api/HTPlatform;

    invoke-static {v2}, Lcom/heitao/platform/api/HTPlatform;->access$0(Lcom/heitao/platform/api/HTPlatform;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/heitao/platform/common/HTPUtils;->getDevicesInfo(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v2

    new-instance v3, Lcom/heitao/platform/api/HTPlatform$6$1;

    invoke-direct {v3, p0}, Lcom/heitao/platform/api/HTPlatform$6$1;-><init>(Lcom/heitao/platform/api/HTPlatform$6;)V

    invoke-virtual {v1, v0, v2, v3}, Lcom/heitao/platform/request/HTPNullResponeParser;->post(Ljava/lang/String;Ljava/util/Map;Lcom/heitao/platform/listener/HTPRequestListener;)V

    .line 419
    return-void
.end method
