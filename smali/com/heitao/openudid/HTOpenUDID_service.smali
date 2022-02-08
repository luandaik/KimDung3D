.class public Lcom/heitao/openudid/HTOpenUDID_service;
.super Landroid/app/Service;
.source "HTOpenUDID_service.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 26
    new-instance v0, Lcom/heitao/openudid/HTOpenUDID_service$1;

    invoke-direct {v0, p0}, Lcom/heitao/openudid/HTOpenUDID_service$1;-><init>(Lcom/heitao/openudid/HTOpenUDID_service;)V

    return-object v0
.end method
