.class public final Lcom/unionpay/mobile/android/hce/d;
.super Ljava/lang/Object;


# instance fields
.field private a:Ljava/lang/String;

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Z

.field private e:Z

.field private f:Landroid/content/ServiceConnection;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    const/4 v1, 0x0

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/d;->a:Ljava/lang/String;

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/d;->b:Ljava/lang/String;

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/d;->c:Ljava/lang/String;

    iput-boolean v1, p0, Lcom/unionpay/mobile/android/hce/d;->d:Z

    iput-boolean v1, p0, Lcom/unionpay/mobile/android/hce/d;->e:Z

    iput-object v0, p0, Lcom/unionpay/mobile/android/hce/d;->f:Landroid/content/ServiceConnection;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/ServiceConnection;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/d;->f:Landroid/content/ServiceConnection;

    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/d;->b:Ljava/lang/String;

    return-void
.end method

.method public final a()Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/hce/d;->d:Z

    return v0
.end method

.method public final b(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/hce/d;->c:Ljava/lang/String;

    return-void
.end method

.method public final b()Z
    .locals 1

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/hce/d;->e:Z

    return v0
.end method

.method public final c()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/d;->b:Ljava/lang/String;

    return-object v0
.end method

.method public final d()Landroid/content/ServiceConnection;
    .locals 1

    iget-object v0, p0, Lcom/unionpay/mobile/android/hce/d;->f:Landroid/content/ServiceConnection;

    return-object v0
.end method

.method public final e()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/hce/d;->d:Z

    return-void
.end method

.method public final f()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/unionpay/mobile/android/hce/d;->e:Z

    return-void
.end method
