Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602085;
	b=ab/WM84BTZ4U/9+LCCXwoGR7ts0YZaG8pMOyTpflwdHCsNT+8pRdqPS29GxQAiRYXTaD
	 8Sa8Z6TyL7IRWSSvilSMcWNRRWfuVHxoPvLNZ4keJxKzDFBYLpxaNzUPzNRlnzSt5oNnm
	 TI+zOPZ/nUF/s29c79L6vuOKg+2AsBx8aFqAYpFaP5+7UXEtXVu9SK2vHPJamYhHfneDo
	 aaYBS2W/i3Jle5iIIpEY1fxYnRrZLDAS9e5T4DS46hS08wlNVXUzkNEmuhe1hKL8+IVtJ
	 Ig8GfaXBYb1V3xaq9rnnSOPJ4vQfC5CqQ6jJwsk1d5HD0XJSBupJ0IOzcIcp923vOFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602085;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:To:From:Subject:References:
	 In-Reply-To;
	bh=chagpPiOJxprpG/hdf86c1muJoBTZxJZoVzH/xjU+ZQ=;
	b=O+2kzUhFGqASDrv8du45M1ftjzYSQblmJHSfufW3gz4ykTqctqzleq8MpuSZqVAvv+Oh
	 XAAbWsyY3yk3zAvas6qw1uhxpmNbeL86ECGoh0lWhik04rwMFBS0KNrWNZBo3eX3jV3vl
	 G1j8GO2PV7qvdMMhoIofxBwMzgzGNOUVD6Tzzs/L0nigv2FByeQT3jGhZy7lUzoiR+hMj
	 f+BmMQmF7MdYVjJkKw/YqqCmky6RrJnGq9YQMMIByURpTYU8nMihGn66dl28aFT6WkZbt
	 3zFyMfvEkJfeG1h6t/x493aDrGBbc4lvM7KFzoHAQEuU/fVgqqmg2SnuA0uz+wQmjBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iHGOBo3W;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA285606A339;
	Fri, 13 Nov 2026 20:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iHGOBo3W
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0034A1F000C4;
	Fri, 13 Nov 2026 20:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602084;
	bh=chagpPiOJxprpG/hdf86c1muJoBTZxJZoVzH/xjU+ZQ=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=iHGOBo3WPjRpMs838TxLT+hWWAHjljZd0PbM6Xf+MYGsCKozw+kX3KMTqnuXmXfOw
	 nwP/85NARDRoVzjTo9RKGPhem7hitaJCHib2MnSNh3FkmHw1gaL1wWAqsijSJrZJou
	 7xZKyDJNQzPSEQROIc3k3NWCdnIpt4bd9sPNrxvpOYZYQF+iZhKtE/rPVWI7oSDW5K
	 gcBbnh630gh3YSbmB+0iKdlMuccPzviptphTPe4WdOobblJEANSqifzFox5CRmqTLj
	 lmVfGI+Etaa/VuNazlF1vAjFE2ka4JGp2blVKGIEELiF7ihDujG+cw7FGgvsJL7iw1
	 DgUpmTroewJUQ==
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 21:34:31 +0100
Message-Id: <DMUDCA92VZHT.2SU4452MMGWL@kernel.org>
Cc: <jhubbard@nvidia.com>, <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <ttabi@nvidia.com>, <gary@garyguo.net>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
To: "Vladislav Zaharov" <vladazaharova2018@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 3/4] gpu: nova-core: gsp: retain the GSP-RM log
 buffers after unbind
References: <20261113075317.934264-1-vladazaharova2018@gmail.com>
 <20261113075317.934264-4-vladazaharova2018@gmail.com>
In-Reply-To: <20261113075317.934264-4-vladazaharova2018@gmail.com>

On Fri Nov 13, 2026 at 8:53 AM CET, Vladislav Zaharov wrote:
> +    /// Returns the copies of the GSP-RM log buffers of GPUs that are no=
 longer bound.
> +    pub(crate) fn retained_logs(&self) -> &Mutex<RetainedLogs> {
> +        &self.retained_logs
> +    }

NIT: Should be #[inline].

> +    /// Exposes copies of the buffers in their place, if `gsp_keep_logs`=
 is set.
> +    fn retain(&self) -> Result {
> +        if !crate::module_parameters::gsp_keep_logs.value() || !cfg!(CON=
FIG_DEBUG_FS) {
> +            return Ok(());
> +        }

This misses debugfs being disabled through the kernel command line with
debugfs=3Doff.

Usually, drivers should treat debugfs availability as opaque. The Rust
abstraction keeps its backing data alive regardless of whether the entries =
were
created.

Here, the copies serve no purpose without debugfs, so checking availability
would have a concrete benefit. However, I don't think this case warrants
exposing debugfs::initialized(), which could be abused easily and encourage
unnecessary checks elsewhere.

Let's check only gsp_keep_logs.

> +
> +        let logs =3D RetainedLogBuffers {
> +            name: CString::try_from_fmt(fmt!("{}", self.dev.name()))?,
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
> +        // Allocate before an earlier copy is dropped, so that a failure=
 leaves that copy in place.
> +        let scope =3D KBox::<debugfs::Scope<RetainedLogBuffers>>::new_un=
init(GFP_KERNEL)?;
> +        let data =3D NovaCoreModule::debugfs_data(self.dev);
> +        let root =3D data.root();
> +        let mut retained =3D data.retained_logs().lock();
> +        retained.0.reserve(1, GFP_KERNEL)?;

This shouldn't be necessary.

> +
> +        retained.remove(self.dev.name());
> +
> +        let scope =3D scope.write_pin_init(root.scope(logs, self.dev.nam=
e(), |logs, dir| {
> +            if !logs.loginit.is_empty() {
> +                dir.read_binary_file(c"loginit", &logs.loginit);
> +            }
> +            if !logs.logintr.is_empty() {
> +                dir.read_binary_file(c"logintr", &logs.logintr);
> +            }
> +            if !logs.logrm.is_empty() {
> +                dir.read_binary_file(c"logrm", &logs.logrm);
> +            }
> +        }))?;
> +
> +        retained.0.push(scope, GFP_KERNEL)?;

Please add a forwarding method for this.
