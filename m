Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066180;
	b=X1VH8bBW+iEANBsPQp8nxyyDbCxTGTnDjFhLFA7KzP9LB7aHG1GewUDIKJtYzG1LmT0H
	 OJR2SJIfepr5W7D06AGx/Aw6WY+3OV9o8rhFVtmWiYVYi2gif0HkiC1yagyMCPHZp6h5a
	 696GrBGSFZjUBTK0rWl6614WDJpSVCl5wiSaVspZL61qTdOqxBqffN1OGgIqL+sXX3bZr
	 SdewfSPVHWwhhVvfCkEte16MoJe0fYTEwxRJCfr5n4aL7rBefE2vzxHuSCGHq/42K6ar/
	 3cJ32Zzxy6Mzu2w3F7pwOxELe+QhjrgLgk4gWOlLjT7UOpzkcvXJPkiWBLnKxCd5ndw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=UtE4jHZNbkA3H0t8CQNNqyMHOp5CvbRXgZpzIPjWa5Q=;
	b=h4ck10CirD3qkbt4Ntp/DZNwGfP2YdERtNcTTKLGWdkHKISS8v7zBV2rG4+ezS/SCQm6
	 eGr38IwYt4+G3YMgJjlLN9bxulXf7oW9G3WPmp16P5fWvnOdKYSD+aQlSouUcmf54iUqU
	 wLVYu+085ZSbezP4qyIzocMACodGYIr5bf8kNQtdhRThmWeVBz5/xEOBT9x0MQ1yg5C4h
	 XTQ6VMr5DWDicv+YnkgCGK9+6FF1ykC9Sm85YleVnggNBMqEgCGklCp5Jz1CLxxCDz0NQ
	 ozIeHhnyU/4NfKtP+mviV5+4nq4EHwbpxKFtn8gstTIpYFN/eGRBrQarVShmGRKMLaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c4DUnhph;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE3E606A33A
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 15:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE3E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=c4DUnhph
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-492425d771bso1118295f8f.2
        for <nova-gpu@lists.linux.dev>; Sat, 07 Nov 2026 07:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794066179; x=1794670979; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UtE4jHZNbkA3H0t8CQNNqyMHOp5CvbRXgZpzIPjWa5Q=;
        b=c4DUnhphnIi8MUs5Ptd0T1yYfOOVCGtDJs3h3E54Mp85RP/D/piCMw8Awj7Ta0YnY3
         +cQ5mraTM7P4BHZ6cGUjq2U/vudnWw3UMclBfWz/ghWIWNXX86sliKoFsKhPrGZX90dV
         Vfq8Tk5N237UDm59wyXQwXZC5eTbw0y9CQYZZdhfjuNlBNlI6uIWZAs1ftUUjpgocry4
         z4x5JRazaGJIcGFFVpLLUC4Pz73wcaHksgLl8ASlL7A/phSkF9oIeCbg398e/AVRCjgA
         iBP8uV7tL5mBfGmzxkTgAOv3nRIKFzvfIXaLCBWXuszvd+jBGfWNlbTUkGT2ByvlJwgV
         k9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794066179; x=1794670979;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UtE4jHZNbkA3H0t8CQNNqyMHOp5CvbRXgZpzIPjWa5Q=;
        b=0Zk9gDIlSofyVPYE7XRaQN7uPm/RQL2y2bUtE3xTjbylJMDHOvYzKwKws2d5ld/z/j
         ES2berS1xTqNCclqDkT2s9mVWSxevFQmUyqfRXRAXy1MRU3aYVntDgcv3Mcg7VcIseBm
         G61s3mXvlGRQqdHPr5EnVJphrjlgCZBf8o0zAPJQpo5aueST68rzsLhlPQHznOgPLc1M
         l43bgjCwb6ANq7DMger/m6Ru+EZeMO0oq1IbysoeQVl5yawzRe+/lo0SyxQt/PErnsX1
         eQRVmaQZx+R0NRwYF/NnhuMcuWGNDQ9oUoWsZIjXl+qWcQPWVs5aJrNyCBXbxM7G76dn
         1Zaw==
X-Forwarded-Encrypted: i=1; AL+hErFBM7xYssY6fE+vWVY2iONHm+6SlONCDoNVjycdSCHep9pxF4dhtb5JKDD9fw4FRJiaBEuv9Oycpg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+0sH/75XO1e3UK0EiHYc1DPOJtvGQZF1whwwng2rer1CMRmLHi
	EIxS6ZQXU4lnZsWG7E0BocY0BbW7A9B1E6mkhptKqEympnopE52P5IChNIc/asMQ1FHn+yVnZSC
	8043OJU2qxhPi6Dhk2g==
X-Received: from wrwn9.prod.google.com ([2002:a5d:67c9:0:b0:493:5480:e00d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40c9:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-492765a3fcdmr13214907f8f.25.1794066178310;
 Sat, 07 Nov 2026 07:42:58 -0800 (PST)
Date: Sat,  7 Nov 2026 15:42:57 +0000
In-Reply-To: <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-2-67de9180b4ed@nvidia.com>
 <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261107154257.3547546-1-aliceryhl@google.com>
Subject: Re: [PATCH v10 2/3] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 07, 2026 at 09:58:31PM +0900, Alexandre Courbot wrote:
> On Mon Oct 19, 2026 at 1:29 PM JST, Eliot Courtney wrote:
> > Current code in IdPool::with_capacity rounds the capacity up to
> > BitmapVec::MAX_INLINE_LEN, but BitmapVec::new works fine with values
> > smaller than this and still uses an inline representation. Remove this
> > behaviour.
> >
> > This allows specifying a real capacity of 0, which was not previously
> > possible. This breaks `grow_request` in this case, so change it to grow
> > to at least `BitmapVec::MAX_INLINE_LEN`, mirroring the capacity floor in
> > `shrink_request`.
> >
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
>
> Alice, Burak, Yury: I would like to get this series out of its current
> limbo. AFAICT, Alice and Burak are ok with the current design [1][2],
> and Yury's request to change stop using a zero-sized pool in the example
> has been fulfilled by this patch [3].
>
> This series would need to go through drm-rust-next as we have
> dependencies on it for the 4.5 cycle. May I ask for an ack on this patch
> to push it through drm-rust-next?

That's fine with me.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
