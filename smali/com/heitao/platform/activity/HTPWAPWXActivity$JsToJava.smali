.class public Lcom/heitao/platform/activity/HTPWAPWXActivity$JsToJava;
.super Ljava/lang/Object;
.source "HTPWAPWXActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/heitao/platform/activity/HTPWAPWXActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "JsToJava"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/heitao/platform/activity/HTPWAPWXActivity;


# direct methods
.method public constructor <init>(Lcom/heitao/platform/activity/HTPWAPWXActivity;)V
    .locals 0

    .prologue
    .line 121
    iput-object p1, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity$JsToJava;->this$0:Lcom/heitao/platform/activity/HTPWAPWXActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public javaMethod(Ljava/lang/String;)V
    .locals 2
    .param p1, "paramFromJS"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 124
    iget-object v0, p0, Lcom/heitao/platform/activity/HTPWAPWXActivity$JsToJava;->this$0:Lcom/heitao/platform/activity/HTPWAPWXActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1, p1}, Lcom/heitao/platform/activity/HTPWAPWXActivity;->access$0(Lcom/heitao/platform/activity/HTPWAPWXActivity;ILjava/lang/String;)V

    .line 125
    return-void
.end method
