.class final Lcom/unionpay/sdk/ax;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/bluetooth/BluetoothAdapter$LeScanCallback;


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onLeScan(Landroid/bluetooth/BluetoothDevice;I[B)V
    .locals 2

    invoke-static {}, Lcom/unionpay/sdk/b;->a()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/unionpay/sdk/b;->a()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/unionpay/sdk/b;->a(Landroid/content/Context;Landroid/bluetooth/BluetoothDevice;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-static {}, Lcom/unionpay/sdk/b;->b()Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    return-void
.end method
