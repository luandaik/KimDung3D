.class Lcom/heitao/channel/HTChannel$3;
.super Ljava/lang/Object;
.source "HTChannel.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/heitao/channel/HTChannel;->doPay(Lcom/heitao/model/HTPayInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/channel/HTChannel;

.field final synthetic val$parsMap:Ljava/util/Map;


# direct methods
.method constructor <init>(Lcom/heitao/channel/HTChannel;Ljava/util/Map;)V
    .locals 0

    .prologue
    .line 198
    iput-object p1, p0, Lcom/heitao/channel/HTChannel$3;->this$0:Lcom/heitao/channel/HTChannel;

    iput-object p2, p0, Lcom/heitao/channel/HTChannel$3;->val$parsMap:Ljava/util/Map;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 203
    new-instance v0, Lcom/heitao/request/HTPayOrderNumber;

    invoke-direct {v0}, Lcom/heitao/request/HTPayOrderNumber;-><init>()V

    .line 204
    .local v0, "payOrderNumber":Lcom/heitao/request/HTPayOrderNumber;
    iget-object v1, p0, Lcom/heitao/channel/HTChannel$3;->val$parsMap:Ljava/util/Map;

    new-instance v2, Lcom/heitao/channel/HTChannel$3$1;

    invoke-direct {v2, p0}, Lcom/heitao/channel/HTChannel$3$1;-><init>(Lcom/heitao/channel/HTChannel$3;)V

    invoke-virtual {v0, v1, v2}, Lcom/heitao/request/HTPayOrderNumber;->doCreatePayOrderNumber(Ljava/util/Map;Lcom/heitao/listener/HTPayOrderListener;)V

    .line 258
    return-void
.end method
