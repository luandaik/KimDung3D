.class public Lcom/heitao/platform/activity/view/LoginPageStack;
.super Ljava/util/Stack;
.source "LoginPageStack.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/Stack",
        "<",
        "Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;",
        ">;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/util/Stack;-><init>()V

    return-void
.end method


# virtual methods
.method public pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;
    .locals 1

    .prologue
    .line 25
    invoke-super {p0}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .line 26
    .local v0, "page":Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;
    return-object v0
.end method

.method public bridge synthetic pop()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/heitao/platform/activity/view/LoginPageStack;->pop()Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    move-result-object v0

    return-object v0
.end method

.method public push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;
    .locals 2
    .param p1, "page"    # Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    .prologue
    .line 18
    invoke-virtual {p0}, Lcom/heitao/platform/activity/view/LoginPageStack;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 19
    .local v0, "it":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;>;"
    invoke-super {p0, p1}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    return-object v1
.end method

.method public bridge synthetic push(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    invoke-virtual {p0, p1}, Lcom/heitao/platform/activity/view/LoginPageStack;->push(Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;)Lcom/heitao/platform/activity/HTPPlatformLoginActivity$PAGE;

    move-result-object v0

    return-object v0
.end method
