Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217553F44FC
	for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 12:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659816; cv=none; b=lS7v9J+120Bzj9+8Z3lYUuXzLo1yq6NLgtnLjTnrmVcBaGJwE/nROjQIffDn8nFJNywGYfJGguFUK++eXiiZ1h0YvfKGbCmwHklOlN4OVpzstL9cL/XJLQnYs4iYV86xZi2lR9MJFyvqx2DefmR9M+Base6+8Vr5AQFnk9FCEdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659816; c=relaxed/simple;
	bh=OyyGXw2l0NbBrsd2rbD74GlPQuHdpYapoj+0rfRIRxM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S0WBtB11Catxzq2Tqge/n6sTR8ojH2FNPQhIScXOen47ohEkrp1okVPCIIGAaQTmhYMLO01U+ns9UrslwX7cIskixFuphVe7QjnpEbwp0jkyqeGZVSaOKkNg9ccWs45TrcuUwBKhanl83rXtgs0MzWqGGkmUmFp19lRWf5x6O7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CREogszA; arc=none smtp.client-ip=209.85.221.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CREogszA"
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f83450a8eso3705004f8f.0
        for <nova-gpu@lists.linux.dev>; Tue, 25 Aug 2026 05:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787659808; x=1788264608; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rq043gvhHpHDZLtYzyheTlOt41eSYp4wtv15MTCDIrc=;
        b=CREogszAgN09oxWdP0OixjDyOrRY+rGYVsM++DQgolQjVbiKMwyR0gAMLH9V4doyc7
         5bEDHKjLKTKaq2ILht7lM4cqrFo+ZFRSPh/0ilVPz1wTKMZia0imZvofiYD65rnN00aj
         BLuPBOjdkZTElHVtSV1qYvzTb2EUb6NnngZ8szUanYuPAprbEAWq8P8Ta2Ar3aaLOQlA
         OTwzfbSzFv1jtvaKEMaAHb0xgGiK1h6X6061qe17KhXiL6bOe5f3R7HnHr58YFScGRQz
         2EqBsPBIIPeJWFETeHSz3yrSbgL3aRntfGH7sPjvzZ7dFY1R8tDmrMFrfvY0bQIkggd3
         B9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659808; x=1788264608;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rq043gvhHpHDZLtYzyheTlOt41eSYp4wtv15MTCDIrc=;
        b=ElbMLl/QKgLioVz3MInmEy3IIavtlcBQJHjA1vlf34UUxIAUyHFj/pTy8UbTVUZ1OK
         wp+uasGDL9NE25z/ZeW8lsMouYGs4K1hMIR6l64SBnPyTgS+UPiSmpb9C5nPTWNIvVUk
         AR2oaRFdbA2ad3IFlszTm9Zo2LLTkDyMkjcWcZ3nADesi/SdsSq33kvbjon/LeMb/Lfg
         QeF69NaPkxUFBKTS6uC7DHSNxZlOnv/b5wcCPoDYiTzSGZAeIQVu4pyABik7wtQaeFUN
         LZTvFOGhLA/yZguc/VtCHpd9L7mn7DU7DFRm6QoJYhF1JrN3n93mwuJiVCDDF8U682ZM
         +I7w==
X-Forwarded-Encrypted: i=1; AHgh+RqJfsENmU9IEMJXrzKxyGTGu4n/TVWJffjTWXPKz7ASlgcRyx207cPeB2d5bGCF+RvQnq45e90HMg==@lists.linux.dev
X-Gm-Message-State: AFuF++m9NmP1megJUuURFlI9Cp+4uFH1HfxrSdvDmptIKlu8XrL+UMEB
	lnGiAZVvCMFvvUxOOdLzAPvv00Vs4pNCTUZeIxdRQCgVgRv5sBdYwUPZlFqhMDUss0KaEU13wN8
	g7UpatN3XGonRXWRs9Q==
X-Received: from wmbjz11.prod.google.com ([2002:a05:600c:580b:b0:499:af1a:8d42])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3544:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499b8301874mr380176875e9.7.1787659808082;
 Tue, 25 Aug 2026 05:10:08 -0700 (PDT)
Date: Tue, 25 Aug 2026 12:10:06 +0000
In-Reply-To: <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-6-a5872e64d8f4@nvidia.com>
Message-ID: <ao2GHqop_Z_9bsyl@google.com>
Subject: Re: [PATCH v7 06/10] rust: id_pool: take a NonZero capacity in with_capacity
From: Alice Ryhl <aliceryhl@google.com>
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 17, 2026 at 04:04:20PM +0900, Eliot Courtney wrote:
> There is no good reason to allocate an IdPool with zero capacity.
> Reflect this in IdPool::with_capacity.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Why do this? Zero capacity is not an invalid state, so please don't
impose the nz! macro upon users for no reason.

Alice
