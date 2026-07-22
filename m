Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAC447011A;
	Wed, 22 Jul 2026 07:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784706776; cv=none; b=BdeWyl+kRf3uCX7tNFdkUXE3KoMvswpyXNxV8tcKoTwAx2xi7gTUoPk5gHyXQj4ab1LSrSNzm3buYJgVTJnenvDtA9tzKCSO1v4SBbNlnXiAChWFl+IwuJtdzDbj3Tr+Y8ZJuwep8hhExr/NYDyUEQNY2hXnwn4l3ekwLMnYuUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784706776; c=relaxed/simple;
	bh=+970QuygzHZFXWK3mZwcqOAJTRfX++bUcmN09UILUI4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T80ZxQe5rxi6Xrsww2wzPiN680DVkvKFnKurHzTF5wzT82k0j4vFnvHThGZdP7labHbMIW5pqw8//quLcsFTNF9bQJpOGw8foO1DOxBswALIbU8O/w8xORy5lQdR+24M5e73nQiZbaD6GV4ODME6nz/SbMOzdC4MBqGR1Gbr+v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNbdr6Ba; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNbdr6Ba"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DDB1F00A3D;
	Wed, 22 Jul 2026 07:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784706775;
	bh=/4/awcJLk2CBo0cg4l+Lm05UCvA1ckXEEkHaTZw+nCM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CNbdr6BaN/857h9OGBWJ87jtPQs9o93M7q/orK/vD8dnnBqO9tt1E9KF90h74FdEZ
	 ztRpD00IwaROLFZksnL3NmrFtyb169zTTtjRJL051o1vnwPrMU8/CkmqsttEgeII3t
	 YUlSfoKDmUOucSNuPvu0xYkGLUyrBn+rHot4g09FMLuYscfCZRnhsnHwh+zRVvMBCF
	 qg75TlTtN/kvD7RXOCJcCbcSOKa19DVM+/XkEb0Gle7uH0dkeITjnLrDfltqQt4Tos
	 OF93wvWcrqzVRYCL7EXrC16uUDuOKEouVhYAF3Ua8WjnIyZ62OuElIvmDmn0rygbU2
	 cT4rn09z1VBZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] gpu: nova-core: set RMSetSriovMode for vGPU
Reply-To: sashiko-reviews@lists.linux.dev
To: dakr@kernel.org, acourbot@nvidia.com, "Zhi Wang" <zhiw@nvidia.com>
Cc: linux-kernel@vger.kernel.org, kjaju@nvidia.com, nova-gpu@lists.linux.dev, simona@ffwll.ch, alkumar@nvidia.com, zhiwang@kernel.org, smitra@nvidia.com, aniketa@nvidia.com, boqun.feng@gmail.com, "Danilo
 Krummrich" <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, cjia@nvidia.com, gary@garyguo.net, lossin@kernel.org, targupta@nvidia.com, jhubbard@nvidia.com, ankita@nvidia.com, apopple@nvidia.com, tmgross@umich.edu, kwankhede@nvidia.com, alex.gaynor@gmail.com, bjorn3_gh@protonmail.com, ecourtney@nvidia.com, joelagnelf@nvidia.com, airlied@gmail.com, a.hindborg@kernel.org, ojeda@kernel.org, aliceryhl@google.com
In-Reply-To: <20260722073913.1807677-6-zhiw@nvidia.com>
References: <20260722073913.1807677-1-zhiw@nvidia.com>
 <20260722073913.1807677-6-zhiw@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 07:52:53 +0000
Message-Id: <20260722075253.B6DDB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `size` field in the `PACKED_REGISTRY_TABLE` header is initiali=
zed incorrectly, causing the string data offsets to exceed the advertised t=
able size.
--

--- Patch [5]: [PATCH v5 5/6] gpu: nova-core: set RMSetSriovMode for vGPU -=
--
commit 7a8618e853f5431c98f463e1cf9330f35e524af1
Author: Zhi Wang <zhiw@nvidia.com>

gpu: nova-core: set RMSetSriovMode for vGPU
   =20
The GSP registry setup needs to advertise SR-IOV mode when nova-core boots
GSP for an enabled vGPU configuration. Without the registry entry, GSP-RM
is not told to initialize in the mode required by NVIDIA vGPU.

> diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-cor=
e/gsp/commands.rs
> index 08380de39048a..134f34b191744 100644
> --- a/drivers/gpu/nova-core/gsp/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/commands.rs
[ ... ]
> @@ -104,6 +105,17 @@ pub(crate) fn new() -> Result<Self> {
>              GFP_KERNEL,
>          )?;
> =20
> +        if matches!(vgpu_state, VgpuState::Enabled { .. }) {
> +            // RMSetSriovMode - required when vGPU is enabled.
> +            entries.push(
> +                RegistryEntry {
> +                    key: "RMSetSriovMode",
> +                    value: 1,
> +                },
> +                GFP_KERNEL,
> +            )?;
> +        }
> +
>          Ok(Self { entries })
>      }
>  }

[Severity: High]
This isn't a bug introduced by this patch, but the size field in the
PACKED_REGISTRY_TABLE appears to be initialized incorrectly, which might ca=
use
the newly added RMSetSriovMode entry to silently fail or cause out-of-bounds
reads.

Looking at SetRegistry::init() in this same file:

drivers/gpu/nova-core/gsp/commands.rs:SetRegistry::init() {
    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
        Self::Command::init(
            self.entries.len() as u32,
            self.variable_payload_len() as u32,
        )
    }
}

Does this initialize the size using only the payload length, omitting the
8-byte table header itself?=20

Since the string offsets calculated in init_variable_payload() correctly
include the 8-byte header size, won't the end of the string data exceed the
advertised table size by exactly 8 bytes?

Could this cause the GSP firmware to truncate the registry entries or perfo=
rm
an out-of-bounds read?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722073913.1807=
677-1-zhiw@nvidia.com?part=3D5
