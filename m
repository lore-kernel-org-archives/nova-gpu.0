Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333955;
	b=pd1B+eg0FFlIaTeHbgzZ76t5+qk8TI2KkkP0QgZA6Sy7V6HRxf2P2ZvWt5qhFKsUrRYx
	 ujTLvnP0J1vA8vVxqQAQXkw4G+ZsLWtG8bGIXF2LwyBI+rhW5zT6YIuDT3R7F3wXeCICK
	 EnGbu1xOhzJFCECXUfD7qsXPEIAMnN/RHhEOjimoYY31eh9IZbZxtB+u0CNUrJNBWSz03
	 KiP8qt/w0JwOnhnpUlXCvbH3rLUOAD2f6A2rY2CD53pHzzWxl3q355M/p6ynXEcRlnoeX
	 Own4B3Ymins4DYECLAyyAv2Hu5SpuPAIHrdc4JonKs6GE+clw2doCHRXaeI7lc7zMGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333955;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=E4pSiRAu9Ou3pAqCbSFq8M6jT8nbGmza86zBxZokFYk=;
	b=5IshbzeEvAROJ2Devow/gkRA4sgjBvHzTRxkPvSRVmr+btU0fqi/b8kcgw2il1uvf1Vo
	 g8k132MFG9RsuZjiQ43xoUXWk+G6OoWvqvnHJP8H+IH6T9pPUjD1g+QZjC1x1Yb6H7aHi
	 L2k7EyxLUtG84ZPZ8wiP5Q4F/l6BH7kKhmYQP2Jk+X3z19xrV50PAbsJKYTypW8t6ugho
	 CGZ9uj1J9OAN9GfEpKSJmK+4m6YiG4jsG2kzXcO4y/VInKK1lS4UZpcucg5pwUDGGD3sB
	 LxX9blQDJuHoJefrkfA7CFJ9yaukERbRi3cRjh9nhQF1WsN1sdG9NJ0Bt/VGf4P2rew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=PCaoAMxY;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=awOPlPxu;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7B4606A31A
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 04:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=PCaoAMxY;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=awOPlPxu
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 17557140017E
	for <nova-gpu@lists.linux.dev>; Fri, 30 Oct 2026 00:19:14 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 30 Oct 2026 00:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793333953;
	 x=1793420353; bh=E4pSiRAu9Ou3pAqCbSFq8M6jT8nbGmza86zBxZokFYk=; b=
	PCaoAMxYv0ozIAMEv/kstIsdm/W5s41Y1g9zz78RaiFfUyQo8przst4zQwATkQfr
	hGGTHLvI609kf2gRz6TvftnZFjddwaqmqiCtoiFc/bOJNOld6bO37q7ziaVEN4Jh
	kXSrctzVMeRvHWwlSKWfXbg2ltLdVYt9D2AAhTA77WX5Jaxb8sSIuoSRFTHQxpdO
	OcV5K3Mk9ULFHONWhAgQgHAIutmqGiN2vyKz3Zz53Phcbr4k74iTLCuAcXyurfGf
	k0LfYMrmJ/CmDnJq81jIrEh90k8myBJUkFXMt//K2fZWndCqp+tIkpFZgBYmOxw1
	auYAlk5qeidu0GlIyVbtqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793333953; x=
	1793420353; bh=E4pSiRAu9Ou3pAqCbSFq8M6jT8nbGmza86zBxZokFYk=; b=a
	wOPlPxuyDmbqxVtM+Qy8muhOKqaAMAQrDb9W4zWf52No0TxotyUY4aE9bdQ5bh56
	M2BJVbGY2xMFLer9Y19gnwHL4QlIiyvhFJBX+7wRV92ISOgHpMrFJr7HerV75ZZY
	zA9v1YrjjAeuYy6nFaP3uJl60YdsUgEm1o/smVblnP6Wnvwdqu6hs3yUWm2oI6ku
	Ikh/87VPCRlT4rPWheNc9X0okRFxuRakc/X9n5p5r5RzqG/ChZcARx/6IF0P8iA2
	wTePIpZSFcSSGJmSHtp09gKDqtgRWJCq/XZd9ncb9DBCa07akSs4zlXDB3ZVCKSh
	NgXWyqR2GSkAeqOS4t4nQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793333953; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PG5vdmEtZ3B1QGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:UNW67lSbW2wAs4Y2LxzvEu5xO8BTG7OHS6m6Uio+ELMmTv0
	69vkm1T0OfehbWNcZTsScB3WOUYLkMNNxb5AMmalG5BYRnlShVrH2ASrMMNApC8/
	sss9ECzJQMQxhf/3yo6Lob6Ml5wG9rjvsx0mNJNIpt20rXwjGw6W0uiXB/vBSC9I
	DTQsSC2m6+sxMtLINby2+gi9O0RIOwE6PTrrvT58Oh771HEEgP1x8p8799nDrkxr
	cFdSXf5JiD0Rs/jfl0vxOAnKmOkT/rlAcJseBvDe7hXss1nD7UCr/oKN3W2M3NMM
	S/AEUTWKNfMwGdaXAN78+HAK9LO+8YiSUyI7XxA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:PaHWp1Wrv8SNFgtksUGoOMmFqy1eYa3xxu14MqM3zMo=:tafdg5QerDSImo5lHgeuaLHHXaWcv1npO7fSBfcIltc=;
X-ME-Sender: <xms:wRrkakMEHCG3oghu--KJQ-4UcCClE-zJP8uCPaqTVkWENMmeTVfscQ>
    <xme:wRrkam3VakMO1lK8xG1Tto2eNy7TnbjIDhG3cZbncgbAUX8UiS7FfAf_evSkZG2o4
    C9JQZIfHKw6Sdff4CLuhU5CMTDK_9aVwgwwpA5GvKdJ_GUwveMlL7I_>
X-ME-Received: <xmr:wRrkaoTog8YLAmL-hWoDitnAVNVNd8VTDzIq3p9Rd6xJR8oAdYLDxzQ69xq3PU2eKATRui6ZgKiL6T8KqOQPOpOQ>
X-ME-Proxy-Cause: dmFkZTEmEOPEJSH1eql5JUGO2SfLBegnxYOd1zhp43BYp6/Nes1GbOqxSCKIIhnf84kKwB
    ej7FBnGClcjrXk7EbABnroUWOR+n7VXou4F/kJXUHShu9fJ71dv1WZG7TC7kqBogPfMQ7Y
    Oaphsawk30sHfdWya6Jbou3lNgLmKVNOrs6fFx5Scb6OdpxHgpjvDro6QhTtnZ9YrfhyOc
    mMY2CZANN7kwy+oSR9UxYlXZ7N9SVuK64+FWXcOHP+uwjommaULHkReR6DFsP8Un6gbYza
    neAT4XaH1VyHqu4GRBGgYY1IO/0g1BcT8UPIwn7MldriqMaPJXqTYh/N4z1FvTJgU6nukz
    9snX+/QewxeIY+6A6Ld5lME55Lj7mEVKh4J39Rm+kk7wr5TbXv8ys+V131RMmsI3VATViq
    iCqRgfntYpFWCdLig8DlfIX8uYlsFmcK1x2J5GmZg16Gfy0pPcS1NNtzfg9fZ00f3PKh0t
    9utk8DuR0+BSftgDNBbFZVub00EzBkFhYGDA5t9ZYEiKGrQIv4NCVP4jknScQQTDoUghQF
    2xX+pWCQhcjmSq0pRDUP+dZ+5WGFmb59a35nVYRXteOqgCJFwtXh21Pxum+choTc+2Dkri
    oQirBIWgPAN2eY+moZEsexX7aTHiMS7pmT+t7wXs8F3YQm66Ws4mgv1nANxg
X-ME-Proxy: <xmx:wRrkahkD8pcSWpYFIlceTdkAzWTlWspu7fA6cKNRpONgI3huYToHMQ>
    <xmx:wRrkahMBMXL6drpHeihDIf1Ut7I-3nD0vv82oBkEoMi9XJihvljDzQ>
    <xmx:wRrkaljEBlDDegb2H2u4JtIegvqe0p0jJUMqV751gHRFlyE_ECwEWg>
    <xmx:wRrkavg_8779pZzyvpsI3E1zNioxsJUmZ2dhu7ADmMlY5qlZZrDpdg>
    <xmx:wRrkakTFROSAFr95pWnJTOhH8gQfUBgZWfaqjst6tl6GzTdR0ccUi5p->
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 00:19:11 -0400 (EDT)
Date: Fri, 30 Oct 2026 13:19:08 +0900 (JST)
Message-Id: <20261030.131908.2044279482126434618.tomo@flapping.org>
To: airlied@redhat.com, devnull+airlied.redhat.com@kernel.org
Cc: a.hindborg@kernel.org, boqun@kernel.org, fujita.tomonori@gmail.com,
 lyude@redhat.com, gary@garyguo.net, dakr@kernel.org, acourbot@nvidia.com,
 rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev
Subject: Re: [PATCH 1/2] rust/timer: expose as_nanos for clock sources.
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com>
References: <20261026-drm-rust-next-v1-0-14a4ae469175@redhat.com>
	<20261026-drm-rust-next-v1-1-14a4ae469175@redhat.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 12:56:48 +1000
Dave Airlie via B4 Relay <devnull+airlied.redhat.com@kernel.org> wrote:

> From: Dave Airlie <airlied@redhat.com>
> 
> The nouveau C driver does ktime_to_ns(ktime_get()) to program
> the cpu ns into some hw/fw, so allow this method for rust drivers.
> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  rust/kernel/time.rs | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6c0a5e8090d0..7fc366842901 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -211,8 +211,9 @@ pub fn elapsed(&self) -> Delta {
>          Self::now() - *self
>      }
>  
> +    /// Return the raw nanonseconds values from the clock source.

Typo: nanoseconds. How about:

    /// Return the number of nanoseconds since the epoch of the clock `C`.

Nit: the subject prefix for this file has been "rust: time:", not
"rust/timer:".

With those fixed:

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
