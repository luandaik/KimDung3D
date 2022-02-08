.class final Lcom/unionpay/mobile/android/pro/views/i;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/unionpay/mobile/android/pro/pboc/engine/a;


# instance fields
.field final synthetic a:Lcom/unionpay/mobile/android/pro/views/h;


# direct methods
.method constructor <init>(Lcom/unionpay/mobile/android/pro/views/h;)V
    .locals 0

    iput-object p1, p0, Lcom/unionpay/mobile/android/pro/views/i;->a:Lcom/unionpay/mobile/android/pro/views/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/ArrayList;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/model/c;",
            ">;)V"
        }
    .end annotation

    const-string v0, "uppay"

    const-string v1, "deviceReady +++"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/i;->a:Lcom/unionpay/mobile/android/pro/views/h;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pro/views/h;->s:Ljava/util/List;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/i;->a:Lcom/unionpay/mobile/android/pro/views/h;

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v1, v0, Lcom/unionpay/mobile/android/pro/views/h;->s:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/i;->a:Lcom/unionpay/mobile/android/pro/views/h;

    iget-object v0, v0, Lcom/unionpay/mobile/android/pro/views/h;->s:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/pro/views/i;->a:Lcom/unionpay/mobile/android/pro/views/h;

    invoke-static {v0}, Lcom/unionpay/mobile/android/pro/views/h;->a(Lcom/unionpay/mobile/android/pro/views/h;)V

    const-string v0, "uppay"

    const-string v1, "deviceReady ---"

    invoke-static {v0, v1}, Lcom/unionpay/mobile/android/utils/j;->a(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
