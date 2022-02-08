.class public final Lcom/unionpay/mobile/android/widgets/af;
.super Lcom/unionpay/mobile/android/widgets/aa;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/unionpay/mobile/android/widgets/af$a;
    }
.end annotation


# instance fields
.field private n:Landroid/text/TextWatcher;

.field private o:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/unionpay/mobile/android/widgets/af$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/unionpay/mobile/android/widgets/aa;-><init>(Landroid/content/Context;ILorg/json/JSONObject;Ljava/lang/String;B)V

    new-instance v0, Lcom/unionpay/mobile/android/widgets/ag;

    invoke-direct {v0, p0}, Lcom/unionpay/mobile/android/widgets/ag;-><init>(Lcom/unionpay/mobile/android/widgets/af;)V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->n:Landroid/text/TextWatcher;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->o:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->b:Lcom/unionpay/mobile/android/widgets/u;

    iget-object v1, p0, Lcom/unionpay/mobile/android/widgets/af;->n:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(Landroid/text/TextWatcher;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->b:Lcom/unionpay/mobile/android/widgets/u;

    new-instance v1, Landroid/text/InputFilter$LengthFilter;

    const/16 v2, 0x17

    invoke-direct {v1, v2}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(Landroid/text/InputFilter;)V

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->b:Lcom/unionpay/mobile/android/widgets/u;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/unionpay/mobile/android/widgets/u;->a(I)V

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/af;->h:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0, v5}, Lcom/unionpay/mobile/android/widgets/u;->setEnabled(Z)V

    :cond_0
    const-string v0, "regex"

    invoke-static {p3, v0}, Lcom/unionpay/mobile/android/utils/i;->d(Lorg/json/JSONObject;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->o:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->o:Ljava/util/ArrayList;

    :cond_1
    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v0

    if-ge v5, v0, :cond_3

    invoke-static {v1, v5}, Lcom/unionpay/mobile/android/utils/i;->b(Lorg/json/JSONArray;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    if-eqz v0, :cond_2

    iget-object v2, p0, Lcom/unionpay/mobile/android/widgets/af;->o:Ljava/util/ArrayList;

    new-instance v3, Lcom/unionpay/mobile/android/widgets/af$a;

    invoke-direct {v3, p0, v0}, Lcom/unionpay/mobile/android/widgets/af$a;-><init>(Lcom/unionpay/mobile/android/widgets/af;Lorg/json/JSONObject;)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method private static b(Ljava/lang/String;)Z
    .locals 7

    const/4 v1, 0x0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v0, v5, -0x2

    move v2, v1

    move v3, v0

    move v4, v1

    :goto_0
    if-ltz v3, :cond_1

    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    add-int/lit8 v0, v0, -0x30

    rem-int/lit8 v6, v2, 0x2

    if-nez v6, :cond_0

    mul-int/lit8 v0, v0, 0x2

    div-int/lit8 v6, v0, 0xa

    rem-int/lit8 v0, v0, 0xa

    add-int/2addr v0, v6

    :cond_0
    add-int/2addr v4, v0

    add-int/lit8 v3, v3, -0x1

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_0

    :cond_1
    rem-int/lit8 v0, v4, 0xa

    if-nez v0, :cond_2

    const/16 v0, 0x30

    :goto_1
    add-int/lit8 v2, v5, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v0, v2, :cond_3

    const/4 v0, 0x1

    :goto_2
    return v0

    :cond_2
    rem-int/lit8 v0, v4, 0xa

    rsub-int/lit8 v0, v0, 0xa

    add-int/lit8 v0, v0, 0x30

    int-to-char v0, v0

    goto :goto_1

    :cond_3
    move v0, v1

    goto :goto_2
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 3

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/af;->h:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/af;->i()Ljava/lang/String;

    move-result-object v0

    :goto_0
    const-string v1, " "

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->b:Lcom/unionpay/mobile/android/widgets/u;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/u;->b()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public final b()Z
    .locals 9

    const/16 v8, 0x13

    const/16 v7, 0xd

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-boolean v0, p0, Lcom/unionpay/mobile/android/widgets/af;->h:Z

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-virtual {p0}, Lcom/unionpay/mobile/android/widgets/af;->a()Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->o:Ljava/util/ArrayList;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->o:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_6

    move v3, v2

    move v4, v2

    :goto_1
    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->o:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v3, v0, :cond_6

    iget-object v0, p0, Lcom/unionpay/mobile/android/widgets/af;->o:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/unionpay/mobile/android/widgets/af$a;

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/af$a;->a()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/af$a;->a()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    :cond_2
    if-eqz v4, :cond_5

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/af$a;->c()Z

    move-result v3

    if-eqz v3, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/unionpay/mobile/android/widgets/af$a;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/unionpay/mobile/android/widgets/af;->b(Ljava/lang/String;)Z

    move-result v0

    :goto_2
    move v1, v0

    goto :goto_0

    :cond_3
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v7, v0, :cond_4

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v8, v0, :cond_4

    move v0, v1

    goto :goto_2

    :cond_4
    move v0, v2

    goto :goto_2

    :cond_5
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_1

    :cond_6
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v7, v0, :cond_7

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v0

    if-lt v8, v0, :cond_7

    invoke-static {v5}, Lcom/unionpay/mobile/android/widgets/af;->b(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    :cond_7
    move v1, v2

    goto :goto_0
.end method

.method protected final d()Ljava/lang/String;
    .locals 1

    const-string v0, "_input_cardNO"

    return-object v0
.end method
