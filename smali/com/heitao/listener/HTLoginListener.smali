.class public interface abstract Lcom/heitao/listener/HTLoginListener;
.super Ljava/lang/Object;
.source "HTLoginListener.java"


# virtual methods
.method public abstract onHTLoginCompleted(Lcom/heitao/model/HTUser;Ljava/util/Map;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/heitao/model/HTUser;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract onHTLoginFailed(Lcom/heitao/model/HTError;)V
.end method
