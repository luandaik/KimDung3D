.class public Lcom/heitao/platform/activity/view/menu/HTPMenuModel;
.super Ljava/lang/Object;
.source "HTPMenuModel.java"


# instance fields
.field private name:Ljava/lang/String;

.field private title:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    .prologue
    .line 7
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->title:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    iget-object v0, p0, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->url:Ljava/lang/String;

    return-object v0
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 22
    iput-object p1, p0, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->name:Ljava/lang/String;

    .line 23
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0
    .param p1, "title"    # Ljava/lang/String;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->title:Ljava/lang/String;

    .line 11
    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 16
    iput-object p1, p0, Lcom/heitao/platform/activity/view/menu/HTPMenuModel;->url:Ljava/lang/String;

    .line 17
    return-void
.end method
