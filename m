Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3412E11D2
	for <nova-gpu@lists.linux.dev>; Tue, 18 Aug 2026 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787035286; cv=pass; b=OuXl1ATFqywrKOh+B4B2XJhDFTaIO0C7bUObOphQGaIbTni3HQpB/4PS4AYcx1kFt4iSK5gvj7RcTXLFpY57EdMCIrAZMmMWHjIH1jYwPHwcbFQ00K1tRfTK9MT8tQn5u51WkZXk/ozt2CQ39kQwLvBoHxSZAO80TdUjcPpKheU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787035286; c=relaxed/simple;
	bh=F66vDlwnqNRvpNa85V4+GIKOYUyq40PQaHNUdB5z/NM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+uHuGhiAIG498x/9WkXJx4tkdpdAwyHktTHe1cda0EYcJpYodWnOIIlhwzNBxHzXMhjAPhldxg/h/XsbU9UWnc0md4votx6DqWRpgvtsh5WpLPBQEAw90TcLh4+JtD+E/s/2c6lElcgDGqqYAQEP1d8GN5pdynNGcPiuvuvQmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idYpiR6Y; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idYpiR6Y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5862bc921so5030685ad.1
        for <nova-gpu@lists.linux.dev>; Mon, 17 Aug 2026 23:41:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787035284; cv=none;
        d=google.com; s=arc-20260327;
        b=g4q3gB/85xHfyFXI6+9V5se1iND7IBDs6uJFyVhL4CBGmQRkIBvd+Qx90TiK20YYM1
         4X+ifnN+1GIZ31aINAVLtECa+f3CLJm+6YaZ1IsT1MQDvtWfpKqV345zelapB1J+KFMK
         FQ0HkyrXeD5wmtWtJGYv/QKGWIreBEzpbpm6+grTPcsY9qOYTd0Vz1Xv5zSLNrz5+Fb6
         KveIGh5tq3AODyI6aJWmOSOyDN7rbNzF16JNsabM4yYEh8t4xjnBYzG2sl58WHqPGJfw
         g6Ut/ojcp075SERamRU+EKOdptM8FFHRkW3/O/RoF6hJLG6c0ET5hBI0GatElQpW7o2O
         e/Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F66vDlwnqNRvpNa85V4+GIKOYUyq40PQaHNUdB5z/NM=;
        fh=RiuGv0PHPkXsvqsG366q19RCeWQiejvJ7eKC+6+w8Rg=;
        b=rTSnFnLOWG8k29Tg0wsvpzy+ZXUdlP2zh5ju207Tvo5pIRrlcoKkAWkLPQPaePTIut
         UfK7CvBB1h8YNCumHA7gb+Muvn95DiFf7XK6XzXABDS8jW+5cv5a9T3ftDCSy1ZICFe5
         U7m4JI46QoHgz/sIxhzTsIW3b4XXTVneRyWBDJKXmu5Dpw03oQHjSS3weL4RavHNJgZi
         6V6Ll5lwpr5IKylXeZUtDqZlpNmCI90ovpupGD+I8sGVNddIgX/1GEY+kOonlYxJ6rl9
         LZioEq1TFx/2MV2mzMzYjnW5s2ecNBKfCjuqeS/aqZKJL0YKx1w3fqttRKvVTMCcax/P
         Krhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787035284; x=1787640084; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F66vDlwnqNRvpNa85V4+GIKOYUyq40PQaHNUdB5z/NM=;
        b=idYpiR6Yc8UloewOdH14SDyByt/JqdVcqBkpAB+mXCh/5BZiHSvXNIuEyQgDQFjl4v
         b2ea8NZoQFz/dNdoHdRNnAOWMBHPjboWMKWU+1ZEkk8ynesgB5CwKBKeoFh7mtcxfij2
         OLgpsbjsKhFzAv8OVpV5dOPEcuOh0g2j/n5WJSHVLm5QYq+x2ccDxVe4OW7eJmDIm2TX
         pYQpk1NplX4O+jF0SIbsy6iuikOfBuARn+2poU762PFww8ZUG20N9qe3HqCj41GLIJfH
         c8yb3NZROiFlLcDZRPndzZ0keKZUfKoN+/sNfzjb4evjQWnSmSykdiVNd09mAW8nFWJr
         EIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787035284; x=1787640084;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F66vDlwnqNRvpNa85V4+GIKOYUyq40PQaHNUdB5z/NM=;
        b=pkTADZU09CM7XnXiyql3lC+LN8Oldkz/lzZVwE+4cmuyQ++EKdYv8uNc07mmKDqkW8
         1ZCDg0k5wddPQh+dBnGhVrsg2Q6ljFj6ELjhlgmw+GEOIi0zcHqjhKXx2uidS+X4veHy
         ajzBR7gIMWB6YBG3eILk7vYGKJKiEMXjDpk+Il48RE4B9YWzCBY27nc8+edmzg6AiAdx
         K9oi2MvGRXiVfP2kJeghurqrXcVekgqVrfA6Zh5d8TbPlnaMWYfsSe3/GFQJ/4N/5k5H
         Y9FYTD5SUi5/dvRXnb9erWgm4UlJKbDtn9gPmY6X/lM6pUedyAUhQZc6zjaSfkXKu+sK
         pNDQ==
X-Forwarded-Encrypted: i=1; AHgh+RpBCsDJ2eeLPaTcD/gRt+hnuCbMC3kCa6hCgliWmQfU2xF7C7JUspTCQ78wvGS1YZmxf8vdGJEpKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdL8sBuEXF9KRBYDDroDjIiR2oCsrf0NgvU7NbmyUZvgUFhfKY
	WNZxjNkqFCp6Op3qDfel6BiwL6+z9fMUoCb8kRHw9vRoD4qQHKcdxww5fKtxPkhmGd4tDAL4Esu
	IJMmSVWDdTWkJxWPxEb7lQ0VDKqUPc2s=
X-Gm-Gg: AR+sD10AsE6Jizq7FLPaUdXD9KEjMIWpmhL/9HtwsgTaAdI/cpHoPkTCqingDtiYkyk
	Mvo3iToKz3rGbHiKRILg+Cb7OF7xdzwTYxcM21sZNMg9IPU8ZfBpSIdk+EejWdYdGNldzQc7Yl2
	jXz1at6Cn1XtVThodZv8V2tlNxXhtIMeBGoqQDLZukAwjpR7Vw2iwdZM5ycVHtUSAXV7Yq9RPZU
	6s5XDhNydA2PV4gNjXkWh2QIHOzSlw9Wb8n8GoALlOBYi0SUaVfSLJRWP+jN0W86XrE+gGP8elw
	NPiDyB8ZizWl2c34DC8GDzhDNWr2kST605D+7ffyETl83gGsVwronkGsE9Cywm/0djhjMgqrhg3
	40pis2rtRVAj5MnxPWcHe8EM1NVfM3P2/HZ6otEs+frjLw4NyBf9i15WYS/yTR+HG5IEVsBs=
X-Received: by 2002:a17:902:e54c:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d3b0503575mr218175045ad.0.1787035284410; Mon, 17 Aug 2026
 23:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DKOECWHEEAK1.3N3JXH9MH7Q58@nvidia.com> <an7bG2bEd28AbNRr@yury>
 <an8r4VECQ8iFP8ze@yury> <DKR0ZNGYW9IT.37N7TEN97GG3N@nvidia.com>
 <DKR5W5DGAWAJ.38LHLLNPO9R4W@garyguo.net> <DKR6EB8OWPXG.2QYAY81UG1RF3@kernel.org>
 <DKR724N9V3Z8.1HJP6NJC5A4ZK@nvidia.com> <DKR7N2LLIQZH.25F7VF4CET6PO@kernel.org>
 <DKR8MCRB76L2.1TV4D7261PVTH@garyguo.net> <DKRA0IU4WVW1.3AOKCY38VHTKZ@kernel.org>
 <aoON0FepAUw1b003@yury>
In-Reply-To: <aoON0FepAUw1b003@yury>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Aug 2026 08:41:09 +0200
X-Gm-Features: AcwNN1XoW3I66H8usbqd_WxG6tEFGRwBY_Sn9lhKHblIF3shDY3QyhmlBc9AX_0
Message-ID: <CANiq72nFwdXcN+C8nJhd5Yq-cdUp1CDw_2u-D+zkgvW1-a5dLQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] gpu: nova-core: add ChannelIdPool
To: Yury Norov <ynorov@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
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

On Tue, Aug 18, 2026 at 12:40=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wro=
te:
>
> Again, any kernel API trusts it's caller. It holds for assembler,
> for C, and I don't see any reason why it shouldn't hold for Rust.

Because the more you trust callers, the more complexity you are adding
to keep everything dancing in sync, and thus the more perfect you have
to be on every subsequent patch that modifies any code.

So this is all about not having to trust callers as much as possible
-- the point of using Rust in the kernel is to prevent mistakes using
the stronger type system.

And preventing mistakes is not just about memory safety. That is, even
if `f(0)` is not UB, we still want to consider whether it is worth
using the type system to prevent such an input.

In other words, yes, restricting inputs to functions as much as
possible allows us to convert certain functions from unsafe to safe
ones, but it doesn't mean we have to stop there: we use the type
system to prevent other mistakes too.

We can even have types that do not restrict in any way the inputs
value-wise, i.e. they may be pure wrappers of a primitive integer, to
prevent mishandling such as passing the wrong kind of unit or mixing
up two parameters.

Now, particular cases may or may not be worth it, but the general
principle stands.

Cheers,
Miguel
