Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0834477E5
	for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786995759; cv=pass; b=G1YOBtA6Xf+LxsXhGECB4cfCLxSoFf9F+fBsOm8vbRT1tkOidZXfrYcAJsAZte7XXkybman8hq9GpjtZgWdp6z1g0N9zFXLlJiWdcNiT5FwN9/JV6D2I/hPI4PwIbeDD3OnAi8jxU0QSKOHzXomMKjTTiJv5KfuFEsOiq1Mx1dw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786995759; c=relaxed/simple;
	bh=vixakSBqG8jvCwQICQq4eyAI0L2WXXSanuKhJ9r0hgg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nG424Vn89Rnpz3JfoTLljLe3mdic3rj6V4rwPIXr4eZIdekh5nGuUtxiR463OYnXrWziPpO8+HD6+rrd5cC7O7k59XVoPYkZNiAV1BBgTlgPhyWAOwuT7A7ZPxmt2LWV/q+JX8zNmxQk4jOoPOB5Wb5On0x04JXNw94Affr2wS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUlD2LQy; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUlD2LQy"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9e7391839cso3735612a12.0
        for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 12:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786995756; cv=none;
        d=google.com; s=arc-20260327;
        b=hS1HU9Z6X3176ibYxlFjjfBI4RW3rjxInykHaiYiv01iMBi9wxx2nvn4IJLI7L3pUh
         AIGh+LxP+5n1kuXNO02CaGWGkqu2VFwBBBD5PCs6Qj9ULy/zmx5/6W4AqlCH2luyWhPS
         9DG1kZDgjBEy6BDgutOc0gNP31JCU5EtiUaGCpAUcPA1rRAEvc47TMQynj6670ssoxgy
         8nPaGFP9EIdla5fSuuHLtEf29NTVtWE15IsIxb0/rThsyWKdq7FZjpY/8TM6jOd//dtj
         9BvDt6mYFlzoXDqElOaQIORRnz8s0DBdQQDK3+gBs8Vd/hNDC9qgH326FNM/FP77tNJK
         qPsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vixakSBqG8jvCwQICQq4eyAI0L2WXXSanuKhJ9r0hgg=;
        fh=xj5TwgNwTH+CzchTHxBUNpItgDKxggo74ajgXy7hFNM=;
        b=BvpVdXakGeAESHh+abdV0iNGY3NDVEbdPw2wjvc9xqlK7T+jI68H46ohKZwgdzFe94
         vd6+qFS9Jn+OfIPPxLew4Vuuj8oPKXDQxNIi01z+OrvHds1RqV6uumwXDEltzrRU65qd
         vjx8baiCKR8CLQnHq6MDJlH69sJSzwTMtnLo30APzNMGJkEn/gdZxq6kc79e1YHvtTlb
         OCSzi0vANRzPPkEe+/QUf12XbHxFH6evheSDGgZzFEHQocCoLVuoJYW3USE4WXoSFJ+a
         foJonF0Qu4cmqGBYcAuJHaGgBXralrbpoDDmpR2s8i7TRSAqmECJsCTflscQyHbjTXUP
         ClkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786995756; x=1787600556; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vixakSBqG8jvCwQICQq4eyAI0L2WXXSanuKhJ9r0hgg=;
        b=KUlD2LQyeew8bBmc51Z3c5mN+rET0jHkyW5IBI4iO8+9m/0tb1fVwKn2gq2IQ3gPAt
         Q2h40NHpK8FLcJDt0YiafJaJ22+fEQVPdJt6j2lwKMCVqeMiaNDmPLPyrv3PmFN8NlWs
         AQ9ByWQ5yaTxkuL7dVmVf+3Y1PvuEhJEXbC1pheLcW4JQN2HQG+V5pWSA8Per62Td1oW
         MyEmvo1V0MfF7qGOnbMwl9QzUsP98z+AnZaxtDPZ7XIg4eFV4Jz51mY7K22ojrNVj6D8
         YILlXdrNMbVkBiwPaRdjOi3luXbfruzL+aNw32+pZFPrfkmIHJH/JSDcWy8oHo9a2WOI
         PsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786995756; x=1787600556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vixakSBqG8jvCwQICQq4eyAI0L2WXXSanuKhJ9r0hgg=;
        b=GyD5aUEmfZmvCAKgfIrW6SxrbWqFssEPaIZxnWjGq/oW17B8yxyuVffYspAh2CkLqG
         b/aovxIA60Pm5aqdUGuJgOzF+AdLoVZjOglsRtvV4pwKcaFY1bYluYgk54ELcGaY3DVM
         DMQmrc8yg/c3ryQSUyXBAr3iuidHiCaTpQ3A3p9iQVWH1zgmAaNaG7c7z58tk3Q9T+39
         IJ+N4fhLlS+SMy3jneWlcLKgbmRK48pUOJG7NgJPpJEH1jZkwiAw0Rd4vpFLTutP8COn
         lVwPs2XmEEpxTzDZpNr8rkwSq0jyIhV47nuMGNYHcW4kQAqp4z7NqKvIN7j1pVNIF5Mk
         Q7Dw==
X-Forwarded-Encrypted: i=1; AHgh+RpxYqGSZGEvaPs/dbI0fyHOay1J2v+MoC+8AAK2qeuaoh7shNaOOHg30r/xvTpqGVoWPDGWQ/nBXw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz259i9gDSuSzgRD6DP3mWgA23Y294cWQ+aoRfMOPF6RsgDRA0E
	fkaT7wWldW7WWxv5UpqUA/tIrowQDQEDR2CCUjb5/9czAgIR7PUG8E+0v02CGiaPIf8K9imTByz
	mYtqeHufRfVmD5115B4hu0sgQFrmaZCY=
X-Gm-Gg: AR+sD10AndIMpWbt5vkyFBpHPsu4XZmlSO9dQb5Q++keKFNXDCTH5vSqpVohXAlBuOm
	0fxqPvX47JWooL7dkHFb7+5RKt0AwUWUzkyTzVP5ra4dh4f2/hd1BqBxCkfT7pQ+C9YCU6m5MWV
	CmjGC+Ku6BK9kHh/+Y0juWyRDM54G3RfG9e/ehWfKtcseE0KcE4kZ9Q3Cw5uHMGE8hhLAnNqfoy
	mxqNcqFrKi5c6ze/2ITGp/rXxJ7+KrcAwYxaFzndj5rQAkc5aqLEMHWyhC75OX2PUtCfrlsm/nY
	G3csFFZSQ02cwXiPLKNhqw86p+WSm43dVLBnW9gKJd8SnkgnOUMThlhF8B8/otZyjik/OIL5UnS
	MI10HqXY0ARW03ZGRKujRkANlPzwuBw==
X-Received: by 2002:a05:6a20:258c:b0:3c3:8129:a492 with SMTP id
 adf61e73a8af0-3cc71e0f012mr28014271637.38.1786995756083; Mon, 17 Aug 2026
 12:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-1-a5872e64d8f4@nvidia.com>
 <DKR5D0EQTMIG.15W9AGBY0I7YM@garyguo.net>
In-Reply-To: <DKR5D0EQTMIG.15W9AGBY0I7YM@garyguo.net>
From: Burak Emir <burak.emir@gmail.com>
Date: Mon, 17 Aug 2026 21:42:22 +0200
X-Gm-Features: AcwNN1VsQNOhBePpFFtV90j_U_qeRDlqUCWptv1GTTKIn2pB6mHEM8ZqqsTol8g
Message-ID: <CABwQupPn7mEGu7oS7R_F84werNFMxN-uoxGb0An9e9D7tsYvdg@mail.gmail.com>
Subject: Re: [PATCH v7 01/10] rust: bitmap: use function-level cfg on kunit test
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for cleaning this up!

On Mon, Aug 17, 2026 at 12:29=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon Aug 17, 2026 at 8:04 AM BST, Eliot Courtney wrote:
> > Since commit c652dc44192d ("rust: kunit: allow `cfg` on `test`s"),
> > we no longer need this workaround.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > Reviewed-by: Yury Norov <ynorov@nvidia.com>
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
Reviewed-by: Burak Emir <burak.emir@gmail.com>
