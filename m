Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165D8215F42;
	Tue,  2 Jun 2026 03:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780371348; cv=none; b=ftae6BmNZfdsnbbPVBOg6flZfOoyIqyuLqbQRGZi2i7L5j6y2ITheRlbt535FUL4YKAPM3RS4QuPe9YkZiOQNgN/voCMiNhdV6BC4jLRG8xuPU+BVKqS29PeRy9hp6FZ0qMwCwa67G7MSH3Lq28+PMWlgM6qA37m1Zz6TTlkqFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780371348; c=relaxed/simple;
	bh=xM2NJ8L8qxwWOw24vmapc1HI8lekTdMkTrTgsdocu7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uXZMdeunVfnDhaH4++nK0/0gggTvT0+kXf1eobdEMIzB4mASBmdauu5tpK6pmRqSvRkHwVfPP4xoJP7WLJWEip5ok6iQ+amXrQam6VNg6KMQifFifm3JVvbSvjhHh7ZyMJXeirAilCa6XGWMOoFNhQrona2ZH34MdSPR9aJYinQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1Pp9QQx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1Pp9QQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989261F00893;
	Tue,  2 Jun 2026 03:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780371346;
	bh=JnPWzDXJ6J5JXVUFZ8dg6eypsytyQJ6Cf7Ig0NSSUYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a1Pp9QQx26cXseWMpTOBo8PUiYqPFv65JEH7MVjlwTx7yVAwRCuOeF5+Voq5tGAsr
	 sujr0oGJHmOodWC/jdUgTHqfoE7QRNyRC8zs6rhOaHniG3moBO/+uSt5y1NsWoMU1n
	 W+z4m9rR/eVO1qwTrFCdT6jCkYhWmUCpHMXv994jAYoy9mGmiE+QnbQlott4j1ThOg
	 N+d8JBex2LCFOmYHmYf7+UrYK8VkVc6ISkSvefwYVlqqX+IFJjXrd8bzVCABq8ldAW
	 24waH/cohr0mVSpxERTXxJ85uisejDdUWHtelgLFS9b5ZNh4aknTFTfgKPvo39zY5T
	 Ftuu/tM7cgHpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 17/22] gpu: nova-core: Hopper/Blackwell: add FSP
 send/receive messaging
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Gary
 Guo" <gary@garyguo.net>, "Trevor Gross" <tmgross@umich.edu>, nova-gpu@lists.linux.dev, "John
 Hubbard" <jhubbard@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Benno
 Lossin" <lossin@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Boqun
 Feng" <boqun.feng@gmail.com>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>
In-Reply-To: <20260602032111.224790-18-jhubbard@nvidia.com>
References: <20260602032111.224790-18-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 03:35:45 +0000
Message-Id: <20260602033545.989261F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unbounded kernel memory allocation based on untrusted hardware inp=
ut.
- [High] FSP message synchronization ignores `task_id` and mishandles timeo=
uts, leading to permanent message desynchronization.
- [Medium] FSP protocol structures use native integer types and are directl=
y transmuted from byte streams, breaking big-endian compatibility.
--

commit 4be2156ade2cecdc1c8a1f092241ae18c134074e
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging

This commit introduces the synchronous send-and-wait path for FSP messaging
in the nova-core driver. It defines FSP protocol structures and a
send_sync_fsp method to exchange messages with the FSP hardware.

> diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
> index f3524137d9f78..67cf83aba83c6 100644
> --- a/drivers/gpu/nova-core/fsp.rs
> +++ b/drivers/gpu/nova-core/fsp.rs

[ ... ]

> @@ -22,18 +26,56 @@

[ ... ]

> +/// FSP command response payload (NVDM_PAYLOAD_COMMAND_RESPONSE).
> +#[repr(C, packed)]
> +#[derive(Clone, Copy)]
> +struct NvdmPayloadCommandResponse {
> +    task_id: u32,
> +    command_nvdm_type: u32,
> +    error_code: u32,
> +}

[Severity: Medium]
Will this structure parse values incorrectly on big-endian architectures?

The FSP hardware writes responses in a fixed endianness (little-endian), but
this uses native u32 types. When FspResponse::from_bytes_prefix transmutes
the byte stream, it could result in corrupted values and spurious validation
failures like command_nvdm_type !=3D M::NVDM_TYPE on big-endian systems.

Should these use explicit little-endian types instead?

[ ... ]

> @@ -70,4 +112,79 @@ pub(crate) fn wait_secure_boot(

[ ... ]

> +    fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: &Bar0, msg=
: &M) -> Result
> +    where
> +        M: MessageToFsp,
> +    {

[ ... ]

> +        let packet_size =3D num::u32_as_usize(packet_size);
> +        let mut response_buf =3D KVec::<u8>::new();
> +        response_buf.resize(packet_size, 0, GFP_KERNEL)?;

[Severity: High]
Could this trigger an unbounded kernel memory allocation?

The packet_size is derived from poll_msgq(), which calculates the size
based on MMIO reads of the FSP queue head and tail pointers. If an errant
or compromised FSP firmware returns a large value, passing this unvalidated
size directly to resize() with GFP_KERNEL could trigger the OOM killer or
cause severe system stutter.

Should this size be clamped to a hardware-defined maximum, such as the
FSP EMEM capacity, before allocation?

[ ... ]

> +        if command_nvdm_type !=3D M::NVDM_TYPE {
> +            dev_err!(
> +                dev,
> +                "Expected NVDM type {:#x} in reply, got {:#x}\n",
> +                M::NVDM_TYPE,
> +                command_nvdm_type
> +            );
> +            return Err(EIO);
> +        }

[Severity: High]
Does this validation logic leave the driver vulnerable to message
desynchronization after a timeout?

If send_sync_fsp times out waiting for a response, it returns ETIMEDOUT
without draining the message queue. If the FSP firmware completes the
request later, its response remains at the queue's tail.

A subsequent call to send_sync_fsp will immediately read this delayed
response. Because this validation only checks command_nvdm_type and
ignores the task_id (sequence number), the driver might incorrectly accept
the stale response as the reply to the new request if they share the same
NVDM type.

Should the validation also check task_id against the sent request to
reject stale responses?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602032111.2247=
90-1-jhubbard@nvidia.com?part=3D17
