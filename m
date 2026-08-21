Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3479B3ACF05
	for <nova-gpu@lists.linux.dev>; Fri, 21 Aug 2026 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787340946; cv=pass; b=kr+68lYpoGY+wkio5XCB4ZEMeaBgseIajK6i/vQdeBNwNKS6Y87+/ryHxG92gagB8E2HNQFUo2JQZn/m/UPbrIIHsrxG5Y1IyUTPLD8Mu3eG8v4NW0mtTM+U033FQvbbi4VdDwMqIAkkFfqPxa+SicIhif5DHJXpwC2NAPJxwK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787340946; c=relaxed/simple;
	bh=1/9pitlXb84t05mrk2KlDSeIz4lgs1R8Q2Yf+2RoA4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSPjamf5XZ84st3vwkWbcNHJgV0+r0TxcitgllFHFPpSzTOIfKKwW3CB480oOmaEjM40p6WiZr/UnDb8Zz7a5OBALDn2Gp0sL5zTle1mMosW2kr17F/ctP8bO3dMjGhJXb239MD8kD4SUwEoV/2IB/oYc+be9P7mr1C6argis90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLwrrmu4; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLwrrmu4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5862bc921so3429825ad.1
        for <nova-gpu@lists.linux.dev>; Fri, 21 Aug 2026 12:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787340944; cv=none;
        d=google.com; s=arc-20260327;
        b=N8dU1IaMahO27ozoLg8kbSrOpHrMpxOMEU/FGDu5BzBAl4u7v4xiwJkzcTWlsHNYXh
         /1LOL/CEAJbprtocd4kA0veV2phw/tcWvEKBzxiwZ1v8L6qdJS8+//tqzVy137rrT+PQ
         ZtOzzkBd2COrmc1jGEP+QFMXGR2maELND4M7jKWEbs7Cizbrav++8bJ+SclJ0SfR1QPe
         Qqn0A0hqr+dYAS8CbnpYTw7fIdiG99N7OZxqQvYPaxEkA0cJq9NW+14woGjYGmUCQJ3Z
         xEBkA1S2KpGpJsQnPrGOgw9bpp3VAq2lHHOXN9qaWjOOJmm+XNSWVjuR5VoPjAE7uFWg
         tYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5nG/DZhGK8Y7YLUZZ+pZCC7PZWOsMHI2qlWWbSO6I+w=;
        fh=2VmyebcYBJHXzXOFqBV3p9DvlkxtOjg+tIwg+EAkXzU=;
        b=nI4+Y3Dts9UV3HTSQBd1A2ip6jsAXPVd72vduDOvJNOEg5t8n39p52Uee7WQBYXl+7
         KIvzKdk3IrT7qm7uBVKrqbR1s/RCsZiaSGS4xhBuirYqJklsiqUKSUnxBpGljQo9mn+L
         31N10S+zlPij5QAdmuYLfKGDfH0Gznz59cYs9U1cMYeq+4/VW8BSeafFqNzWDYSnWthh
         BdZHagOnJWuTikNg/39uLAfWoJr0ulLtTG0tRL56P8SZ1o5MJaUianb3fzuIK/q1m/Wc
         qa1lU+m879H5J8CUpqU7BVZ2CPWHL1JTa3/Q0U7lGElaiLwz7NLb757MY7mgdJQccA0l
         U+gw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787340944; x=1787945744; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5nG/DZhGK8Y7YLUZZ+pZCC7PZWOsMHI2qlWWbSO6I+w=;
        b=FLwrrmu4gVJap0QewZbAcUPCURw4herXHLKiYTUMKJiOon+N0/18cEp0zFKNRtFuGb
         ao0Jp7rPndPFjVjRyXZ0i/kiONeR36U2OIZ353Io+lU9LzoSTeNxHzMtB0otrSUKr6kS
         p8YXwWXI3izBRkZ1H9Go0DCfjKwRwrtJAUOsEKgwinYSd6OKb6xYS4sSY834gmNYg3uM
         J6q1pWh2EHUKKXwHwVdoND8CNHz6AD/bJRL17lg9mrx3/iUO6USigo9KjyDQS1f3/GaU
         5HPWec2qxRyy7zAZquafi2cnvmm61/NCV4zrQ0mrZVQK29bwM5eKbyaLiBUjEbrVMhvi
         msLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787340944; x=1787945744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nG/DZhGK8Y7YLUZZ+pZCC7PZWOsMHI2qlWWbSO6I+w=;
        b=TcOyBYtxZNCyQuIoAxhI27temHiAzn0tyvBj6pSLjvy+W/4e3G3P5dbBFvMIwmRLP4
         iz40w9+FwqXLnXtjAKcdfcbZS2Aw+tzi0ZXs5+y2pQyy4FAIAC6IHNFHgsHpbqYZoweK
         JLCM6hlEJelbait4dWK6PAcBv8dCtQBdIRvPOFuqdTwswtE+WNvBEG8RlG0Cvzt8Nhkf
         fzudpVxfxuc/RwP89BQVor0N7ODTjva6irl/chfAhGQTNF73NtK44cN6hAAbvVNzXfO3
         7eiSDw2Nb6dN/GVolAHiZ/xjvIOAV/fEO39i21e2lb2XgFwsbdPCE/wZU0O5ROpIvsC3
         a7+A==
X-Forwarded-Encrypted: i=1; AHgh+RpUhkgkanYPO2XtamOmIpZ9KCqTbW+SIvx9GCkMkhZDCO7wxJZU2r9LRIbXbrHy9IIwDbAx8kWABg==@lists.linux.dev
X-Gm-Message-State: AFuF++lZrGGn0+0zJAL+k+DeWimPlSSH80nMzblPQJ02yZ/sxjBdBw2f
	GBEwqC8dnaqn28VebQuFS3UYT39aPB5S7s3yMlTgiwADr8oURKeXpQwbsXLSZHZNmpBH8XeolUD
	KE7nMwV/nTy6ZbLG5Xsy+YOhmdPJqSWQ=
X-Gm-Gg: AR+sD12uTAPLtUBeioACwXxbOhRAWFxjzCl3FnYGWM+WZ2TmWgu+fsSWZ04WIYgkpIM
	Aof8g1/JTWD8t9bWouwu1yNbpLOcqUGUMeGE3iUZstrhFFIm26uFhkbIoLhJK3oYXHd0TC8gadd
	E4yHqUC9VYlkIR5c5BfwS1jV+uf18QL/DKT/LUzBm/eRc8OYaCU/Dwsr7adFkyh5J+iFUvXWyGR
	ZNf39S0i2Hh2QdC3zmrhjKbb3uOD0xLxIzm3JtzvAuMsNCdja3X0vyNDd+tV1lrKAFt63/reVMq
	mrUN8Q/bJbV3vCPtA5To6PRgD542OTlnHPE9oxghoVwzgQENg32ROWf1nS0gkJjOLO/bMHghgxi
	miM35dKrqfL5/n9ML50k8IwdQ/obPeIijidajdUyVGcLPqQaW/VJiIa4/Bb+l
X-Received: by 2002:a17:902:ef01:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d64aff2aa4mr82872185ad.2.1787340944584; Fri, 21 Aug 2026
 12:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-5-a5872e64d8f4@nvidia.com>
 <DKUGXCFA0Q77.36Q64A1AN6FX5@nvidia.com> <CANiq72=ot1SVQRxzX5NmyTspzf-eMKca7DQMdUMSHtThn+kfpg@mail.gmail.com>
 <DKUKM1RPFDA7.1MBU5EY40OJ4J@nvidia.com>
In-Reply-To: <DKUKM1RPFDA7.1MBU5EY40OJ4J@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 21:35:31 +0200
X-Gm-Features: AcwNN1XAwQYarkYaZO96R1zQNSWSUsItJpmCPtqUwSLujolMS-yXhhZvmEccbTM
Message-ID: <CANiq72=sti1OfTHzGWGE+EJxqBf_k73QFy=G5HwowSF=xCwtmw@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] rust: bitmap: add contiguous area operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 1:04=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I'm not super fond of the different behavior introduced by
> CONFIG_RUST_BITMAP_HARDENED.

Yeah, me neither, although for a slightly different reason: I am not
sure why debug assertions and/or EB cannot be used for bitmap like
elsewhere, plus why having a custom config option is needed just for
bitmaps. See e.g.

  https://lore.kernel.org/rust-for-linux/CANiq72=3DtKVD13GD2Bzmt_LnC4SiOX1n=
kHQPcz2BS=3DP=3Db23e0Yw@mail.gmail.com/

I think consistency is important to help maintenance and to reduce
mental overhead for both contributors and maintainers.

Cheers,
Miguel
