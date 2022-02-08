.class public Lcom/heitao/platform/request/HTPNullResponeParser;
.super Lcom/heitao/platform/request/HTPHttpRequestParser;
.source "HTPNullResponeParser.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/heitao/platform/request/HTPHttpRequestParser;-><init>()V

    return-void
.end method


# virtual methods
.method protected onParse(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 11
    invoke-super {p0, p1}, Lcom/heitao/platform/request/HTPHttpRequestParser;->onParse(Lorg/json/JSONObject;)V

    .line 12
    return-void
.end method
