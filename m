Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D937B023
	for <nova-gpu@lists.linux.dev>; Tue, 18 Aug 2026 07:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787037542; cv=pass; b=jg9eE3yNwztY8V40hZmvxbzZy8MB/T4c1WNkA2yY1PM6XxTzjFJ8g2vhpZ6efFIBub0beLl5zHaNtl0aaxBOREtJnhuZkwZL0L6nQ5Rxl+1f7l7pqQyES7NaT6u/qnjF7LMfxMMezzvn+xKk7cQyBukJwdElAMy5fygR7PToV18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787037542; c=relaxed/simple;
	bh=WhPSBBPQGGZbolI+iA2pgFPPV7f1s1z0AqjG9jtoWO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXlgSAsKL53ueVNGE9sbWZr9UpdT+jy0ke1GXefnV1GlgBIaLZLjxVX86pa9ZDj0z8zHhyYtyQfsLDoK4x5iGJ6WmkxXODbs6i9HJnRchMx9W1wDSpz5dhrJxnllEguOVsO1NBuhgqNpNV2qIsrvLk1YO0RxmSzRr+PS/jUZIzU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMhTF2vf; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMhTF2vf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccdce28edeso622105ad.0
        for <nova-gpu@lists.linux.dev>; Tue, 18 Aug 2026 00:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787037541; cv=none;
        d=google.com; s=arc-20260327;
        b=S5raRoU/tGJIykBiNFmNVmG2iqrUU/LtjIIYZY1qCSKF9LOmLFAxmVMH72ZIduuQWt
         xj6sx0ONj82zN7iamKbx7Vl+X/xjAnSwCAdCQo7boe90zjYINdoJm9TuSJFitVJMFeEl
         xfbV8icLnC+bn58XU5+a+nM1M8JVCkjutZiLztmpVZ0WEQgGE3vnZ5LQATyGeim6KyC7
         FULPDRgddCju35QwgXfyQ0XGNRHlHiOncu2YD4EMd4qJqLGEioUQxp0CEk1X+meUaqxB
         MM6/qI8AJG4OHexCx97SLMqdZI7vAqff+6/zbC6r53BkejmBSblSPkjggXSBslZe0Oub
         ZfvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WhPSBBPQGGZbolI+iA2pgFPPV7f1s1z0AqjG9jtoWO8=;
        fh=P0A6232rVVyq7LwR/2aRXUE41tn6ydflgGjidI4d6k8=;
        b=G7/ik6LyR8UG6RDNj1S3Di02AXBEDaHzaNOzAA2+h+bJdnptDEgNG7JNMOoEjPmwbM
         SqFCJ2iG6wSUbBIXqy/ILCL+GZjocCweDFblskXNS4anRTFsZ7sfTGS7vVBcN5munyRx
         13FLWPXzOJzK7j9weiCkJhU8u489dr5E8kDE0hM28fait8gSTeDz7TDcqJtVvxGMWPKk
         cJjdZJBIHXTxEY6Wti4uhBGB38bY81Waf/nOPXHEvqBgaThmvIX+eab6/5vdg3EaRv82
         OCcaiZkBUCdgkZ2HXAC3XE+tcQ90g9HD6mv8vIXZau/gsGrvV09HEh0Symrp2IHbF8EC
         i8uA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787037541; x=1787642341; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WhPSBBPQGGZbolI+iA2pgFPPV7f1s1z0AqjG9jtoWO8=;
        b=jMhTF2vfIIUYjAl4CXrjjccXByuLHtBk2nBIMU/Td7n8lzWVjaq+H7ATtrNP8rrUIP
         r0+5LGzLmGxPaxeRBM6GA6CzmwP1Dnk+nvRQ0pMYD0rHFh1zMceCRMB66YNttt4Bcd7N
         H5YRsB53tAl5r6F/VSpEOQ4GGraaYHUC1hydwikVzuWQjwfk8j64OfMYhgcrIeQ8UsxU
         sZge6HIc5uZiMxdeo+sU8kglcfTbURKwNb37JriafWgpS2ZITd8FU0Hus7dlLHHj6VPX
         UITlLUFaYyB8WZOctycAy2P0Hq2nQxAk9Hp2Q1W5wZkVdBYyhiGItfq0Q80T9hkP4Lxj
         j0zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787037541; x=1787642341;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhPSBBPQGGZbolI+iA2pgFPPV7f1s1z0AqjG9jtoWO8=;
        b=p85GZzbJWh/ZncPXg8tf0k+q+PQ116WAlZB122hiRm8S8tzv059B9NSCcUYl/3EBjb
         O+KaF7qdI2h0qmwBtiesRPra+4ClkNRM15jH58n91AEEVNjFF+Ed94rfA2k/+m9X2Y9B
         Sk5L8X6mNp521gbp08HL1UI7F+crb7qsFQZCv0+mz8bHV69XwuY8z6gH/iTApLJbMaFw
         Ye/omoAZAHKJliBy9sicFG+LQuMWkZNGHRINexVgmAznc5uQ3l9Tkdphn3mMduiA/m6E
         Vc6rY25pomhFxB06b61+0sl5iG2ov3ySEVG2m4eKwIrzOKCNcaJ+wv9pq5WFGZo5VPC9
         M1OA==
X-Forwarded-Encrypted: i=1; AHgh+RohFeHEBD7+xqaP3wviuF5VgTeNlltmPD9WvxXncMgVQ3+/F/qBfDuTA+FiyUe1BRkhLuIqgAi+Fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAJf+Di1norpwTc0JOdHQAY8Oy+7RESiJdPaspRTH8vXhMPrng
	C1fQH6fWHSKH3QQTgvrKtKW/cbm1hEmCYWB3+Qd7Q2ZWqcRnXIlJOwZIcAD7pxYquk+wDPHaz3w
	g08liR9V4UVgwNogcRZaZG6a4C1yio44=
X-Gm-Gg: AR+sD12I71ko7n60D2fTP3TN88gDCln72PecIsEpr38RrGJBJ6F8G0hbWkgrZBOizXZ
	Q/mX3RrcmiaDtfbc7x/lW3IJUIHM8ZDeyz4OCYReaIaDh+H5RBg5WkLejVTIcCNytAhTS0zge3D
	oNoQq5sAi+Yn7tZKYnyD5dX4YOUqOTkHCxcdJ9MOHu35oseJ2hfm+XBPPOsHo53SpMR8x185ONh
	gblEkCFme9V6VgrsXUqEKG4xehBQ7LtTItfP0NNlDfMIfotu/i0gIcAuFuPdbTwVRmACwxtuQ2z
	tpwlQjGOKVhlCo7/ouv6dPYau/vEWf/K8rAVFG0/7UY5MBPX//c+ivnAHw0tceDQ2Zf9eOCsg6o
	Cs0+a22xMzNuXh8TWy6nDFEw9+y63vgvkcrwH6RGs8dXXA4CqFaAJnrwysyRm
X-Received: by 2002:a17:902:850b:b0:2d5:cbd3:8eb1 with SMTP id
 d9443c01a7336-2d5cbd38f48mr29929495ad.3.1787037540543; Tue, 18 Aug 2026
 00:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260812-chid-v5-0-6c767770b3f4@nvidia.com> <20260812-chid-v5-5-6c767770b3f4@nvidia.com>
 <anzxKO0X1OrNRD32@yury> <DKNN2LHZXRIH.5LUX95CZ8EA7@nvidia.com>
 <an4NvQBt3389jP6E@yury> <DKO414SNC0B2.248FUBGJGSPLU@kernel.org>
 <an4xDp29VX8Am0uR@yury> <DKOAY7J1IFTP.DMKSXK625EW5@nvidia.com>
 <DKOECWHEEAK1.3N3JXH9MH7Q58@nvidia.com> <an7bG2bEd28AbNRr@yury>
 <an8r4VECQ8iFP8ze@yury> <DKR0ZNGYW9IT.37N7TEN97GG3N@nvidia.com>
 <DKR5W5DGAWAJ.38LHLLNPO9R4W@garyguo.net> <DKR6EB8OWPXG.2QYAY81UG1RF3@kernel.org>
 <DKR724N9V3Z8.1HJP6NJC5A4ZK@nvidia.com> <DKR7N2LLIQZH.25F7VF4CET6PO@kernel.org>
 <DKR8MCRB76L2.1TV4D7261PVTH@garyguo.net> <DKRA0IU4WVW1.3AOKCY38VHTKZ@kernel.org>
 <CABwQupNA=NuctKz0FRaJsWowf+=24C_o7u8twFFeUZ+dq6u+Jw@mail.gmail.com>
In-Reply-To: <CABwQupNA=NuctKz0FRaJsWowf+=24C_o7u8twFFeUZ+dq6u+Jw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 09:18:45 +0200
X-Gm-Features: AcwNN1URGomC3yROmR3KTAJ4h6I32rNk_7AiTcL10HUoEZg2QkO9YMIizAjUoJk
Message-ID: <CANiq72m=bbjgMZy-BCsB0hajMJcKb+j=jeMN=e4++B-XSUOzeg@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
To: Burak Emir <burak.emir@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 11:36=E2=80=AFPM Burak Emir <burak.emir@gmail.com> =
wrote:
>
> To add a minor point to this, if rustc could figure out that a
> suitable non-zero number literal can be treated as NonZero<usize>,
> we'd not need a macro and it would all be very ergonomic...

Yeah, that and/or `1nz` literals could be nice. It may be a bit niche,
though; and we would like good ergonomics for our own custom types
too.

Nevertheless, I will ask upstream Rust in our next meeting about
https://github.com/rust-lang/rust/issues/69329.

I added it to https://github.com/Rust-for-Linux/linux/issues/354 as well.

Cheers,
Miguel
