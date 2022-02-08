.class public abstract Lcom/heitao/listener/HTProxyListener;
.super Ljava/lang/Object;
.source "HTProxyListener.java"


# static fields
.field public static final ACTION_ANTI_ADDICTION_QUERY_COMPLETE:I = 0x46

.field public static final ACTION_APP_UPDATE:I = 0x32

.field public static final ACTION_GAME_EXIT:I = 0x29

.field public static final ACTION_LOGIN_COMPLETE:I = 0xa

.field public static final ACTION_LOGIN_FAIL:I = 0xb

.field public static final ACTION_PAY_COMPLETE:I = 0x1e

.field public static final ACTION_PAY_FAIL:I = 0x1f

.field public static final ACTION_REAL_NAME_REGISTER_COMPLETE:I = 0x50

.field public static final ACTION_SWITCH_ACCOUNT_COMPLETE:I = 0x14

.field public static final ACTION_SWITCH_ACCOUNT_FAIL:I = 0x15

.field public static final ACTION_THIRD_PARTY_EXIT:I = 0x28

.field public static final ACTION_WX_BIND_QUERY_COMPLETE:I = 0x3c


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onCallBack(ILcom/heitao/model/HTBaseEntity;)V
.end method
