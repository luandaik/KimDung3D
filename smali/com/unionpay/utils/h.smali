.class public Lcom/unionpay/utils/h;
.super Ljava/lang/Object;


# static fields
.field private static g:Lcom/unionpay/utils/h;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/lang/String;

.field public f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x0

    sput-object v0, Lcom/unionpay/utils/h;->g:Lcom/unionpay/utils/h;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/utils/h;->a:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/utils/h;->b:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/utils/h;->c:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/utils/h;->d:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/utils/h;->e:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Lcom/unionpay/utils/h;->f:Ljava/lang/String;

    return-void
.end method

.method public static a()Lcom/unionpay/utils/h;
    .locals 2

    sget-object v0, Lcom/unionpay/utils/h;->g:Lcom/unionpay/utils/h;

    if-nez v0, :cond_0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "zh"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/unionpay/utils/i;

    invoke-direct {v0}, Lcom/unionpay/utils/i;-><init>()V

    sput-object v0, Lcom/unionpay/utils/h;->g:Lcom/unionpay/utils/h;

    :cond_0
    :goto_0
    sget-object v0, Lcom/unionpay/utils/h;->g:Lcom/unionpay/utils/h;

    return-object v0

    :cond_1
    new-instance v0, Lcom/unionpay/utils/j;

    invoke-direct {v0}, Lcom/unionpay/utils/j;-><init>()V

    sput-object v0, Lcom/unionpay/utils/h;->g:Lcom/unionpay/utils/h;

    goto :goto_0
.end method
