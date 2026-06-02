Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974522579E;
	Tue,  2 Jun 2026 05:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780378603; cv=none; b=erIesJe4jh+vy3IqXGBGTmPXaIN/0JGyk6EVC2jxSr4eFeBBL+76GPbI3kkL9AiaPMy5eSf7p62pg78dUyWVCekRPEKTzqxRd06EY5P5BlAEwuejrdcP8ec4QPUtxtJsGaSchwbCtOcspQXRoADlFPC0b0nmHvNxJ6ntmbhexH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780378603; c=relaxed/simple;
	bh=sp1On+1o81Ndi0vxngecUqJVHrJgS5q9jM/xNDlm97M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FDTEduoNc1tpnVH6O6S0VkFAHjNyygVOueQyxX+YuB6yKay1UD4p5Rwe8PbaoL/jpT3zGhsObhi8vRcHUe5oC4WZ1bYQdnIgomcs/fA3AneHqUkoOCDSYOzRbH2jNHWMmOSOGNS2FHMQ8WBcVG7aTQcSXGxO6iGxipFVktdljJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQql/Iy5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQql/Iy5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1DE1F00893;
	Tue,  2 Jun 2026 05:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780378602;
	bh=8FQULHwU3rpyJSYGh/XzUVIRmtYdG2wWUVI0AmWsnNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nQql/Iy5R4X4sK4BTUIZajMuKJfrsF9eJkXsMuakYFXF1MtyAjGxGkjkWjCwlinUq
	 Z5LoCdHDWa372EnCHWXt5L3wgjIhmsmrU5DGnTQKyyvsqipqF4HItwjwJ0uEZ7HXEu
	 Aita2mdLA8ZEMtEF+miEuNo+HOlvKa06vMXvIpp2S+0ad/C+rEnrqFnJsmkCajWyZn
	 JHqIKM6ihgU3H6/MYRMceqRIZd6O42YuVkXDK9u6DN6HKhSBLBwVsHk8DI/JpMUHjo
	 85BT3ahAYA+A+fVdrAczePUsx8CdFbjm0BAB4GiL1Re8GyzQ7zQ4oojL8livFpK3XZ
	 NcaPWuD6+3NJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 16/22] gpu: nova-core: add MCTP/NVDM protocol types
 for firmware communication
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>
Cc: "David Airlie" <airlied@gmail.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?b?QmrDtnJuIFJveSBCYXJvbg==?= <bjorn3_gh@protonmail.com>, "Shashank
 Sharma" <shashanks@nvidia.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alistair
 Popple" <apopple@nvidia.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, "Zhi Wang" <zhiw@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Alice Ryhl" <aliceryhl@google.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Trevor Gross" <tmgross@umich.edu>, nova-gpu@lists.linux.dev, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Benno Lossin" <lossin@kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>
In-Reply-To: <20260602032111.224790-17-jhubbard@nvidia.com>
References: <20260602032111.224790-17-jhubbard@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 05:36:40 +0000
Message-Id: <20260602053640.CD1DE1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Wire-format protocol headers are defined using native `u32` instea=
d of explicit little-endian types, causing incorrect byte-order on big-endi=
an architectures.
--

commit 790a1556a39d680db8fcdb2896578691a18e9d1f
Author: John Hubbard <jhubbard@nvidia.com>

gpu: nova-core: add MCTP/NVDM protocol types for firmware communication

This commit introduces the Management Component Transport Protocol (MCTP) a=
nd
NVIDIA Device Management (NVDM) wire-format types used for communication
between the kernel driver and GPU firmware processors.

> diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
> new file mode 100644
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mctp.rs
[ ... ]
> +bitfield! {
> +    pub(crate) struct MctpHeader(u32), "MCTP transport header for NVIDIA=
 firmware messages." {
> +        31:31 som as bool, "Start-of-message bit.";
> +        30:30 eom as bool, "End-of-message bit.";
> +        29:28 seq as u8, "Packet sequence number.";
> +        23:16 seid as u8, "Source endpoint ID.";
> +    }
> +}

[Severity: High]
Since MctpHeader is defined as a native u32 and embedded into FSP payload
structures, will this result in endianness corruption on big-endian
architectures?

If the memory representation of the struct is serialized directly using
as_bytes() during transmission, the hardware could receive the bytes in
completely reversed order on big-endian hosts.=20

Should explicit little-endian types be used for these wire-format headers,
or should byte swapping be handled explicitly prior to serialization?

[ ... ]
> +bitfield! {
> +    pub(crate) struct NvdmHeader(u32), "NVIDIA Vendor-Defined Message he=
ader over MCTP." {
> +        31:24 nvdm_type as u8 ?=3D> NvdmType, "NVDM message type.";
> +        23:8 vendor_id as u16, "PCI vendor ID.";
> +        6:0 msg_type as u8, "MCTP vendor-defined message type.";
> +    }
> +}

[Severity: High]
Similarly, does defining NvdmHeader as a native u32 expose the NVDM messages
to the same endianness corruption on big-endian platforms when sent over the
wire?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602032111.2247=
90-1-jhubbard@nvidia.com?part=3D16
