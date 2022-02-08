.class Lcom/heitao/channel/HTChannel$1;
.super Lcom/heitao/platform/listener/HTPLogoutListener;
.source "HTChannel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannel;->onCreate(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannel;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannel;)V
    .locals 0

    .prologue
    .line 62
    iput-object p1, p0, Lcom/heitao/channel/HTChannel$1;->this$0:Lcom/heitao/channel/HTChannel;

    invoke-direct {p0}, Lcom/heitao/platform/listener/HTPLogoutListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onLogoutCompleted()V
    .locals 2

    .prologue
    .line 67
    iget-object v0, p0, Lcom/heitao/channel/HTChannel$1;->this$0:Lcom/heitao/channel/HTChannel;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/heitao/channel/HTChannel;->doLogout(Ljava/util/Map;)V

    .line 68
    return-void
.end method
