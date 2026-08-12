Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F198B430CCA;
	Wed, 12 Aug 2026 23:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786578244; cv=none; b=Y9NgFH8wpgryxT8OrKq57yYGHykV758779l9SzYn+bno64ew9gPWUdKz50vKgLV5gjVWEOn+7mjpQBgOALcAku8YfnwN/fml6qkWT7hZciKoCsmzH7OztX5QmP8t0Jgc3UHpeCa1W9vQan5tu7JeUORjO/hpKx8fO/h9CTSDxbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786578244; c=relaxed/simple;
	bh=bNYLaLg1bl/qgsNoelBcYQl/YypqE0xlSRIpA4YBJ6Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Q5Oqa2vtGwnSysTy03cbgi3baEEXc41C8udByUwgOIwsm6477dwRdo0NdfW+bkiiUrrOO/UQnOtCa0gyByNHNvxLpWqyCUaNMBKq4m3AGjxPe2m4YhQXO1NfFAEDn1UbhOXSMMnmO7wlgVOqgRKb5+WGCgDvxHBRRpPjNtMPiBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTRaB0u8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTRaB0u8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1AB31F000E9;
	Wed, 12 Aug 2026 23:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786578242;
	bh=qN1nHzHYc9IBamgWW2yAn7hhH8RW5Ex2R8ZyORav0sg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=cTRaB0u8/UBL3SSClUBBNIBqRw4pXYvnih8umtI2tBUEqCiQFvlO/DDZwf4qGHBn6
	 Jh2PrV0WgItWD1B4SRDk0Nbci6O5qzF6Alu+ocJDwubjZRttmhiuh1/MrKNAxM2E1N
	 Fot/pGW/5Xkd47UuhaN8kv+E+ATiXVvwCDZafgPT4XsumeTmUGucmWWhbhGg35qW9g
	 wCTK6dH4g0cHJfSDiQ70Apyk8kKZc0aclQoEEzJUvj46resDEOtmK+vyOFcJVZeYvz
	 fx6Ph5WHG/ewhsPf+BwCB7WpCwicuBB99NDDmdIBJD+CM7E17vldh+xKbWxf7dp8Jb
	 /ZXWkDK7V0n1g==
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 01:43:59 +0200
Message-Id: <DKND4OSMTWUQ.27FAHZ1JSUKYJ@kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: retain the GSP-RM log buffers
 after unbind
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>, <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Vladislav Zaharov" <vladazaharova2018@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260812113752.532537-1-vladazaharova2018@gmail.com>
 <20260812113752.532537-2-vladazaharova2018@gmail.com>
In-Reply-To: <20260812113752.532537-2-vladazaharova2018@gmail.com>

On Wed Aug 12, 2026 at 1:37 PM CEST, Vladislav Zaharov wrote:
>  struct LogBuffers {
> +    /// Device the buffers belong to. Also names their debugfs directory=
.
> +    #[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
> +    dev: ARef<device::Device>,
>      /// Init log buffer.
>      loginit: LogBuffer,
>      /// Interrupts log buffer.
> @@ -144,6 +167,127 @@ struct LogBuffers {
>      logrm: LogBuffer,
>  }
> =20
> +/// Copies of the log buffers of a GPU that is no longer around.
> +#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
> +struct RetainedLogBuffers {
> +    /// Device the buffers came from.
> +    dev: ARef<device::Device>,
> +    /// Contents of the init log buffer, empty if it was never written t=
o.
> +    loginit: KVec<u8>,
> +    /// Contents of the interrupts log buffer, empty if it was never wri=
tten to.
> +    logintr: KVec<u8>,
> +    /// Contents of the RM log buffer, empty if it was never written to.
> +    logrm: KVec<u8>,

I think those should use VVec.

> +}

Let's move all the LogBuffer code into gsp/logbuffer.rs to keep gsp.rs clea=
n.

> +#[cfg(CONFIG_NOVA_CORE_KEEP_GSP_LOGS)]
> +impl LogBuffers {
> +    /// Preserves whatever the GSP logged, so it can still be read once =
the GPU is gone.
> +    ///
> +    /// The buffers are DMA allocations of the device and cannot outlive=
 it, so their contents are
> +    /// copied into memory owned by the module and exposed through fresh=
 debugfs entries. Those
> +    /// live until the module is unloaded.
> +    fn retain(&self) -> Result {
> +        let logs =3D RetainedLogBuffers {
> +            dev: self.dev.clone(),
> +            loginit: self.loginit.snapshot()?,
> +            logintr: self.logintr.snapshot()?,
> +            logrm: self.logrm.snapshot()?,
> +        };
> +
> +        if logs.loginit.is_empty() && logs.logintr.is_empty() && logs.lo=
grm.is_empty() {
> +            return Ok(());
> +        }
> +
> +        let mut retained =3D crate::RETAINED_LOGS.lock();
> +
> +        // An earlier run of the same device may have left a copy behind=
. Its directory carries
> +        // the name about to be used again, and its logs are the older o=
nes, so drop it first.
> +        retained
> +            .gpus
> +            .retain(|gpu| gpu.dev.name() !=3D self.dev.name());
> +
> +        let dir =3D match retained.dir.clone() {
> +            Some(dir) =3D> dir,
> +            None =3D> {
> +                #[allow(static_mut_refs)]
> +                // SAFETY: `DEBUGFS_ROOT` is set before driver registrat=
ion and cleared after
> +                // driver unregistration. This runs while a device is st=
ill bound, or on the way
> +                // out of a failed probe, so the driver is registered an=
d nothing can be modifying
> +                // it.
> +                let root: &debugfs::Dir =3D unsafe { crate::DEBUGFS_ROOT=
.as_ref() }.ok_or(ENODEV)?;

I think we can avoid this additional unsafe if we just create the retained =
dir
right away in module_init().

> +
> +                let dir =3D root.subdir(c"retained");
> +                retained.dir =3D Some(dir.clone());
> +
> +                dir
> +            }
> +        };
> +
> +        let scope =3D KBox::pin_init(
> +            dir.scope(logs, self.dev.name(), |logs, dir| {
> +                if !logs.loginit.is_empty() {
> +                    dir.read_binary_file(c"loginit", &logs.loginit);
> +                }
> +                if !logs.logintr.is_empty() {
> +                    dir.read_binary_file(c"logintr", &logs.logintr);
> +                }
> +                if !logs.logrm.is_empty() {
> +                    dir.read_binary_file(c"logrm", &logs.logrm);
> +                }
> +            }),
> +            GFP_KERNEL,
> +        )?;
> +
> +        retained.gpus.push(scope, GFP_KERNEL)?;
> +
> +        dev_info!(

dev_dbg!() should be good enough.

> +            self.dev,
> +            "GSP-RM log buffers retained until the module is unloaded\n"
> +        );
> +
> +        Ok(())
> +    }
